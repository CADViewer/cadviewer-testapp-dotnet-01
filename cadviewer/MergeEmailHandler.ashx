<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Configuration;
using System.Text;
using System.Web.Script.Serialization;
using System.Net;
using System.Diagnostics;
using System.ComponentModel;
using System.Text.RegularExpressions;
using EASendMail;
//using Newtonsoft.Json;
//using Newtonsoft.Json.Linq;


public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {


        if (context.Request.HttpMethod.Equals("GET"))
        {
            DoGet(context);

            //    context.Response.Write("Hello World GET");

        }
        if (context.Request.HttpMethod.Equals("POST"))
        {
            DoPost(context);

            //    context.Response.Write("Hello World POST");
        }



    }

    private void DoGet(HttpContext context)
    {
        DoPost(context);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    private void DoPost(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");

        try
        {


            string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
            string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
            string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
            string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];
            string converterLocation = ConfigurationManager.AppSettings["converterLocation"];
            string ax2020_executable = ConfigurationManager.AppSettings["ax2020_executable"];
            string licenseLocation = ConfigurationManager.AppSettings["licenseLocation"];
            string xpathLocation = ConfigurationManager.AppSettings["xpathLocation"];
            string callbackMethod = ConfigurationManager.AppSettings["callbackMethod"];
            string cvjs_debug = ConfigurationManager.AppSettings["cvjs_debug"];


            string MailServer = ConfigurationManager.AppSettings["MailServer"];
            int MailServerPort = Int32.Parse(ConfigurationManager.AppSettings["MailServerPort"]);
            string MailUserName = ConfigurationManager.AppSettings["MailUserName"];
            string MailPassword = ConfigurationManager.AppSettings["MailPassword"];

            //var jsonSerializer = new JavaScriptSerializer();

            //var myRequest = context.Request;


            var myRequest = String.Empty;
            context.Request.InputStream.Position = 0;
            using (var inputStream = new StreamReader(context.Request.InputStream))
            {
                myRequest = inputStream.ReadToEnd();
            }

            // */ 
            myRequest = DecodeUrlString(myRequest);

            //context.Response.Write(myRequest);
            string to_mail = myRequest.Substring( (myRequest.IndexOf("to_mail")+8), (myRequest.IndexOf( "&", myRequest.IndexOf("to_mail")+8)) - (myRequest.IndexOf("to_mail")+8));
            string pdf_file = myRequest.Substring( (myRequest.IndexOf("pdf_file")+9), (myRequest.IndexOf( "&", myRequest.IndexOf("pdf_file")+9)) - (myRequest.IndexOf("pdf_file")+9));
            string mail_title = myRequest.Substring( (myRequest.IndexOf("mail_title")+11), (myRequest.IndexOf( "&", myRequest.IndexOf("mail_title")+11)) - (myRequest.IndexOf("mail_title")+11) );
            string from_mail = myRequest.Substring( (myRequest.IndexOf("from_mail")+10), (myRequest.IndexOf( "&", myRequest.IndexOf("from_mail")+10)) - (myRequest.IndexOf("from_mail")+10) );
            string pdf_file_name = myRequest.Substring( (myRequest.IndexOf("pdf_file_name")+14), (myRequest.IndexOf( "&", myRequest.IndexOf("pdf_file_name")+14)) - (myRequest.IndexOf("pdf_file_name")+14));
            string listtype = myRequest.Substring( (myRequest.IndexOf("listtype")+9), (myRequest.IndexOf( "&", myRequest.IndexOf("listtype")+9)) - (myRequest.IndexOf("listtype")+9));
            //            string mail_message = myRequest.Substring( (myRequest.IndexOf("mail_message")+13), (myRequest.IndexOf( "&", myRequest.IndexOf("mail_message")+13)) -(myRequest.IndexOf("mail_message")+13) );
            string mail_message = myRequest.Substring(myRequest.IndexOf("mail_message")+13);




                           // context.Response.Write("listtype:" + listtype);


           try{

            if (listtype.IndexOf("serverfolder") == 0)
            {
                if (pdf_file.IndexOf(ServerUrl) == 0)
                {
                    // do nothing 
                }
                else
                    pdf_file = ServerLocation + pdf_file;
            }
            }
            catch(Exception ee){
                Console.WriteLine(ee.Message);

            }




            /*
                        context.Response.Write("XX"+to_mail+"XX");
                        context.Response.Write("XX"+mail_message+"XX");
                        context.Response.Write("XX"+pdf_file+"XX");
                        context.Response.Write("XX"+mail_title+"XX");
                        context.Response.Write("XX"+from_mail+"XX");
                        context.Response.Write("XX"+pdf_file_name+"XX");
            */

            /*
             * dynamic jobj;
            try
            {
                jobj = JObject.Parse(myRequest);
                to_mail = jobj.to_mail;
                pdf_file = jobj.pdf_file;
                mail_title = jobj.mail_title;
                mail_message = jobj.mail_message;
                from_mail = jobj.from_mail;
                context.Response.Write(to_mail);
            }
            catch(Exception e) { context.Response.Write("parse"); }
                
            */

            SmtpMail oMail = new SmtpMail("TryIt");

            // Set sender email address, please change it to yours
            oMail.From = from_mail;
            // Set recipient email address, please change it to yours
            oMail.To = to_mail;

            // Set email subject
            oMail.Subject = mail_title;
            // Set Html body
            oMail.HtmlBody = mail_message;

            string localPath = new Uri(pdf_file).LocalPath;
            byte[] bytes = new byte[1];  // dummy declaration

            try
            {
                using (FileStream fsSource = new FileStream(localPath, FileMode.Open, FileAccess.Read))
                {
                    bytes = new byte[fsSource.Length];
                    // Read the source file into a byte array.
                    int numBytesToRead = (int)fsSource.Length;
                    int numBytesRead = 0;
                    while (numBytesToRead > 0)
                    {
                        // Read may return anything from 0 to numBytesToRead.
                        int n = fsSource.Read(bytes, numBytesRead, numBytesToRead);

                        // Break when the end of the file is reached.
                        if (n == 0)
                            break;

                        numBytesRead += n;
                        numBytesToRead -= n;
                    }
                }
            }
            catch (FileNotFoundException ioEx)
            {
                context.Response.Write("load file error: "+ioEx.Message);
            }

            // Add attachment from local disk
            oMail.AddAttachment( pdf_file_name, bytes);

            // Add attachment from remote website
            //oMail.AddAttachment("http://www.emailarchitect.net/webapp/img/logo.jpg");

            // Your SMTP server address
            SmtpServer oServer = new SmtpServer(MailServer);

            // User and password for ESMTP authentication
            oServer.User = MailUserName;
            oServer.Password = MailPassword;

            // Most mordern SMTP servers require SSL/TLS connection now.
            // ConnectTryTLS means if server supports SSL/TLS, SSL/TLS will be used automatically.
            oServer.ConnectType = SmtpConnectType.ConnectTryTLS;

            // If your SMTP server uses 587 port
            // oServer.Port = 587;

            // If your SMTP server requires SSL/TLS connection on 25/587/465 port
            oServer.Port = MailServerPort;                          // 25 or 587 or 465
            oServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

            //Console.WriteLine("start to send email with attachment ...");
            SmtpClient oSmtp = new SmtpClient();

            //context.Response.Write("before send");

            oSmtp.SendMail(oServer, oMail);
            context.Response.Write("email was sent successfully!");
        }
        catch (Exception ep)
        {
            context.Response.Write("failed to send email with the following error:" + ep.Message);
        }

    }


    private static string DecodeUrlString(string url) {
        string newUrl;
        while ((newUrl = Uri.UnescapeDataString(url)) != url)
            url = newUrl;
        return newUrl;
    }

}