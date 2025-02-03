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

        context.Response.ContentType = "text/plain";

        context.Response.AddHeader("Access-Control-Allow-Origin", "*");


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
        // 20.05.52a
        string svgz_compress = ConfigurationManager.AppSettings["svgz_compress"];


        // 8.56.4
        string useoriginatinglocation = ConfigurationManager.AppSettings["useoriginatinglocation"];
        string callbackMethod_originatinglocation = ConfigurationManager.AppSettings["callbackMethod_originatinglocation"];
        if (useoriginatinglocation == null) useoriginatinglocation = "false";
        // 8.56.4



        string[] myoutput = new String[1];
        string absFilePath = "";
        if (cvjs_debug == "true") {

            string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_debug");
            Directory.CreateDirectory(tmpPrintFolder);
            absFilePath = Path.Combine(tmpPrintFolder, "callApiConversionHandlerLog_"+Get8CharacterRandomString()+".txt");
            //context.Response.Write(absFilePath);
        }


        var jsonSerializer = new JavaScriptSerializer();
        var myRequest = String.Empty;

        context.Request.InputStream.Position = 0;
        using (var inputStream = new StreamReader(context.Request.InputStream))
        {
            myRequest = inputStream.ReadToEnd();
        }

        myRequest = DecodeUrlString(myRequest);


        // 8.56.4
        if (useoriginatinglocation == "true"){

            string originatinglocation = myRequest.Substring(myRequest.IndexOf("originatinglocation") + 22);
            originatinglocation = originatinglocation.Substring(0, originatinglocation.IndexOf('\"'));
            callbackMethod  =   originatinglocation  + "/"+ callbackMethod_originatinglocation;

        }
        // 8.56.4



        string contentLocation = myRequest.Substring(myRequest.IndexOf("contentLocation") + 18);

        contentLocation = contentLocation.Substring(0, contentLocation.IndexOf('\"'));

        string parameters = myRequest.Substring((myRequest.IndexOf("parameters") + 12));
        parameters = parameters.Substring(0, parameters.IndexOf(']'));

        string countString = parameters;

        int paramCount = 0;
        while ((countString.IndexOf("paramName") > -1)) {
            countString = countString.Substring((countString.IndexOf("paramName") + 11));
            paramCount++;
        }

        //context.Response.Write("4 TEST  HELLO!  "+paramCount);


        //if (cvjs_debug) {
        //    stringContent = (" parameters "
        //                + (paramCount + " \n\r"));
        //    contentInBytes = stringContent.getBytes();
        //    fileOut.write(contentInBytes);
        //}

        string[] param_name = new string[paramCount];
        string[] param_value = new string[paramCount];

        paramCount = 0;

        while ((parameters.IndexOf("paramName") > -1))
        {

            string string1 = parameters.Substring(parameters.IndexOf("paramName")+12);


            myoutput[0] = " paramcount: "+paramCount+" XXX "+string1;
            if (cvjs_debug == "true")
                File.AppendAllLines(absFilePath, myoutput);


            // if (cvjs_debug){		
            //                stringContent = string1+" ";
            //                contentInBytes	= stringContent.getBytes();
            //                fileOut.write(contentInBytes);
            // }


            string1 = string1.Substring(0,string1.IndexOf('\"'));


            //if (cvjs_debug){		
            //    stringContent = "param "+string1+"XXX"+" \n\r";
            //    contentInBytes	= stringContent.getBytes();
            //    fileOut.write(contentInBytes);
            //}

            param_name[paramCount] = string1;

            try {

                string1 = parameters.Substring(parameters.IndexOf("paramValue")+13);

                //if (cvjs_debug){		
                //    stringContent = "param "+string1+" ";
                //    contentInBytes	= stringContent.getBytes();
                //    fileOut.write(contentInBytes);
                //}

                string1 = string1.Substring(0,string1.IndexOf('\"'));

                //if (cvjs_debug){
                //    stringContent = "param "+string1+"YYY";
                //    contentInBytes  = stringContent.getBytes();
                //    fileOut.write(contentInBytes);
                //}

                param_value[paramCount] = string1;
                parameters = parameters.Substring(parameters.IndexOf("paramValue")+13);

                //            context.Response.Write("RUN "+paramCount+" name="+ param_name[paramCount] + " value=" + param_value[paramCount]);

            }
            catch (Exception e)
            {

                param_value[paramCount] = "";
            }

            paramCount++;
        }

        // determine temporary filename
        Random randomGenerator = new Random();
        int randomInt = randomGenerator.Next(1000000);
        string tempFileName = "F"+randomInt;
        //string writeTemp =  (URLDecoder.decode(contentLocation, "UTF-8")).trim();
        //StringWriter writer = new StringWriter();
        //Server.UrlDecode(contentLocation, writer);
        //string writeTemp = writer.ToString();

        string writeTemp = contentLocation;  // already decoded.... !!!!


        //if (cvjs_debug){		
        //	stringContent = "writeTemp "+writeTemp+" \n\r";
        //	contentInBytes	= stringContent.getBytes();
        //	fileOut.write(contentInBytes);
        //}

        string writeFile = fileLocation + tempFileName + "." + writeTemp.Substring(writeTemp.LastIndexOf(".")+1);

        //context.Response.Write("4 TEST  HELLO!  "+writeFile);

        int localFlag = 0;



        if (contentLocation.IndexOf(".svg")>-1){
            // 2023-09-21
            // IF content location is .svg or .svgz then
            // copy over to /files/xxx.svg
            // the callback method should have the format of the input file
            // do the callback and return  

            string outputFormatSVG = contentLocation.Substring(contentLocation.LastIndexOf(".")+1);



            if (contentLocation.IndexOf("http") == 0) {  // URL

                if (contentLocation.IndexOf(ServerUrl) == 0)    // we are on same server, so OK
                {
                    contentLocation = ServerLocation + contentLocation.Substring(ServerUrl.Length);
                    localFlag = 1;
                    File.Copy(contentLocation, writeFile, true);

                }
                else
                {
                    using (WebClient wc = new WebClient())
                    {
                        wc.DownloadFile(contentLocation, writeFile);
                    }

                }

            }else{
                        // flat file

                if (contentLocation.IndexOf(ServerLocation) == 0)    // we are on same server, so OK
                {
                    localFlag = 1;
                    File.Copy(contentLocation, writeFile, true);
                }
         

            }

            // svg / svgz files



            string CVresponseSVG = "{\"completedAction\":\"svg_creation\",\"errorCode\":\"E0\",\"converter\":\"AutoXchange AX2024\",\"version\":\"V1.00\",\"userLabel\":\"fromCADViewerJS\",\"contentLocation\":\""+contentLocation+"\",\"contentResponse\":\"stream\",\"contentStreamData\":\""+callbackMethod+"?remainOnServer=0&fileTag="+tempFileName+"&Type="+outputFormatSVG+"\"}";

            myoutput[0] = "SVG response: "+CVresponseSVG;
            if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

            // send callback message and terminate
            context.Response.Write(CVresponseSVG);


            // do the callback and exit
            return;


        }



        if (contentLocation.IndexOf("http") == 0) {  // URL


            if (contentLocation.IndexOf(ServerUrl) == 0)    // we are on same server, so OK
            {
                contentLocation = ServerLocation + contentLocation.Substring(ServerUrl.Length);
                localFlag = 1;
                // File.Copy(contentLocation, writeFile, true);

            }
            else
            {


                using (WebClient wc = new WebClient())
                {
                    wc.DownloadFile(contentLocation, writeFile);
                }


            }



            string cleaned = "";
            string pattern = @"[^\u0000-\u0200]+";
            //            string pattern = @"[^\u0000-\u007F]+";
            string replacement = " ";

            Regex rgx = new Regex(pattern);
            cleaned = rgx.Replace(contentLocation, replacement);

            string contentNoUnicode = cleaned;

            myoutput[0] = "XXX "+contentNoUnicode;
            if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);


            if (contentNoUnicode.Length != contentLocation.Length) {
                // if Unicode, we cancel the server operation, but copy to local temporart file

                // everything seems to work removing this
                //    localFlag = 0;
                // File.Copy(contentLocation, writeFile, true);

            }



        }
        else { // Flat file

            if (contentLocation.IndexOf("./") > -1)     // a relative path is made absolute based on current folder
            {

                string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\" + contentLocation.Substring(contentLocation.IndexOf("./") + 2));

                contentLocation = tmpPrintFolder;

                // context.Response.Write("5 TEST  HELLO!  "+contentLocation+"  "+writeFile);
            }

            if (contentLocation.IndexOf("../") > -1)     // a relative path is made absolute based on current folder
            {

                string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\" + contentLocation.Substring(contentLocation.IndexOf("../") + 3));

                contentLocation = tmpPrintFolder;

                // context.Response.Write("5 TEST  HELLO!  "+contentLocation+"  "+writeFile);
            }

            localFlag = 1;


            string cleaned = "";
            string pattern = @"[^\u0000-\u0200]+";
            //            string pattern = @"[^\u0000-\u007F]+";
            string replacement = " ";

            Regex rgx = new Regex(pattern);
            cleaned = rgx.Replace(contentLocation, replacement);

            string contentNoUnicode = cleaned;

            myoutput[0] = "YYY "+contentNoUnicode;
            if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);



            if (contentNoUnicode.Length != contentLocation.Length) {

                // if Unicode, we cancel the server operation
                // localFlag = 0;
                // File.Copy(contentLocation, writeFile, true);

            }

        }


        // new 2019-04-01
        if (localFlag == 1) { writeFile = contentLocation; }


        Boolean linux = false;   // we not need the windows batch mode any more

        // let us build a command line
        //String commandLine = converterLocation+ax2020_executable+" -i="+writeFile+" -o="+ fileLocation + tempFileName + ".svg -f=svg -model";


        // let us determine the output format

        string outputFormat = "svg";

        for (int i=0; i<paramCount; i++){
            if (param_name[i].IndexOf("f")==0 && param_name[i].Length == 1 ){
                outputFormat = param_value[i];

                // 20.05.52a
                if ((svgz_compress == "true") && (outputFormat == "svg"))
                {
                        outputFormat = "svgz";
                        param_value[i] = "svgz";
                }



            }
        }

//        	if (cvjs_debug){		
//        		stringContent = "Output format:" + outputFormat;
//        		contentInBytes	= stringContent.getBytes();
//        		fileOut.write(contentInBytes);
//        	}




        string[] envp = new String[1];
        //		string[] str_arr = new String[4+paramCount+1];   // include trace
        string[] str_arr = new String[4+paramCount];

        str_arr[0] =  converterLocation+ax2020_executable;

        var fileName = "";
        var pdfpath = "";


        if (!linux){   // !linux

            //str_arr[1] =  "-i=\""+writeFile+"\"";
            //str_arr[2] =  "-o=\""+ fileLocation + tempFileName + "."+outputFormat+"\"";

            str_arr[3] =  "\"-lpath="+ licenseLocation + "\"";



            myoutput[0] = "1: contentLocation: "+contentLocation+" XXX writeFile="+writeFile;
            if (cvjs_debug == "true")
                File.AppendAllLines(absFilePath, myoutput);


            // we change for batch call
            str_arr[1] =  "\"-i=\""+writeFile+"\"\"";
            str_arr[2] =  "\"-o=\""+ fileLocation + tempFileName + "."+outputFormat+"\"\"";

            str_arr[0] = str_arr[0].Replace(@" ", @"%20");
            str_arr[1] = str_arr[1].Replace(@" ", @"%20");
            str_arr[2] = str_arr[2].Replace(@" ", @"%20");
            str_arr[3] = str_arr[3].Replace(@" ", @"%20");

            if (outputFormat.ToLower().IndexOf("pdf")>-1) {

                if (contentLocation.LastIndexOf("\\")>-1)
                    fileName = contentLocation.Substring(contentLocation.LastIndexOf("\\")+1);
                if (contentLocation.LastIndexOf("/")>-1)
                    fileName = contentLocation.Substring(contentLocation.LastIndexOf("/")+1);

                fileName = fileName.Substring(0, fileName.LastIndexOf("."));
                pdfpath = fileLocation + "pdf\\" + randomInt;
                Directory.CreateDirectory(pdfpath);


                fileName = fileName.Replace(@" ", @"%20");
                myoutput[0] = "PDF output filename: "+fileName+"XXX";
                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);



                str_arr[2] =  "\"-o=\""+ pdfpath +"\\"+ fileName + "." + outputFormat+"\"\"";
                //                str_arr[2] =  "-o=\""+ pdfpath +"\\"+ fileName + "." + outputFormat+"\"";
            }

        }
        else{

        }

        for (int i=0; i<paramCount; i++){

            if (param_value[i].Length == 0){

                str_arr[4+i] = "-"+param_name[i];


            }
            else{
                // layout names
                if (param_value[i] is string) {

                    param_value[i] = param_value[i].Replace('+', ' ');  // we change all url decoding  + to " ".  white spaces

                    // layouts=\\u1234    with Unicode Chinese names
                    param_value[i] = param_value[i].Replace(@"\\u", @"\u");;  // we change all \\u  to \u

                    //str_arr[4+i] = "-"+param_name[i]+"="+"\""+param_value[i]+"\"";


                    param_value[i] = param_value[i].Replace(@" ", @"%20");  // we change all url decoding  " "  to "%20".  white spaces

                }

                // we change for batch call
                str_arr[4+i] = "\"-"+param_name[i]+"=\""+param_value[i]+"\"\"";
                //               str_arr[4+i] = "\"\"-"+param_name[i]+"="+param_value[i]+"\"\"";

            }
        }


        int exitCode = -1;

        try
        {
            {

                string arguments = "";
                for (int i = 1; i < paramCount+4; i++)
                {
                    if (i == 1)
                        arguments = str_arr[i];
                    else
                        arguments = arguments+" "+str_arr[i];
                }


                int nobat = 1;       // 2022-01-12 we make nobat true!!!!


                // 2024-03-16

                


                // move all this processing

                if (nobat == 1)
                {
                    // we keep arguments without the exe name
                }
                else
                {
                    arguments = str_arr[0] + " " + arguments;

                }



                myoutput[0] = arguments;
                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

                //context.Response.Write("arguments = " +arguments);
                if (cvjs_debug == "true")
                {
                    //                    myoutput[0] = str_arr[0]+"  "+arguments;
                    myoutput[0] = "All Arguments:  "+arguments;
                    File.AppendAllLines(absFilePath, myoutput);


//   C:/cadviewer-testapp-dotnet-01/cadviewer/converters/ax2024/windows/AX2025_W64_25_11_146.exe "-i="C:/cadviewer-testapp-dotnet-01/cadviewer//content/drawings/dwg/1st%20floor%20architectural.dwg"" "-o="C:/cadviewer-testapp-dotnet-01/cadviewer/converters/files/F979162.svgz"" "-lapat=C:/cadviewer-testapp-dotnet-01/cadviewer/converters/ax2024/windows/" "-f="svgz"" -model -extents "-normalize="c:/cadviewer-testapp-dotnet/converters/ax2024/windows/dx4_params.json"" -trace
//                    arguments = "\"-i=\"C:/cadviewer-testapp-dotnet-01/cadviewer//content/drawings/dwg/1st%20floor%20architectural.dwg\"\" \"-o=\"C:/cadviewer-testapp-dotnet-01/cadviewer/converters/files/F979162.dwg\"\"  \"-normalize=\"c:/cadviewer-testapp-dotnet/converters/ax2024/windows/dx4_params.json\"\" -trace";


                    myoutput[0] = "Executable:  "+converterLocation+ax2020_executable+" "+arguments;
                    File.AppendAllLines(absFilePath, myoutput);


                    myoutput[0] = "Nobat :  "+nobat;
                    File.AppendAllLines(absFilePath, myoutput);



                    myoutput[0] = "The command:  "+converterLocation+"\\run_ax2020.bat";
                    //                    myoutput[0] = "New The command:  "+str_arr[0]+" "+arguments;
                    //File.AppendAllLines(absFilePath, myoutput);

                }

                exitCode = 0;
                ProcessStartInfo ProcessInfo;


                if (nobat == 1)    // do not call through a bat file
                {
//                    ProcessInfo = new ProcessStartInfo(str_arr[0], arguments);
                    ProcessInfo = new ProcessStartInfo(converterLocation+ax2020_executable, arguments);
                }
                else      // call through a bat file
                {
                    ProcessInfo = new ProcessStartInfo(converterLocation+"\\run_ax2020.bat", arguments);
                }


                /*
                                ProcessInfo.CreateNoWindow = true;
                                ProcessInfo.UseShellExecute = false;
                                ProcessInfo.WorkingDirectory =converterLocation;
                                // *** Redirect the output ***
                                ProcessInfo.RedirectStandardError = true;
                                ProcessInfo.RedirectStandardOutput = true;
                */

                ProcessInfo.CreateNoWindow = true;
                ProcessInfo.UseShellExecute = false;
                ProcessInfo.WorkingDirectory =converterLocation;

                // *** Redirect the output ***     - this creates deadlock on some platforms, so being suppressed
                //                ProcessInfo.RedirectStandardError = true;
                //                ProcessInfo.RedirectStandardOutput = true;

                //  **** alternatively, do not redirect any output for async issues ****
                //ProcessInfo.RedirectStandardError = false;
                //ProcessInfo.RedirectStandardOutput = false;


                Process myProcess;
                myProcess = Process.Start(ProcessInfo);

                // *** Read the streams *** - this creates deadlock on some platforms, so being suppressed
                // string output = myProcess.StandardOutput.ReadToEnd();
                // string error = myProcess.StandardError.ReadToEnd();


                myProcess.WaitForExit();
                exitCode = myProcess.ExitCode;


                
                //                myoutput[0] ="output>>" + (String.IsNullOrEmpty(output) ? "(none)" : output);
                //                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

                //                myoutput[0] ="error>>" + (String.IsNullOrEmpty(error) ? "(none)" : error);
                //                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

                //                myoutput[0] = "ExitCode: " + exitCode.ToString();
                //                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

                
                myProcess.Close();


            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }


        myoutput[0] = "Conversion done ";
        if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);



        while (contentLocation.IndexOf("\\")>-1){
            contentLocation = contentLocation.Substring(0,contentLocation.IndexOf('\\'))+"/"+contentLocation.Substring(contentLocation.IndexOf('\\')+1);
        }




        myoutput[0] = "Content location: "+contentLocation+" output format: "+outputFormat+"XX";
        if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);


        // compose callback message

        if (outputFormat.ToLower().IndexOf("svg")>-1){  // BOTH svg + svgz   -> return outputFormat !!! note!

            string CVJSresponse = "{\"completedAction\":\"svg_creation\",\"errorCode\":\"E"+exitCode+"\",\"converter\":\"AutoXchange AX2024\",\"version\":\"V1.00\",\"userLabel\":\"fromCADViewerJS\",\"contentLocation\":\""+contentLocation+"\",\"contentResponse\":\"stream\",\"contentStreamData\":\""+callbackMethod+"?remainOnServer=0&fileTag="+tempFileName+"&Type="+outputFormat+"\"}";

            myoutput[0] = "SVG response: "+CVJSresponse;
            if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);

            // send callback message and terminate
            context.Response.Write(CVJSresponse);

        }
        else{
            if (outputFormat.ToLower().IndexOf("pdf")>-1){

                var  pdfpathurl = "pdf/" + randomInt +"/";

                string CVJSresponse = "{\"completedAction\":\"pdf_creation\",\"errorCode\":\"E"+exitCode+"\",\"converter\":\"AutoXchange AX2024\",\"version\":\"V1.00\",\"userLabel\":\"fromCADViewerJS\",\"contentLocation\":\""+contentLocation+"\",\"contentResponse\":\"file\",\"contentStreamData\":\""+fileLocationUrl+ pdfpathurl + fileName + "." + outputFormat+"\"}";

                //                string CVJSresponse = "{\"completedAction\":\"pdf_creation\",\"errorCode\":\"E"+exitCode+"\",\"converter\":\"AutoXchange AX2024\",\"version\":\"V1.00\",\"userLabel\":\"fromCADViewerJS\",\"contentLocation\":\""+contentLocation+"\",\"contentResponse\":\"file\",\"contentStreamData\":\""+fileLocationUrl+tempFileName+"."+outputFormat+"\"}";
                //				String CVJSresponse = "{\"completedAction\":\"svg_creation\",\"errorCode\":\"E"+exitCode+"\",\"converter\":\"AutoXchange AX2024\",\"version\":\"V1.00\",\"userLabel\":\"fromCADViewerJS\",\"contentLocation\":\""+contentLocation+"\",\"contentResponse\":\"stream\",\"contentStreamData\":\""+callbackMethod+"?remainOnServer=0&fileTag="+tempFileName+"&Type=svg\"}";



                myoutput[0] = "PDF response: "+CVJSresponse;
                if (cvjs_debug == "true") File.AppendAllLines(absFilePath, myoutput);



                // delete the temp originating file
                if (localFlag == 0) File.Delete(writeFile);


                // send callback message and terminate
                context.Response.Write(CVJSresponse);

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



    private static string DecodeUrlString(string url) {
        string newUrl;
        while ((newUrl = Uri.UnescapeDataString(url)) != url)
            url = newUrl;
        return newUrl;
    }

    private static string Get8CharacterRandomString()
    {
        string path = Path.GetRandomFileName();
        path = path.Replace(".", ""); // Remove period.
        return path.Substring(0, 10);  // Return 8 character string
    }

}