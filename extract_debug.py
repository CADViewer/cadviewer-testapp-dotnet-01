import subprocess
import glob
import os

files = ['CADViewer_icon_commands_API_12.html', 'CADViewer_multiselect_12.html', 'CADViewer_space_objects_canvas_API_12.html', 'CADViewer_textsearch_12.html']

for filename in files:
    cmd = ['git', 'show', f'HEAD~1:cadviewer/html/{filename}']
    result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    old_content = result.stdout
    
    # Just print the middle part where the table is
    import re
    match = re.search(r'<table.*?id="mainTable".*?</table>', old_content, re.DOTALL | re.IGNORECASE)
    if match:
        print(f"[{filename}] TABLE:\n{match.group(0)[:500]}...\n")
