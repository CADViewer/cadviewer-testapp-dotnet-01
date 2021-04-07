<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {


        if (context.Request.HttpMethod.Equals("GET"))
        {
            DoGet(context);

            //context.Response.Write(" Hello World GET");

        }
        if (context.Request.HttpMethod.Equals("POST"))
        {
            DoPost(context);

            //context.Response.Write(" Hello World POST");
        }

    }


    private void DoPost(HttpContext context)
    {

        string filePath = context.Request["file"].Trim('/');
        string fileContent = context.Request["file_content"];

        string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        Directory.CreateDirectory(tmpPrintFolder);

        string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        File.WriteAllText(absFilePath, fileContent);

        context.Response.ContentType = "text/plain";
        context.Response.Write("Succes");

    }


    private void DoGet(HttpContext context)
    {

        string filePath = context.Request["file"].Trim('/');
        string fileContent = context.Request["file_content"];

        string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        Directory.CreateDirectory(tmpPrintFolder);

        string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        File.WriteAllText(absFilePath, fileContent);

        context.Response.ContentType = "text/plain";
        context.Response.Write("Succes");
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}