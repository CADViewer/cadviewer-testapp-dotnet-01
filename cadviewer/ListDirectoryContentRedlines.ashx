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

        string  filePath = context.Request["directory"].Trim('/');

        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
        string AppLocation = ConfigurationManager.AppSettings["AppLocation"];

        context.Response.Write(filePath);

        try
        {
            string loadtype = context.Request["listtype"].Trim('/');
            if (loadtype.IndexOf("serverfolder") == 0)
            {

                 if (filePath.IndexOf(ServerUrl) == 0)
                    {
                        //do nothing!! - handle below
                    }
                 else
                    filePath = ServerLocation + filePath;
            }

        }
        catch(Exception ee){
            Console.WriteLine(ee.Message);

        }

        if (filePath.IndexOf(ServerUrl) == 0)
        {
            filePath = ServerLocation + filePath.Substring(ServerUrl.Length);
        }



        string[] fileArray = Directory.GetFiles(filePath);

        if (fileArray.Length == 0)
        {
            context.Response.Write("The directory is empty");
        }
        else
        {
            for (var i = 0; i < fileArray.Length; i++)
            {

                if ((fileArray[i].IndexOf(".js") > 0))
                    context.Response.Write("<br>" + fileArray[i].Substring(fileArray[i].LastIndexOf("\\")+1));
            }
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