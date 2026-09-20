import subprocess
import glob
import os
import re

files = glob.glob('cadviewer/html/*_12.html')

for file in files:
    filename = os.path.basename(file)
    cmd = ['git', 'show', f'HEAD~1:cadviewer/html/{filename}']
    result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    old_content = result.stdout
    
    match = re.search(r'<table.*?id="mainTable".*?>(.*?)</table>', old_content, re.DOTALL | re.IGNORECASE)
    if not match:
        print(f"[{filename}] NO TABLE")
        continue
        
    table_content = match.group(1)
    
    # Remove logo images and back buttons so we just get the text
    # e.g., <img src="...cv-logo.gif"...>
    table_content = re.sub(r'<a[^>]*><img[^>]*cv-logo\.gif[^>]*></a>', '', table_content, flags=re.IGNORECASE)
    table_content = re.sub(r'<img[^>]*back01\.png[^>]*>', '', table_content, flags=re.IGNORECASE)
    table_content = re.sub(r'CADViewer Home', '', table_content, flags=re.IGNORECASE)
    table_content = re.sub(r'<canvas[^>]*dummy[^>]*></canvas>', '', table_content, flags=re.IGNORECASE)
    
    # Extract the remaining text inside <td>
    tds = re.findall(r'<td.*?>(.*?)</td>', table_content, re.DOTALL | re.IGNORECASE)
    
    text_content = ""
    for td in tds:
        td_clean = td.replace('@tailormade.com', '@cadviewer.com')
        td_clean = td_clean.strip()
        if td_clean:
            text_content += td_clean + " "
            
    text_content = text_content.strip()
    text_content = re.sub(r'\s+', ' ', text_content)
    
    if not text_content:
        print(f"[{filename}] NO TEXT")
        continue
        
    # Read current file
    with open(file, 'r', encoding='utf-8') as f:
        current_content = f.read()
        
    # Inject it to the right of the h2
    # The h2 ends with </h2>
    # We will inject a div right after it with margin-left
    injection = f'<div style="margin-left: 15px; font-size: 14px; max-width: 800px; color: #4b5563;">{text_content}</div>'
    
    # Find the h2 end tag and insert
    new_content = re.sub(r'(CADViewer Implementation Samples\s*</h2>)', r'\1' + '\n        ' + injection, current_content)
    
    with open(file, 'w', encoding='utf-8-sig') as f:
        f.write(new_content)
        
    print(f"[{filename}] UPDATED")
