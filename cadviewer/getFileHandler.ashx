<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Configuration;
using System.Text;


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


    private void DoPost(HttpContext context)
    {

        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        //       context.Response.ContentType = "text/plain";

        string fileTag = context.Request["fileTag"].Trim('/');
        string fileType = context.Request["Type"];
        string remainOnServer = context.Request["remainOnServer"];

        if (fileType == "svg")
        {
            context.Response.ContentType = "image/svg+xml";
        }
        else
            if (fileType == "svgz")
        {
            context.Response.AddHeader("Content-Encoding", "gzip");
            context.Response.ContentType = "image/svg+xml";
        }
        else
            context.Response.ContentType = "text/plain";


        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];

        string localPath = fileLocation + fileTag +"." + fileType;

        //context.Response.Write("Hello "+localPath+"  "+remainOnServer+"  ");
        try
        {

            using (FileStream fsSource = new FileStream(localPath, FileMode.Open, FileAccess.Read))
            {

                // Read the source file into a byte array.
                byte[] bytes = new byte[fsSource.Length];
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
                numBytesToRead = bytes.Length;

                UTF8Encoding temp = new UTF8Encoding(true);

                context.Response.Write(temp.GetString(bytes));

                context.Response.End();

            }
        }
        catch (FileNotFoundException ioEx)
        {
            Console.WriteLine(ioEx.Message);
        }


        if (remainOnServer == "0")
        {

            File.Delete(localPath);

        }


    }


    private void DoGet(HttpContext context)
    {

        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        //context.Response.ContentType = "text/plain";

        string fileTag = context.Request["fileTag"].Trim('/');
        string fileType = context.Request["Type"];
        string remainOnServer = context.Request["remainOnServer"];

        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];

        string localPath = fileLocation + fileTag +"." + fileType;

        if (fileType == "svg")
        {
            context.Response.ContentType = "image/svg+xml";
        }
        else
        if (fileType == "svgz")
        {
            context.Response.AddHeader("Content-Encoding", "gzip");
            context.Response.ContentType = "image/svg+xml";
        }
        else
            context.Response.ContentType = "text/plain";

        //context.Response.Write("Hello "+localPath+"  "+remainOnServer+"  ");

        try
        {

            using (FileStream fsSource = new FileStream(localPath, FileMode.Open, FileAccess.Read))
            {

                // Read the source file into a byte array.
                byte[] bytes = new byte[fsSource.Length];
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
                numBytesToRead = bytes.Length;


                if (fileType == "svgz")
                {
                    context.Response.OutputStream.Write(bytes, 0, bytes.Length);
                }
                else
                {
                    UTF8Encoding temp = new UTF8Encoding(true);
                    context.Response.Write(temp.GetString(bytes));
                }

            }
        }
        catch (FileNotFoundException ioEx)
        {
            Console.WriteLine(ioEx.Message);
        }


        if (remainOnServer == "0")
        {

            File.Delete(localPath);

        }

    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}