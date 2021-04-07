<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
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

        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
        string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];

        string returnString = fileLocation + "|" + fileLocationUrl;

        context.Response.ContentType = "text/plain";
        context.Response.Write(returnString);
    }


    private void DoGet(HttpContext context)
    {

        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
        string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];

        string returnString = fileLocation + "|" + fileLocationUrl;

        context.Response.ContentType = "text/plain";
        context.Response.Write(returnString);

    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}