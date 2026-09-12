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
                    <a href="#item_2C">Samples - Standard Case/Redlines</a>
                </li>
                <li>
                    <a href="#item_7">Install Notes - ASP.NET</a>
				</li>
                <li>
                    <a href="#item_8">License Key</a>
                </li>
                <li>
                    <a href="https://cadviewer.com/cadviewerproapi/global.html">CADViewer API Reference API</a>
                </li>
                <li>
                    <a href="https://cadviewer.com">About</a>
                </li>
                <li>
                    <a href="https://cadviewer.com/contact">Contact</a>
                </li>
                <li>
                    <img src="./black.png" width="20" height="11" border="0">
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
			
				<div class="row">
					<div id="item_2" class="col-lg-12">
						<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap;">
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <img src="./app/images/cadviewer_primary_logo.svg" height="40" alt="CADViewer Logo" />
                                <h2 style="margin: 0; display: flex; align-items: center; gap: 10px;">
                                    <span style="background-color: #512bd4; color: white; padding: 2px 6px; border-radius: 4px; font-weight: bold; font-family: sans-serif; font-size: 16px; vertical-align: middle;">.NET</span>
                                    CADViewer Implementation Samples
                                </h2>
                            </div>
                            <a href="https://github.com/CADViewer/cadviewer-testapp-dotnet-01" target="_blank" rel="noopener noreferrer" style="display: flex; align-items: center; gap: 6px; font-size: 16px; font-weight: bold; text-decoration: none; padding: 6px 12px; border-radius: 6px; border: 1px solid #d1d5db; background-color: #f9fafb; color: #0366d6; white-space: nowrap; margin-top: 10px;">
                              <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" style="width: 20px; height: 20px;" alt="GitHub Logo" />
                              <span>Pull or clone from GitHub</span>
                            </a>
                        </div>
						<br>
						<h4>Samples which require server (localhost, 127.0.0.1 or Url) with ASP.NET and AutoXchange:</h4>
					</div>
				</div>

				<div class="row">
					<div id="item_2C" class="col-lg-12">
        <div class="row" style="margin-top: 10px;">
            <div class="col-lg-12">
                <h4 style="border-bottom: 1px solid #eee; padding-bottom: 10px; margin-bottom: 20px;">File Load, Redlines and Image Space Objects</h4>
            </div>
            <div class="col-md-6" style="margin-bottom: 30px;">
                <p style="font-size: 15px;"><strong>1) File-Load: </strong> CADViewer is set up with interactive modals for file-loading and redlines. Links with AutoXchange for own server on-the-fly conversion control of CAD drawings.</p>
                <p>See file: <strong><a href="./html/CVJS_fileloader_12.html">CVJS_fileloader_12.html</a></strong><br>
                Drawing via Url: <strong><a href="./html/CVJS_fileloader_12.html?drawing_name=../content/drawings/dwg/City_base_map.dwg">CVJS_fileloader_12.html?drawing_name=../my.dwg</a></strong></p>
                <a href="./html/CVJS_fileloader_12.html">
                    <img src="./html/index_images/cvjs_file_loader_09.png" style="width: 100%; height: auto; border: 1px solid #ddd; border-radius: 4px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="CADViewer File Loader" />
                </a>
            </div>
            <div class="col-md-6" style="margin-bottom: 30px;">
                <p style="font-size: 15px;"><strong>2) Add Custom Space Objects: </strong> CADViewer is set up with interface to add and modify Image Objects.</p>
                <p>See file: <strong><a href="./html/CADViewer_space_objects_canvas_API_12.html">CADViewer_space_objects_canvas_API_12.html</a></strong><br>&nbsp;</p>
                <a href="./html/CADViewer_space_objects_canvas_API_12.html">
                    <img src="./html/index_images/cvjs_space_objects_10.png" style="width: 100%; height: auto; border: 1px solid #ddd; border-radius: 4px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="CADViewer Space Objects" />
                </a>
            </div>
        </div>
    </div>
</div>
<hr />
				<div class="row">
                    <div id="item_7" class="col-lg-12">
                        <h3>Install Notes:</h3>
		
						<p><h4>ASP.NET - Windows:</h4>
						Unzip and install under Visual Studio.
						<br>Links to all samples in cadviewer/html are in <strong>Default.aspx</strong>. Run this page.
						<br>All ashx handlers for server-client communication are in /cadviewer/.
						<br>Open /cadviewer/Web.config, ensure under <strong>system.web</strong> that: pages validateRequest="false" . 
						</p>

						<p><h4>Sample Configuration:</h4>
						For the HTML samples in the <code>/html/</code> folder (e.g. <code>CADViewer_fileloader_12.html</code>) to work correctly, you need to expose your backend server API locations. 
						Edit the HTML files and update the following settings to point to your ASP.NET backend URL:
						</p>
<pre class="prettyprint notranslate lang-javascript">
var ServerUrl = "http://localhost:44371/";
var ServerBackEndUrl = "http://localhost:44371/";
</pre>
						<p>Ensure these match the port you are running IIS Express on (e.g., 44371).</p>
						
                        <br>
                        <h4>Command Line Operation:</h4>
                        <p>If you prefer to run the sample from the command line using IIS Express instead of Visual Studio, you can execute the following command (adjusting your specific file path if needed):</p>
<pre class="prettyprint notranslate lang-javascript">
"C:\Program Files\IIS Express\iisexpress.exe" /path:"c:\dotNet\cadviewer-testapp-dotnet-01\cadviewer" /port:44371
</pre>
                        
                        <br>
                        <h4>Web.config Setup:</h4>
                        <p><strong>Important Note:</strong> You will need to edit the <code>&lt;appSettings&gt;</code> in the <code>Web.config</code> below to set up your specific paths. Ensure that properties like <code>ServerLocation</code>, <code>converterLocation</code>, and other temporary file locations correctly point to where you installed AutoXchange and your working directories.</p>
                        <pre style="background-color: #f8f9fa; padding: 15px; border: 1px solid #ddd; border-radius: 5px; overflow-x: auto; max-height: 400px;">&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;configuration&gt;
  &lt;configSections&gt;
    &lt;sectionGroup name=&quot;dotNetOpenAuth&quot; type=&quot;DotNetOpenAuth.Configuration.DotNetOpenAuthSection, DotNetOpenAuth.Core&quot;&gt;
      &lt;section name=&quot;messaging&quot; type=&quot;DotNetOpenAuth.Configuration.MessagingElement, DotNetOpenAuth.Core&quot; requirePermission=&quot;false&quot; allowLocation=&quot;true&quot;/&gt;
      &lt;section name=&quot;reporting&quot; type=&quot;DotNetOpenAuth.Configuration.ReportingElement, DotNetOpenAuth.Core&quot; requirePermission=&quot;false&quot; allowLocation=&quot;true&quot;/&gt;
      &lt;section name=&quot;oauth&quot; type=&quot;DotNetOpenAuth.Configuration.OAuthElement, DotNetOpenAuth.OAuth&quot; requirePermission=&quot;false&quot; allowLocation=&quot;true&quot;/&gt;
      &lt;section name=&quot;openid&quot; type=&quot;DotNetOpenAuth.Configuration.OpenIdElement, DotNetOpenAuth.OpenId&quot; requirePermission=&quot;false&quot; allowLocation=&quot;true&quot;/&gt;
    &lt;/sectionGroup&gt;
  &lt;/configSections&gt;
  &lt;appSettings&gt;
    &lt;add key=&quot;ServerLocation&quot; value=&quot;C:/dotNet/cadviewer-testapp-dotnet-01/cadviewer/&quot;/&gt;
    &lt;add key=&quot;AppLocation&quot; value=&quot;C:/dotNet//cadviewer-testapp-dotnet-01/cadviewer/&quot;/&gt;
    &lt;add key=&quot;ServerUrl&quot; value=&quot;http://localhost:44371/&quot;/&gt;
    &lt;add key=&quot;fileLocation&quot; value=&quot;C:/dotNet/cadviewer-testapp-dotnet-01/cadviewer/converters/files/&quot;/&gt;
    &lt;add key=&quot;fileLocationUrl&quot; value=&quot;http://localhost:44371/converters/files/&quot;/&gt;
    &lt;add key=&quot;converterLocation&quot; value=&quot;C:/dotNet//cadviewer-testapp-dotnet-01/cadviewer/converters/autoxchange/windows/&quot;/&gt;
    &lt;add key=&quot;ax2020_executable&quot; value=&quot;AX2026_W64_27_07_163b.exe&quot;/&gt;
    &lt;add key=&quot;dwgmergeLocation&quot; value=&quot;C:/dotNet//cadviewer-testapp-dotnet-01/cadviewer/converters/dwgmerge2023/windows/&quot;/&gt;
    &lt;add key=&quot;dwgmerge_executable&quot; value=&quot;DwgMerge_W32_20_02_00.exe&quot;/&gt;
    &lt;add key=&quot;licenseLocation&quot; value=&quot;C:/dotNet//cadviewer-testapp-dotnet-01/cadviewer/converters/autoxchange/windows/&quot;/&gt;
    &lt;add key=&quot;xpathLocation&quot; value=&quot;C:/dotNet//cadviewer-testapp-dotnet-01/cadviewer/converters/autoxchange/windows/&quot;/&gt;
    &lt;add key=&quot;useoriginatinglocation&quot; value=&quot;false&quot;/&gt;
    &lt;add key=&quot;callbackMethod_originatinglocation&quot; value=&quot;getFileHandler.ashx&quot;/&gt;
    &lt;add key=&quot;callbackMethod&quot; value=&quot;http://localhost:44371/getFileHandler.ashx&quot;/&gt;
    &lt;add key=&quot;svgz_compress&quot; value=&quot;false&quot;/&gt;
    &lt;add key=&quot;cvjs_debug&quot; value=&quot;true&quot;/&gt;
    &lt;add key=&quot;MailServer&quot; value=&quot;smtp.dreamhost.com&quot;/&gt;
    &lt;add key=&quot;MailServerPort&quot; value=&quot;465&quot;/&gt;
    &lt;add key=&quot;MailUserName&quot; value=&quot;ca.ha@tailormade.com&quot;/&gt;
    &lt;add key=&quot;MailPassword&quot; value=&quot;xxx&quot;/&gt;
  &lt;/appSettings&gt;
  &lt;system.webServer&gt;
    &lt;rewrite&gt;
      &lt;outboundRules&gt;
        &lt;rule name=&quot;Rewrite SVGZ header&quot; preCondition=&quot;IsSVGZ&quot; stopProcessing=&quot;true&quot;&gt;
          &lt;match serverVariable=&quot;RESPONSE_Content_Encoding&quot; pattern=&quot;.*&quot;/&gt;
          &lt;action type=&quot;Rewrite&quot; value=&quot;gzip&quot;/&gt;
        &lt;/rule&gt;
        &lt;preConditions&gt;
          &lt;preCondition name=&quot;IsSVGZ&quot;&gt;
            &lt;add input=&quot;{PATH_INFO}&quot; pattern=&quot;\.svgz$&quot;/&gt;
          &lt;/preCondition&gt;
        &lt;/preConditions&gt;
      &lt;/outboundRules&gt;
    &lt;/rewrite&gt;
    &lt;staticContent&gt;
      &lt;remove fileExtension=&quot;.svgz&quot;/&gt;
      &lt;mimeMap fileExtension=&quot;.svgz&quot; mimeType=&quot;image/svg+xml&quot;/&gt;
      &lt;mimeMap fileExtension=&quot;.dwg&quot; mimeType=&quot;application/dwg&quot;/&gt;
    &lt;/staticContent&gt;
  &lt;/system.webServer&gt;
  &lt;!--
    For a description of web.config changes see http://go.microsoft.com/fwlink/?LinkId=235367.

    The following attributes can be set on the &lt;httpRuntime&gt; tag.
      &lt;system.Web&gt;
        &lt;httpRuntime targetFramework=&quot;4.5&quot; /&gt;
      &lt;/system.Web&gt;
  --&gt;
  &lt;system.web&gt;
    &lt;compilation debug=&quot;true&quot; targetFramework=&quot;4.8&quot;&gt;
      &lt;assemblies&gt;
        &lt;add assembly=&quot;System.Runtime, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a&quot; /&gt;
        &lt;add assembly=&quot;netstandard, Version=2.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51&quot; /&gt;
      &lt;/assemblies&gt;
    &lt;/compilation&gt;
    &lt;httpRuntime targetFramework=&quot;4.5&quot; requestValidationMode=&quot;2.0&quot;/&gt;
    &lt;pages validateRequest=&quot;false&quot;/&gt;
  &lt;/system.web&gt;
  &lt;connectionStrings&gt;
    &lt;add name=&quot;StarterSite&quot; connectionString=&quot;Data Source=|DataDirectory|\StarterSite.sdf&quot; providerName=&quot;System.Data.SqlServerCe.4.0&quot;/&gt;
  &lt;/connectionStrings&gt;
  &lt;runtime&gt;
    &lt;assemblyBinding xmlns=&quot;urn:schemas-microsoft-com:asm.v1&quot;&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;DotNetOpenAuth.Core&quot; publicKeyToken=&quot;2780ccd10d57b246&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;0.0.0.0-4.3.0.0&quot; newVersion=&quot;4.3.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;DotNetOpenAuth.AspNet&quot; publicKeyToken=&quot;2780ccd10d57b246&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;0.0.0.0-4.3.0.0&quot; newVersion=&quot;4.3.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;System.Web.Optimization&quot; publicKeyToken=&quot;31bf3856ad364e35&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;1.0.0.0-1.1.0.0&quot; newVersion=&quot;1.1.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;WebGrease&quot; publicKeyToken=&quot;31bf3856ad364e35&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;0.0.0.0-1.6.5135.21930&quot; newVersion=&quot;1.6.5135.21930&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;System.Web.Helpers&quot; publicKeyToken=&quot;31bf3856ad364e35&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;1.0.0.0-3.0.0.0&quot; newVersion=&quot;3.0.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;System.Web.WebPages&quot; publicKeyToken=&quot;31bf3856ad364e35&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;1.0.0.0-3.0.0.0&quot; newVersion=&quot;3.0.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;Newtonsoft.Json&quot; publicKeyToken=&quot;30ad4fe6b2a6aeed&quot; culture=&quot;neutral&quot;/&gt;
        &lt;bindingRedirect oldVersion=&quot;0.0.0.0-13.0.0.0&quot; newVersion=&quot;13.0.0.0&quot;/&gt;
      &lt;/dependentAssembly&gt;
    &lt;/assemblyBinding&gt;
    &lt;!-- This prevents the Windows Event Log from frequently logging that HMAC1 is being used (when the other party needs it). --&gt;
    &lt;legacyHMACWarning enabled=&quot;0&quot;/&gt;
    &lt;!-- When targeting ASP.NET MVC 3, this assemblyBinding makes MVC 1 and 2 references relink
         to MVC 3 so libraries such as DotNetOpenAuth that compile against MVC 1 will work with it.
    &lt;assemblyBinding xmlns=&quot;urn:schemas-microsoft-com:asm.v1&quot;&gt;
      &lt;dependentAssembly&gt;
        &lt;assemblyIdentity name=&quot;System.Web.Mvc&quot; publicKeyToken=&quot;31bf3856ad364e35&quot; /&gt;
        &lt;bindingRedirect oldVersion=&quot;1.0.0.0-3.0.0.0&quot; newVersion=&quot;3.0.0.0&quot; /&gt;
      &lt;/dependentAssembly&gt;
    &lt;/assemblyBinding&gt;
     --&gt;
  &lt;/runtime&gt;
  &lt;system.data&gt;
    &lt;DbProviderFactories&gt;
      &lt;remove invariant=&quot;System.Data.SqlServerCe.4.0&quot;/&gt;
      &lt;add name=&quot;Microsoft SQL Server Compact Data Provider 4.0&quot; invariant=&quot;System.Data.SqlServerCe.4.0&quot; description=&quot;.NET Framework Data Provider for Microsoft SQL Server Compact&quot; type=&quot;System.Data.SqlServerCe.SqlCeProviderFactory, System.Data.SqlServerCe, Version=4.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91&quot;/&gt;
    &lt;/DbProviderFactories&gt;
  &lt;/system.data&gt;
  &lt;system.net&gt;
    &lt;defaultProxy enabled=&quot;true&quot;/&gt;
    &lt;settings&gt;
      &lt;!-- This setting causes .NET to check certificate revocation lists (CRL) 
           before trusting HTTPS certificates.  But this setting tends to not 
           be allowed in shared hosting environments. --&gt;
      &lt;!--&lt;servicePointManager checkCertificateRevocationList=&quot;true&quot;/&gt;--&gt;
    &lt;/settings&gt;
  &lt;/system.net&gt;
  &lt;dotNetOpenAuth&gt;
    &lt;messaging&gt;
      &lt;untrustedWebRequest&gt;
        &lt;whitelistHosts&gt;
          &lt;!-- Uncomment to enable communication with localhost (should generally not activate in production!) --&gt;
          &lt;!--&lt;add name=&quot;localhost&quot; /&gt;--&gt;
        &lt;/whitelistHosts&gt;
      &lt;/untrustedWebRequest&gt;
    &lt;/messaging&gt;
    &lt;!-- Allow DotNetOpenAuth to publish usage statistics to library authors to improve the library. --&gt;
    &lt;reporting enabled=&quot;true&quot;/&gt;
    &lt;!-- This is an optional configuration section where aspects of dotnetopenauth can be customized. --&gt;
    &lt;!-- For a complete set of configuration options see http://www.dotnetopenauth.net/developers/code-snippets/configuration-options/ --&gt;
    &lt;openid&gt;
      &lt;relyingParty&gt;
        &lt;security requireSsl=&quot;false&quot;&gt;
          &lt;!-- Uncomment the trustedProviders tag if your relying party should only accept positive assertions from a closed set of OpenID Providers. --&gt;
          &lt;!--&lt;trustedProviders rejectAssertionsFromUntrustedProviders=&quot;true&quot;&gt;
            &lt;add endpoint=&quot;https://www.google.com/accounts/o8/ud&quot; /&gt;
          &lt;/trustedProviders&gt;--&gt;
        &lt;/security&gt;
        &lt;behaviors&gt;
          &lt;!-- The following OPTIONAL behavior allows RPs to use SREG only, but be compatible
               with OPs that use Attribute Exchange (in various formats). --&gt;
          &lt;add type=&quot;DotNetOpenAuth.OpenId.RelyingParty.Behaviors.AXFetchAsSregTransform, DotNetOpenAuth.OpenId.RelyingParty&quot;/&gt;
        &lt;/behaviors&gt;
      &lt;/relyingParty&gt;
    &lt;/openid&gt;
  &lt;/dotNetOpenAuth&gt;
  &lt;uri&gt;
    &lt;!-- The uri section is necessary to turn on .NET 3.5 support for IDN (international domain names),
         which is necessary for OpenID urls with unicode characters in the domain/host name.
         It is also required to put the Uri class into RFC 3986 escaping mode, which OpenID and OAuth require. --&gt;
    &lt;idn enabled=&quot;All&quot;/&gt;
    &lt;iriParsing enabled=&quot;true&quot;/&gt;
  &lt;/uri&gt;
  &lt;!--  CADViewer - create conflicts if user settings are different.  
&lt;system.codedom&gt;
&lt;compilers&gt;
&lt;compiler language=&quot;c#;cs;csharp&quot; extension=&quot;.cs&quot; type=&quot;Microsoft.CodeDom.Providers.DotNetCompilerPlatform.CSharpCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35&quot; warningLevel=&quot;4&quot; compilerOptions=&quot;/langversion:default /nowarn:1659;1699;1701&quot; /&gt;
&lt;compiler language=&quot;vb;vbs;visualbasic;vbscript&quot; extension=&quot;.vb&quot; type=&quot;Microsoft.CodeDom.Providers.DotNetCompilerPlatform.VBCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35&quot; warningLevel=&quot;4&quot; compilerOptions=&quot;/langversion:default /nowarn:41008 /define:_MYTYPE=\&amp;quot;Web\&amp;quot; /optionInfer+&quot; /&gt;
&lt;/compilers&gt;
&lt;/system.codedom&gt;
--&gt;
&lt;/configuration&gt;</pre>

					</div>
				</div>
				<hr />

                <div class="row">
                    <div id="item_8" class="col-lg-12">
                        <h1>License Keys</h1>
						<br>
                     <h2>License Key - CADViewer JS</h2>
                        <p>CADViewer JS goes from trial to release mode by adding a license key <strong>cvlicense.js</strong> into a directory of choice.</p>
						<br>

                        <h4>License key folder</h4>
                        <p>Set the license key folder as part of the declaration of CADViewer JS</p>

<pre class="prettyprint notranslate lang-javascript">

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

<pre class="prettyprint notranslate lang-javascript">
//  Path to the location of the license key axlic.key file
	$licenseLocation = "/home/cadviewer/tms-restful-api/converters";
</pre>





						<p>To learn more about licensing, please contact us at: <a href="https://cadviewer.com/contact">Tailor Made Software / CADViewer VizQuery Technologies</a> </p>

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
    #menu-toggle.click(function(e) {
        e.preventDefault();
        #wrapper.toggleClass("toggled");
    });
    </script>

</body>

</html>

