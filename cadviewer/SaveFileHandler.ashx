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

        context.Response.ContentType = "text/plain";

        string filePath =  DecodeUrlString(context.Request["file"]).Trim('/');
        string fileContent = context.Request["file_content"];


        string customContent = context.Request["custom_content"];

        // we need to create the filePath folder
        //string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        //Directory.CreateDirectory(tmpPrintFolder);

        //string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        //File.WriteAllText(absFilePath, fileContent);



        var folder = filePath.Substring(0, filePath.LastIndexOf("/"));

        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);
        }





        string localPath = filePath;

        try {
            localPath = new Uri(filePath).LocalPath;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }


        try {
            File.WriteAllText(localPath, fileContent);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }




        context.Response.ContentType = "text/plain";
        context.Response.Write("Post Succes");

        //    context.Response.Write(customContent);


    }


    private void DoGet(HttpContext context)
    {

        string filePath =  DecodeUrlString(context.Request["file"]).Trim('/');
        string fileContent = context.Request["file_content"];

        // we need to create the filePath folder
        //string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        //Directory.CreateDirectory(tmpPrintFolder);

        //string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        //File.WriteAllText(absFilePath, fileContent);
        File.WriteAllText(filePath, fileContent);

        context.Response.ContentType = "text/plain";
        context.Response.Write("Succes");
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

    private static string DecodeUrlString(string url) {
        string newUrl;
        while ((newUrl = Uri.UnescapeDataString(url)) != url)
            url = newUrl;
        return newUrl;
    }

}