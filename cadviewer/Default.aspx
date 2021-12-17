<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CADViewer Download Environment and Samples</title>
    <link rel="icon" href="https://cadviewer.com/logoJS.png">

    <!-- Bootstrap Core CSS -->
	<script src="../app/js/popper.js" type="text/javascript"></script>

    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="simple-sidebar.css" rel="stylesheet">

	<link href="style_03.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">


        <!-- Sidebar -->
        <div id="sidebar-wrapper">


            <ul class="sidebar-nav">
        		<li class="sidebar-brand">
                    <a href="./index_cvjs_24_overview.html">
                        CADViewer Samples
                    </a>
                </li>
                <li>
                    <a href="#item_7">Install Notes - ASP</a>
				</li>
                <li>
                    <a href="#item_2C">Samples - Standard Case/Redlines</a>
                </li>
                <li>
                    <a href="#item_8">License Key</a>
                </li>
                <li>
                    <a href="http://www.cadviewer.com/cv-js_api/jsdoc/global.html">Full JS API Reference</a>
                </li>
                <li>
                    <a href="http://www.cadviewerjs.com">About</a>
                </li>
                <li>
                    <a href="http://www.tailormade.com/contact.htm">Contact</a>
                </li>
                <li>
                    <img src="./black.png" width="20" height="11" border="0">
                </li>
        		<li>
					<a href="http://www.cadviewer.com"><img src="http://www.cadviewer.com/cv-pro/cadviewer/cvlogo.jpg" width="180" height="45" border="0"></a>
        		</li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">

              <div class="row">
                    <div id="item_7" class="col-lg-12">
                        <h2>CADViewer Samples</h2>

                        <h3>Install Notes:</h3>
		
						<p><h4>ASP.NET - Windows:</h4>
						Unzip and install under Visual Studio.
						<br>Links to all samples in cadviwer/html are in <strong>Default.aspx</strong>. Run this page.
						<br>All ashx handlers for server-client communication are in /cadviewer/.
						<br>Open /cadviewer/Web.config, edit <strong>appSettings</strong> to point to your specific install settings.
						<br>Edit /cadviewer/app/cv/CADViewer_AshxHandlerSettings.js to point to your install location and url.
						<br>Open /cadviewer/Web.config, ensure under <strong>system.web</strong> that: pages validateRequest="false" . 
	               </p>
						

						   </div>
						</div>
						<div class="row">
							<div id="item_2" class="col-lg-12">



  
			<h4>Samples which requires server (localhost, 127.0.0.1 or Url) with ASP.NET and AutoXchange:</h4>

						   </div>
						</div>
						<div class="row">
							<div id="item_2C" class="col-lg-12">


			<table width="100%" height="100%" border="0" cellspacing="0" border-spacing="1" id="mainTable">

			<tr style="background-color:rgb(255,255,255)" height="10px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td>
				<h4>File Load, Redlines and Image Space Objects</h4>
				</td>
			</tr>


			<tr style="background-color:rgb(255,255,255)" height="100px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td width="30%" style="vertical-align:top">
				<p><span><strong>1) File-Load: </strong> CADViewer is set up with interactive modals for file-loading and redlines. Links with AutoXchange for own server on-the-fly conversion control of CAD drawings. 
				<br>See file: <strong><a href="./html/CADViewer_fileloader_670.html">CVJS_fileloader_670.html.</strong></a>
				<br>Drawing via Url: <strong><a href="./html/CADViewer_fileloader_670.html?drawing_name=../content/drawings/dwg/City_base_map.dwg">CVJS_fileloader_670.html?drawing_name=../my.dwg</strong></a>
				
				</span> </p>

					<a href="./html/CADViewer_fileloader_670.html"><img src="./html/index_images/cvjs_file_loader_09.png" width="383" height="275" alt="Tailor Made logo" /></a>
				</td>
				<td>
					<img  src="./html/index_images/5x5.png" width="5" height="5" />
				</td>
				<td width="30%" style="vertical-align:top">
				<p><span><strong>2) Add Custom Space Objects: </strong> CADViewer is set up with interface to add and modify Image Objects .<br>
				<br>See file: <strong><a href="./html/CADViewer_space_objects_canvas_API_670.html">CADViewer_space_objects_canvas_API_670.html.</strong></a>
				<br>
				<br>
				</span> </p>

					<a href="./html/CADViewer_space_objects_canvas_API_670.html"><img src="./html/index_images/cvjs_space_objects_10.png" width="416" height="232" alt="Tailor Made logo" /></a>
				</td>
				<td>
						<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td width="10%">
					  <p><span></span> </p>
					<a href="https://cadviewer.com"><img src="./html/index_images/cvjs_blank_08.png" width="200" height="190" alt="Tailor Made logo" /></a>

				</td>

				<td>
					<img  src="./html/index_images/5x5.png" width="5" height="5" />
				</td>

			</tr>

			<tr style="background-color:rgb(255,255,255)" height="10px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="10" height="10" />
				</td>
			</tr>


			<tr style="background-color:rgb(255,255,255)" height="10px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td>
				<h4>Further Space Object Samples </h4>
				</td>
			</tr>


			<tr style="background-color:rgb(255,255,255)" height="100px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td width="30%" style="vertical-align:top">
					  <p><span><strong>3) Image Space Objects: </strong> Control Space Icon Objects to interactively add and manage on the canvas. <br>See file: <strong><a href="./html/CADViewer_space_image_objects_670.html">CADViewer_space_image_objects_670.html.</strong></a></span></p>
					<a href="./html/CADViewer_space_image_objects_670.html"><img src="./html/index_images/space-icons_11.png" width="382" height="239" alt="Tailor Made logo" /></a>
				
				</span> </p>

				</td>
				<td>
					<img  src="./html/index_images/5x5.png" width="5" height="5" />
				</td>
				<td width="30%" style="vertical-align:top">
					  <p><span><strong>4) Space Objects: </strong> Control Space Objects combining icons and test, for insert, move and modify through API commands. <br>See file: <strong><a href="./html/CADViewer_autonomous_space_objects_670.html">CADViewer_autonomous_space_objects_670.html.</strong></a></span></p>
					<a href="./html/CADViewer_autonomous_space_objects_670.html"><img src="./html/index_images/cvjs_file_space_objects_10.png" width="382" height="239" alt="Tailor Made logo" /></a>
				</td>
				<td>
						<img  src="./html/index_images/5x5.png"  width="5" height="5" />
				</td>
				<td width="10%">
					  <p><span></span> </p>
					<a href="https://cadviewer.com"><img src="./html/index_images/cvjs_blank_08.png" width="200" height="190" alt="Tailor Made logo" /></a>

				</td>

				<td>
					<img  src="./html/index_images/5x5.png" width="5" height="5" />
				</td>

			</tr>

			<tr style="background-color:rgb(255,255,255)" height="10px" >
				<td>
					<img  src="./html/index_images/5x5.png"  width="10" height="10" />
				</td>
			</tr>



						   </div>
						</div>
						<div class="row">
							<div id="item_2E" class="col-lg-12">


<br>
<br>

						   </div>
						</div>

						<div class="row">
							<div id="item_2J" class="col-lg-12">




							<br>
							<h4></h4>
			

			<table width="100%" height="100%" border="0" cellspacing="0" border-spacing="0" id="mainTable">

			</table>
<br>
<br>
						   </div>
						</div>




<!--            NEW    QR codes   -->
						<div class="row">
							<div id="item_3A" class="col-lg-12">


<br>
						   </div>
						</div>

						
						
<!--            NEW    Space Objects    -->
						<div class="row">
							<div id="item_3B" class="col-lg-12">

			
						</div>
						</div>

						

<!--            NEW    Image Space Objects    -->
						<div class="row">
							<div id="item_3C" class="col-lg-12">

							<br>
				
			
						</div>
						</div>

						
						

					
						

                <div class="row">
                    <div id="item_8" class="col-lg-12">
                        <h1>License Keys</h1>
						<br>
                     <h2>License Key - CADViewer JS</h2>
                        <p>CADViewer JS goes from trial to release mode by adding a license key <strong>cvlicense.js</strong> into a directory of choice.</p>
						<br>

                        <h4>License key folder</h4>
                        <p>Set the license key folder as part of the declaration of CADViewer JS</p>

<pre class="prettyprint notranslate lang-html">

		cvjs_setLicenseKeyPath("../app/js/");
</pre>

						<br>
						<br>
                     <h2>License Key - AutoXchange</h2>
						<br>
						<br>
                        <p>AutoXchange goes from trial to release mode by adding a license key <strong>axlic.key</strong> into a directory of choice.</p>
						<br>

                        <h4>License key folder</h4>
                        <p>Set the license key location as part of the initalization in the php file <strong>CV-JS_config.php</strong> in the <strong>AutoXchange</strong> download.</p>

<pre class="prettyprint notranslate lang-html">
//  Path to the location of the license key axlic.key file
	$licenseLocation = "/home/cadviewer/tms-restful-api/converters";
</pre>





						<p>To learn more about licensing, please contact us at: <a href="http://www.tailormade.com/contact.htm">Tailor Made Software</a> </p>

						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>

                    </div>
                </div>

				
				
				
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../app/js/jquery-2.2.3.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../app/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
