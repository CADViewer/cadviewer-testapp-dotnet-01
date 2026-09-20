import subprocess
import re
import glob
import os

files = glob.glob('cadviewer/html/*_12.html')

for file in files:
    filename = os.path.basename(file)
    # Get the file content from the previous commit
    cmd = ['git', 'show', f'HEAD~1:cadviewer/html/{filename}']
    result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    old_content = result.stdout
    
    # Extract the original text block
    # It's usually inside <td><h4>...</h4><p>...</p></td>
    # Let's search for <h4>...</h4>
    match = re.search(r'<h4>(.*?)</h4>\s*<p>(.*?)</p>', old_content, re.DOTALL | re.IGNORECASE)
    
    if match:
        h4_text = match.group(1).strip()
        p_text = match.group(2).strip()
        
        # Replace tailormade.com with cadviewer.com
        p_text = p_text.replace('@tailormade.com', '@cadviewer.com')
        
        extracted = f"<strong>{h4_text}</strong> - {p_text}"
        print(f"[{filename}] EXTRACTED: {extracted}")
    else:
        print(f"[{filename}] NOT FOUND")
