<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;

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

        DoGet(context);

    }

    private void DoGet(HttpContext context)
    {

        string serverPath = context.Request["serverPath"];
        string fileName = context.Request["fileName"];
        string thumbFile1 = context.Request["thumbFile1"];
        string thumbFile1_size = context.Request["thumbFile1_size"];
        string thumbFile2 = context.Request["thumbFile2"];
        string thumbFile2_size = context.Request["thumbFile2_size"];
        string stickyNoteContent = context.Request["stickyNoteContent"];
        //        string tmpFolder = HttpContext.Current.Server.MapPath("~\\"+serverPath);

        string tmpFolder = serverPath;



        string base64_name = tmpFolder + "/" + fileName + "_base64.png";
        string drawing_name = tmpFolder + "/" + fileName + ".png";
        string absFilePath = "";
        if (true) {

            string tmpPrintFolder = HttpContext.Current.Server.MapPath("~\\temp_debug");
            Directory.CreateDirectory(tmpPrintFolder);
            absFilePath = Path.Combine(tmpPrintFolder, "makeThumbnailsHandlerLog.txt");
            //context.Response.Write(absFilePath);
        }

        string[] myoutput = new String[1];
        myoutput[0] = "base64_name "+base64_name;
        File.AppendAllLines(absFilePath, myoutput);

        myoutput[0] = "drawing_name "+drawing_name;
        File.AppendAllLines(absFilePath, myoutput);

        try
        {
            using (FileStream fsSource = new FileStream(base64_name, FileMode.Open, FileAccess.Read))
            {
                // Read the source file into a byte array.
                byte[] bytes = new byte[fsSource.Length];
                int numBytesToRead = (int)fsSource.Length;
                int numBytesRead = 0;
                while (numBytesToRead > 0)
                {
                    // Read may return anything from 0 to numBytesToRead.
                    int n = fsSource.Read(bytes, numBytesRead, numBytesToRead);

                    // Break when the end of the file is reached.
                    if (n == 0)
                        break;

                    numBytesRead += n;
                    numBytesToRead -= n;
                }
                numBytesToRead = bytes.Length;

                //                UTF8Encoding temp = new UTF8Encoding(true);
                //                context.Response.Write(temp.GetString(bytes));

                // here we do the Base64 decoding
                // byte[] regularPNGBytes = bytes.FromBase64Bytes();

                string PNGString = Encoding.UTF8.GetString(bytes, 0, bytes.Length);
                // now we want to save the bitmap in the same location


                myoutput[0] = "PNGString: "+PNGString;
                // File.AppendAllLines(absFilePath, myoutput);

                // let us strip out the mimetype
                PNGString = PNGString.Substring(PNGString.LastIndexOf(',') + 1);

                byte[] regularPNGBytes =  Convert.FromBase64String(PNGString);
                File.WriteAllBytes(drawing_name, regularPNGBytes);

            }
        }
        catch (FileNotFoundException ioEx)
        {
            Console.WriteLine(ioEx.Message);
        }

        if (File.Exists(base64_name))
        {
            File.Delete(base64_name);
        }




        //thumbnail 1+2
        string thumb1_name = tmpFolder + "/" + thumbFile1;
        string thumb2_name = tmpFolder + "/" + thumbFile2;

        var image = System.Drawing.Image.FromFile(drawing_name);

        var newImage1 = ScaleImage(image, Int32.Parse(thumbFile1_size), Int32.Parse(thumbFile1_size));
        newImage1.Save(thumb1_name, ImageFormat.Png);

        var newImage2 = ScaleImage(image, Int32.Parse(thumbFile2_size), Int32.Parse(thumbFile2_size));
        newImage2.Save(thumb2_name, ImageFormat.Png);


        context.Response.ContentType = "text/plain";
        context.Response.Write("Succes");
    }




    public Image ScaleImage(Image image, int maxWidth, int maxHeight)
    {
        var ratioX = (double)maxWidth / image.Width;
        var ratioY = (double)maxHeight / image.Height;
        var ratio = Math.Min(ratioX, ratioY);

        var newWidth = (int)(image.Width * ratio);
        var newHeight = (int)(image.Height * ratio);

        var newImage = new Bitmap(newWidth, newHeight);

        using (var graphics = Graphics.FromImage(newImage))
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);

        return newImage;
    }




    public byte[] FromBase64Bytes(byte[] base64Bytes)
    {
        string base64String = Encoding.UTF8.GetString(base64Bytes, 0, base64Bytes.Length);
        return Convert.FromBase64String(base64String);
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}