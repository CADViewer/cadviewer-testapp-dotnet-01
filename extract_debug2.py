import subprocess
import re

cmd = ['git', 'show', 'HEAD~1:cadviewer/html/CADViewer_icon_commands_API_12.html']
result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
old_content = result.stdout

match = re.search(r'<table.*?id="mainTable".*?>(.*?)</table>', old_content, re.DOTALL | re.IGNORECASE)
if match:
    print(match.group(1)[:1000])
