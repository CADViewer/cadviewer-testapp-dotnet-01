import re
import os
import glob

# The new header HTML
new_header = r'''<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; padding: 10px 20px;">
    <div style="display: flex; align-items: center; gap: 20px;">
        <img src="../app/images/cadviewer_primary_logo.svg" height="40" alt="CADViewer Logo" />
        <h2 style="margin: 0; display: flex; align-items: center; gap: 10px;">
            <span style="background-color: #512bd4; color: white; padding: 2px 6px; border-radius: 4px; font-weight: bold; font-family: sans-serif; font-size: 16px; vertical-align: middle;">.NET</span>
            CADViewer Implementation Samples
        </h2>
    </div>
    <a href="https://github.com/CADViewer/cadviewer-testapp-dotnet-01" target="_blank" rel="noopener noreferrer" style="display: flex; align-items: center; gap: 6px; font-size: 16px; font-weight: bold; text-decoration: none; padding: 6px 12px; border-radius: 6px; border: 1px solid #d1d5db; background-color: #f9fafb; color: #0366d6; white-space: nowrap; margin-top: 10px;">
      <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" style="width: 20px; height: 20px;" alt="GitHub Logo" />
      <span>Pull or clone from GitHub</span>
    </a>
</div>'''

pattern = re.compile(r'<table[^>]*id="mainTable".*?</table>', re.DOTALL | re.IGNORECASE)

files = glob.glob('cadviewer/html/*_12.html')
for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if pattern.search(content):
        new_content = pattern.sub(new_header, content)
        with open(file, 'w', encoding='utf-8-sig') as f:
            f.write(new_content)
        print(f"Updated {file}")
    else:
        print(f"mainTable not found in {file}")
