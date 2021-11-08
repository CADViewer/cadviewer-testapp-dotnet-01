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

        string filePath =  DecodeUrlString(context.Request["file"]).Trim('/');
        string fileContent = context.Request["file_content"];
        string customContent = context.Request["custom_content"];


        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
        string AppLocation = ConfigurationManager.AppSettings["AppLocation"];


        try{

            string listtype = context.Request["listtype"].Trim('/');

            if (listtype.IndexOf("serverfolder") == 0)
            {
                if (filePath.IndexOf(ServerUrl) == 0)
                {
                    // do nothing 
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
            //File.WriteAllText(localPath, fileContent);
            File.AppendAllText(localPath, fileContent);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }




        context.Response.ContentType = "text/plain";
        context.Response.Write("Post Succes");

        //    context.Response.Write(customContent);



/*

        string filePath = context.Request["file"].Trim('/');
        string fileContent = context.Request["file_content"];

        string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        Directory.CreateDirectory(tmpPrintFolder);

        string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        File.AppendAllText(absFilePath, fileContent);

        context.Response.ContentType = "text/plain";
        context.Response.Write("Succes");

*/







    }


    private void DoGet(HttpContext context)
    {

        string filePath = context.Request["file"].Trim('/');
        string fileContent = context.Request["file_content"];

        string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_print");
        Directory.CreateDirectory(tmpPrintFolder);

        string absFilePath = Path.Combine(tmpPrintFolder, filePath);

        //context.Response.Write(absFilePath);

        File.AppendAllText(absFilePath, fileContent);

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