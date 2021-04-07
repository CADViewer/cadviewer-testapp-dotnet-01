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
        context.Response.Write("Not Implemented");

    }


    private void DoGet(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        context.Response.Write("Not Implemented");

    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}