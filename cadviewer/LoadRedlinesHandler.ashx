<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Text;
using System.Configuration;


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

        context.Response.ContentType = "text/plain";

        string filePath = context.Request["file"].Trim('/');

        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];

        if (filePath.IndexOf(ServerUrl) == 0)
        {
            filePath = ServerLocation + filePath.Substring(ServerUrl.Length);
        }
        string localPath = new Uri(filePath).LocalPath;



        //        string localPath = new Uri(filePath).LocalPath;


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

            }
        }
        catch (FileNotFoundException ioEx)
        {
            Console.WriteLine(ioEx.Message);
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

}