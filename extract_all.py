import subprocess
import glob
import os
import re

files = glob.glob('cadviewer/html/*_12.html')

extracted_texts = {}

for file in files:
    filename = os.path.basename(file)
    cmd = ['git', 'show', f'HEAD~1:cadviewer/html/{filename}']
    result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    old_content = result.stdout
    
    match = re.search(r'<table.*?id="mainTable".*?>(.*?)</table>', old_content, re.DOTALL | re.IGNORECASE)
    if not match:
        continue
        
    table_content = match.group(1)
    
    # Let's remove the first few tds which just have the logo and 'dummy' canvas
    # The actual text is usually in the last <td> or td containing text like 'CADViewer'
    tds = re.findall(r'<td.*?>(.*?)</td>', table_content, re.DOTALL | re.IGNORECASE)
    
    text_content = ""
    for td in tds:
        # Ignore if it has the logo image
        if 'cv-logo.gif' in td or 'dummy' in td and len(re.sub(r'<[^>]+>', '', td).strip()) < 10:
            continue
            
        # Clean up the td content
        td_clean = td.replace('@tailormade.com', '@cadviewer.com')
        text_content += td_clean + " "
        
    text_content = text_content.strip()
    # Remove large gaps of whitespace
    text_content = re.sub(r'\s+', ' ', text_content)
    # Convert <br> or <p> to spaces for simple layout if needed, but keeping html is better
    # Let's just keep the HTML
    print(f"--- {filename} ---")
    print(text_content)
    print("")
