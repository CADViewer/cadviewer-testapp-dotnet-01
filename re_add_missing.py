import re

file_path = 'cadviewer/html/CADViewer_space_objects_canvas_API_12.html'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add svg2pdf
content = content.replace('<script src="../app/js/jspdf.umd.min.js"></script>', '<script src="../app/js/jspdf.umd.min.js"></script>\n\t<script src="../app/js/svg2pdf.umd.min.js"></script>')

# 2. Add cvjs_processCompleted before cvjs_graphicalObjectCreated
callback = '''\n\tfunction cvjs_processCompleted(process) {\n\t\tconsole.log("cvjs_processCompleted: " + process);\n\n\t}\n\n'''
content = content.replace('function cvjs_graphicalObjectCreated(graphicalObject){', callback + '\tfunction cvjs_graphicalObjectCreated(graphicalObject){')

with open(file_path, 'w', encoding='utf-8-sig') as f:
    f.write(content)
