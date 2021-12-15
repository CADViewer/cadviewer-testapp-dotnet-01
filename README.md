# cadviewer-testapp-dotnet-01
CADViewer sample implementation on dotNet w .ASHX Handlers

The repository contains a full setup of CADViewer with CAD Converters and script controllers for dotNet Core.

## This package contains

1: CADViewer script library  - in its preferred folder structure

2: AutoXchange AX2022 Converter and DWG Merge 2022 Converter - in their preferred folder structure

3: All structures for file-conversion, sample drawings, redlines, etc. 

4: A number of HTML files with CADViewer samples.

5: The folder structure for dotNet script handlers for communication between CADViewer and the back-end AutoXchange 2022.


## This package does not contain

6: The converter folder structure contains a larger set of fonts, installed in /cadviewer/converters/ax2022/windows/fonts/, but a fuller set of fonts can be installed. 

Read the sections on installing and handling [Fonts](https://tailormade.com/ax2020techdocs/installation/fonts/) in [AutoXchange 2020 TechDocs](https://tailormade.com/ax2020techdocs/) and [TroubleShooting](https://tailormade.com/ax2020techdocs/troubleshooting/).



## How to Use

Once installed, open cadviewer.sln the HTML samples under /cadviewer/html/ can be run from a web-browser. Use http://localhost:xxxxx/cadviewer/html/CADViewer_fileloader_670.html as a starting point (assuming that your have installed under http://localhost).



## General Documentation 

-   [CADViewer Techdocs and Installation Guide](https://cadviewer.com/cadviewertechdocs/download)



## Updating CAD Converters

This repository should contain the latest converters, but in case you need to update any of the back-end converters please follow: 

* [Download **AutoXchange**](/download/) (and other converters), install (unzip) AX2020 in **cadviewer/converters/ax2020/windows** or **cadviewer/converters/ax2020/linux** or in the designated folder structure.

* Read the sections on installing and handling [Fonts](https://tailormade.com/ax2020techdocs/installation/fonts/) in [AutoXchange 2020 TechDocs](https://tailormade.com/ax2020techdocs/) and [TroubleShooting](https://tailormade.com/ax2020techdocs/troubleshooting/).

* Try out the samples and build your own application!
 
 

## Specific Documentation - Windows

### Folder Structure

For a CADViewer .NET installation on Windows, the base file-structure should be as below: 

<pre style="line-height: 110%">
c:\cadviewer-testapp-dotnet-01
       └─── cadviewer
               ├── app
               │    ├── cv
               │    │    ├── cv-pro 
               │    │    │   ├── menu_config
               │    │    │   ├── language_table
               │    │    │   └── space
               │    │    │         ├── css 
               │    │    │         └── html
               │    │    ├── cv-core
               │    │    │   ├── menu_config
               │    │    │   └── language_table
               │    │    └── cv-custom_commands
               │    ├── fonts
               │    ├── images
               │    ├── js
               │    ├── css
               │    └── user_resources	
               ├── converters
               │    ├── ax2020
               │    │     ├── windows 
               │    │     │      └── fonts
               │    │     └── linux
               │    │            └── fonts
               │    ├── dwgmerge2020
               │    │         ├── windows 
               │    │         │      └── fonts
               │    │         └── linux
               │    │            └── fonts
               │    ├── linklist2020
               │    │         ├── windows 
               │    │         │     └── fonts
               │    │         └── linux
               │    │               └── fonts
               │    └── files
               ├── content
               ├── html
               └── temp_print
</pre>

**Note** that folders for advanced interaction, such as database connectivity and advanced REST-API connectivity features are not included in this folder tree, please see the [Samples](/cadviewertechdocs/samples/) section for integration with this type of functionality.

### Windows - .NET Configuration

In folder:

<pre style="line-height: 110%">
c:\cadviewer-testapp-dotnet-01
       └─── cadviewer
               └── Web.config

</pre>

locate the configuration file: **Web.config** , edit the key settings **appSettings** that controls Converter and CADViewer pathss to reflect your installation.


{{< gist CADViewer 3cca1e610cedd0c4e25918bbbed5535f "cadviewer_aspdotnet_52.config" >}}


### HTML 


In folder:

<pre style="line-height: 110%">
c:/VisualStudio
    └─── cadviewer
            └── html
</pre>



identify your sample mysample.html file, and ensure that it loads the CADViewer_AshxHandlerSettings.js file: 

{{< gist CADViewer 4cb454d5f3e9209cf4bd69fc56f6dd5b "cadviewer_aspdotnet_53.html" >}}


### Handler Settings JS File 


In folder:

<pre style="line-height: 110%">
c:/VisualStudio
    └─── cadviewer
            └── app
                 └── cv
</pre>

Open the CADViewer_AshxHandlerSettings.js file, and ensure that the top variable settings correspond to your server settings: 

{{< gist CADViewer 96af82b6fa64c55a4a40b2e66ab3b1c8 "cadviewer_aspdotnet_54.js" >}}


Open a web-browser pointing to your sample html file:    **http:/localhost:44371/html/mysample.html**

Use the server traces and browser development console for debugging, alternatively contact our [Support](/cadviewertechdocs/support/)  

For debugging, the folder:
<pre style="line-height: 110%">
c:\cadviewer-testapp-dotnet-01
       └─── cadviewer
               └── temp_debug
</pre>
contains a debug file **callApiConversionHandlerLog.txt** that lists the command line and traces in the communication with the back-end converter AutoXchange 2020. If drawing files does not display, this file will contain useful information to pinpoint the issue.





## Troubleshooting

One issue that often appears in installations is that interface icons do not display properly:

![Icons](https://cadviewer.com/cadviewertechdocs/images/missing_icons.png "Icons missing")

Typically the variables *ServerUrl*, *ServerLocation* or *ServerBackEndUrl* in the controlling **HTML**  document in ***/cadviewer/html/*** are not set to reflect the front-end server url or port.

<pre style="line-height: 110%">


    var ServerBackEndUrl = "";  // or what is appropriate for my server; used for NodeJS server only
    var ServerUrl = "http://localhost/cadviewer/";   // or what is appropriate for my server
    var ServerLocation = "c:/xampp/htdocs/cadviewer/"; // or what is appropriate for my server
</pre>


