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

            string xpathLocation = ConfigurationManager.AppSettings["xpathLocation"];
            string ServerLocation = ConfigurationManager.AppSettings["ServerLocation"];
            string ServerUrl = ConfigurationManager.AppSettings["ServerUrl"];
            string fileLocation = ConfigurationManager.AppSettings["fileLocation"];
            string fileLocationUrl = ConfigurationManager.AppSettings["fileLocationUrl"];
            string converterLocation = ConfigurationManager.AppSettings["converterLocation"];
            string ax2020_executable = ConfigurationManager.AppSettings["ax2020_executable"];
            string licenseLocation = ConfigurationManager.AppSettings["licenseLocation"];
            string callbackMethod = ConfigurationManager.AppSettings["callbackMethod"];
            string cvjs_debug = ConfigurationManager.AppSettings["cvjs_debug"];

            string[] myoutput = new String[1];
            string absFilePath = "";
            if (cvjs_debug == "true") {
                string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_debug");
                Directory.CreateDirectory(tmpPrintFolder);
                absFilePath = Path.Combine(tmpPrintFolder, "UploadfileHandler.txt");
                //context.Response.Write(absFilePath);
            }

            string uploadpath= context.Request["ax-file-path"];
            string name = context.Request["ax-file-name"];
            string ext = context.Request["ax-allow-ext"];
            string start = context.Request["start"];
            string fileName = uploadpath + name;

            

            Stream uploadFileinputStream = context.Request.InputStream;

            byte[] bytesInStream = new byte[uploadFileinputStream.Length];
            uploadFileinputStream.Read(bytesInStream, 0, (int)bytesInStream.Length);


            // save image
            File.WriteAllBytes(fileName, bytesInStream);

            /*
                        var body = [];

                        req.on('data', function (data) {
                            body.push(Buffer.from(data, 'binary'));
                        });
                        req.on('end', function () {
                            var buffer = Buffer.concat(body);
                            if (config.cvjs_debug) console.log("buffer ..."+buffer.length);

                            fs.open(fileName, 'w', function(err, fd) {
                                fs.write(fd, buffer, 0, buffer.length, null, function(err) {
                                    if (err) {
                                        if (config.cvjs_debug) console.log("error save upload: "+err);
                                        res.send("error save upload: "+err);
                                    }
                                    else
                                        fs.close(fd, function() {
                                        if (config.cvjs_debug) console.log('upload file written');
                                        res.send("Succes");
                                    })
                            });
                            });
                        });

                    */

            context.Response.Write("Success");

        }
        catch (Exception e)
        {

            context.Response.Write("Could not upload");

        }

    }


}