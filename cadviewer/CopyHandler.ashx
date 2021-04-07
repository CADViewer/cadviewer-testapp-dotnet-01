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


        context.Response.AddHeader("Access-Control-Allow-Origin", "*");

        try
        {
            string localFile = context.Request["localfilename"];
            string localDestination = context.Request["localdestination"];

  /*
            if (File.Exists(localDestination))
            {
                File.Delete(localDestination);
            }
   */

            File.Copy(localFile,localDestination, true);

        }
        catch (Exception e)
        {

            context.Response.ContentType = "text/plain";
            context.Response.Write("Error " + e+ "  ");
        }





        /*

                byte[] bytes;

                try
                {

                    using (FileStream fsSource = new FileStream(localFile, FileMode.Open, FileAccess.Read))
                    {

                        bytes = new byte[fsSource.Length];
                        int numBytesToRead = (int)fsSource.Length;
                        // Read the source file into a byte array.
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

                        string localPath = localDestination;
                        localPath = new Uri(localDestination).LocalPath;

                        File.WriteAllText(localPath, temp.GetString(bytes));

                    }
                }
                catch (FileNotFoundException ioEx)
                {
                    Console.WriteLine(ioEx.Message);
                }


                context.Response.ContentType = "text/plain";
                context.Response.Write("Succes");

                */

    }


    private void DoGet(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        context.Response.Write("CopyHandler.ashx - doGet not Succes");

    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}