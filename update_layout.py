import re

with open('cadviewer/Default.aspx', 'r', encoding='utf-8') as f:
    content = f.read()

# We want to replace the div id="item_2C" block.
# Let's find <div id="item_2C" class="col-lg-12"> and <hr />
pattern = re.compile(r'<div id="item_2C" class="col-lg-12">.*?</div>\s*</div>\s*<hr />', re.DOTALL)

new_content = r'''<div id="item_2C" class="col-lg-12">
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
<hr />'''

result = pattern.sub(new_content, content)

with open('cadviewer/Default.aspx', 'w', encoding='utf-8') as f:
    f.write(result)

print("Replaced successfully!")
