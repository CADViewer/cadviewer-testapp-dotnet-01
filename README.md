# cadviewer-testapp-dotnet-01
CADViewer sample implementation on dotNet w .ASHX Handlers



## Windows

### Folder Structure

For a CADViewer .NET installation on Windows, the base file-structure should be as below: 

<pre style="line-height: 110%">
c:\VisualStudio
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
c:\VisualStudio
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


Open a web-browser pointing to your sample html file:    **http:/localhost:53737/html/mysample.html**

Use the server traces and browser development console for debugging, alternatively contact our [Support](/cadviewertechdocs/support/)  

For debugging, the folder:
<pre style="line-height: 110%">
c:\VisualStudio
       └─── cadviewer
               └── temp_debug
</pre>
contains a debug file **callApiConversionHandlerLog.txt** that lists the command line and traces in the communication with the back-end converter AutoXchange 2020. If drawing files does not display, this file will contain useful information to pinpoint the issue.





## Troubleshooting

One issue that often appears in installations is that interface icons do not display properly:

![Icons](https://cadviewer.com/cadviewertechdocs/images/missing_icons.png "Icons missing")

Typically the variable ServerUrl in /cadviewer/app/cv/CADViewer_AshxHandlerSettings.js is not set to reflect the front-end server url or port.


