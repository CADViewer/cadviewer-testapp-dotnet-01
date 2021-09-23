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
        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        context.Response.Write(ServerLocation);

    }


    private void DoGet(HttpContext context)
   {

        context.Response.ContentType = "text/plain";
        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        context.Response.Write(ServerLocation);
   }



public bool IsReusable {
    get {
        return false;
    }
}

}