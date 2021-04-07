<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;


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

        context.Response.Write(filePath);

        string[] fileArray = Directory.GetFiles(filePath);

        if (fileArray.Length == 0)
        {
            context.Response.Write("The directory is empty");
        }
        else
        {
            for (var i = 0; i < fileArray.Length; i++)
            {

                if (!(fileArray[i].IndexOf(".rw") > 0))
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