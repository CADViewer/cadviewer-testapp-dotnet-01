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


    private void DoPost(HttpContext context)
    {

        context.Response.ContentType = "text/plain";


        try {


        string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
        string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
        string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
        string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];
        string converterLocation = ConfigurationManager.AppSettings["converterLocation"];
        string ax2020_executable = ConfigurationManager.AppSettings["ax2020_executable"];
        string licenseLocation = ConfigurationManager.AppSettings["licenseLocation"];
        string xpathLocation = ConfigurationManager.AppSettings["xpathLocation"];
        string callbackMethod = ConfigurationManager.AppSettings["callbackMethod"];
        string cvjs_debug = ConfigurationManager.AppSettings["cvjs_debug"];

        string[] myoutput = new String[1];
        string absFilePath = "";
        if (cvjs_debug == "true") {
            string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_debug");
            Directory.CreateDirectory(tmpPrintFolder);
            absFilePath = Path.Combine(tmpPrintFolder, "makeSinglePagePDF.txt");
            //context.Response.Write(absFilePath);
        }

        String fileName = context.Request["fileName_0"];
        String rotation = context.Request["rotation_0"];
        String pageformat = context.Request["page_format_0"];
        String base64_file = fileLocation + "\\" + fileName + "_base64.png";

        String base64_content = System.IO.File.ReadAllText(base64_file);
        //strip out bas64


        //        myoutput[0] = " base64: "+base64_content+" XXX ";
        //        File.AppendAllLines(absFilePath, myoutput);


        //string imageResult = Regex.Replace(base64_content, "^data:image\/[a-zA-Z]+;base64,", string.empty);

        String[] substrings = base64_content.Split(',');

        string header = substrings[0];
        string imgData = substrings[1];


        myoutput[0] = " header: "+header+" XXX "+ServerLocation + fileName;
        File.AppendAllLines(absFilePath, myoutput);

        byte[] bytes = Convert.FromBase64String(imgData);

        // save image
        File.WriteAllBytes(fileLocation + fileName + ".png", bytes);

        // convert image
        String arguments = "-i=" + fileLocation + fileName + ".png -o=" + fileLocation + fileName + ".pdf -f=pdf -model -" + rotation + " -" + pageformat;



        myoutput[0] = " arguments: "+arguments;
        File.AppendAllLines(absFilePath, myoutput);



      

            myoutput[0] = " arguments: "+arguments+" XXX ";
            File.AppendAllLines(absFilePath, myoutput);


            ProcessStartInfo ProcessInfo;

            ProcessInfo = new ProcessStartInfo(converterLocation + ax2020_executable, arguments);
            ProcessInfo.CreateNoWindow = true;
            ProcessInfo.UseShellExecute = false;
            ProcessInfo.WorkingDirectory =converterLocation;
            // *** Redirect the output ***
            ProcessInfo.RedirectStandardError = true;
            ProcessInfo.RedirectStandardOutput = true;

            Process myProcess;

            myProcess = Process.Start(ProcessInfo);
            myProcess.WaitForExit();

            // *** Read the streams ***
            string output = myProcess.StandardOutput.ReadToEnd();
            string error = myProcess.StandardError.ReadToEnd();

            int exitCode = myProcess.ExitCode;

            myoutput[0] ="output>>" + (String.IsNullOrEmpty(output) ? "(none)" : output);
            File.AppendAllLines(absFilePath, myoutput);

            myoutput[0] ="error>>" + (String.IsNullOrEmpty(error) ? "(none)" : error);
            File.AppendAllLines(absFilePath, myoutput);

            myoutput[0] = "ExitCode: " + exitCode.ToString();
            File.AppendAllLines(absFilePath, myoutput);

            myProcess.Close();


            // 9.38.6


            //context.Response.Write(fileName + ".pdf"); 

            context.Response.Write(fileLocationUrl+"/"+fileName + ".pdf"); 
                



        }
        catch (Exception e)
        {

            context.Response.Write(e); 

        }

    }


}