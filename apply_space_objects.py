import re

file_path = 'cadviewer/html/CADViewer_space_objects_canvas_API_12.html'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Extract the text from the old h4
h4_pattern = re.compile(r'<h4>.*?<img[^>]*cv-logo\.gif[^>]*>.*?</h4>', re.DOTALL | re.IGNORECASE)
h4_match = h4_pattern.search(content)

if h4_match:
    h4_block = h4_match.group(0)
    # Remove the h4 block
    content = content.replace(h4_block, '')
    
    # Extract text by removing the logo link
    text_extracted = re.sub(r'<a[^>]*><img[^>]*cv-logo\.gif[^>]*></a>', '', h4_block, flags=re.IGNORECASE)
    # clean up the remaining text slightly
    text_extracted = text_extracted.replace('@tailormade.com', '@cadviewer.com')
else:
    print("Could not find h4 block!")
    text_extracted = ''

# 2. Build the new header
new_header = f'''
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; padding: 10px 20px;">
        <div style="display: flex; align-items: center; gap: 20px;">
            <img src="../app/images/cadviewer_primary_logo.svg" height="40" alt="CADViewer Logo" />
            <h2 style="margin: 0; display: flex; align-items: center; gap: 10px;">
                <span style="background-color: #512bd4; color: white; padding: 2px 6px; border-radius: 4px; font-weight: bold; font-family: sans-serif; font-size: 16px; vertical-align: middle;">.NET</span>
                CADViewer Implementation Samples
            </h2>
            <div style="margin-left: 15px; font-size: 14px; max-width: 800px; color: #4b5563;">{text_extracted}</div>
        </div>
        <a href="https://github.com/CADViewer/cadviewer-testapp-dotnet-01" target="_blank" rel="noopener noreferrer" style="display: flex; align-items: center; gap: 6px; font-size: 16px; font-weight: bold; text-decoration: none; padding: 6px 12px; border-radius: 6px; border: 1px solid #d1d5db; background-color: #f9fafb; color: #0366d6; white-space: nowrap; margin-top: 10px;">
            <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" style="width: 20px; height: 20px;" alt="GitHub Logo" />
            <span>Pull or clone from GitHub</span>
        </a>
    </div>
    <div style="position: relative; width: 100%; height: 100vh;">
'''

# 3. Inject new header after <body ... >
body_pattern = re.compile(r'(<body[^>]*>)', re.IGNORECASE)
content = body_pattern.sub(r'\1' + new_header, content, count=1)

# 4. Inject closing div before </body>
content = re.sub(r'(</body>)', r'</div>\n\1', content, flags=re.IGNORECASE)

# Make sure we don't have BOM issues
with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated space_objects file correctly!")
