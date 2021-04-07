<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Configuration;
using System.Text;
using System.Web.Script.Serialization;
using System.Net;
using System.Diagnostics;
using System.ComponentModel;
using System.Text.RegularExpressions;


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


        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
        string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];
        string converterLocation = ConfigurationManager.AppSettings["converterLocation"];
        string ax2020_executable = ConfigurationManager.AppSettings["ax2020_executable"];
        string dwgmergeLocation = ConfigurationManager.AppSettings["dwgmergeLocation"];
        string dwgmerge_executable = ConfigurationManager.AppSettings["dwgmerge_executable"];
        string licenseLocation = ConfigurationManager.AppSettings["licenseLocation"];
        string xpathLocation = ConfigurationManager.AppSettings["xpathLocation"];
        string callbackMethod = ConfigurationManager.AppSettings["callbackMethod"];
        string cvjs_debug = ConfigurationManager.AppSettings["cvjs_debug"];
        string cp_commands = "";


        try
        {

            string baseFile = DecodeUrlString(context.Request["base_file"]).Trim('/');
            string mergeFile = DecodeUrlString(context.Request["merge_file"]).Trim('/');
            string outFile = DecodeUrlString(context.Request["out_file"]).Trim('/');



            if (baseFile == "none")
                cp_commands = "-merge=\"" + mergeFile + "\" -out=\"" + outFile + "\" -over -lpath=\"" + dwgmergeLocation + "\"";
            else
                cp_commands = "-base=\"" + baseFile + "\" -merge=\"" + mergeFile + "\" -out=\"" + outFile + "\" -over -lpath=\"" + dwgmergeLocation + "\"";

            int exitCode = 0;
            ProcessStartInfo ProcessInfo;

            ProcessInfo = new ProcessStartInfo(dwgmergeLocation + dwgmerge_executable, cp_commands);
            //              ProcessInfo = new ProcessStartInfo(str_arr[0], arguments);

            ProcessInfo.CreateNoWindow = true;
            ProcessInfo.UseShellExecute = false;
            ProcessInfo.WorkingDirectory = converterLocation;
            // *** Redirect the output ***
            ProcessInfo.RedirectStandardError = true;
            ProcessInfo.RedirectStandardOutput = true;

            Process myProcess;

            myProcess = Process.Start(ProcessInfo);
            myProcess.WaitForExit();

            // *** Read the streams ***
            string output = myProcess.StandardOutput.ReadToEnd();
            string error = myProcess.StandardError.ReadToEnd();

            exitCode = myProcess.ExitCode;

            context.Response.ContentType = "text/plain";
            context.Response.Write("Succes:  "+dwgmergeLocation + dwgmerge_executable+"  "+cp_commands);

        }
        catch (Exception e)
        {

            context.Response.ContentType = "text/plain";
            context.Response.Write("Error " + e+ "  "+dwgmergeLocation + dwgmerge_executable+"  "+cp_commands);
        }

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

    private static string DecodeUrlString(string url) {
        string newUrl;
        while ((newUrl = Uri.UnescapeDataString(url)) != url)
            url = newUrl;
        return newUrl;
    }


}