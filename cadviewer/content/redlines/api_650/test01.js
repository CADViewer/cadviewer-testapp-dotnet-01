var cvjs_stickyNotesRedlines_Base = {
					0: {
						node: "RED_1",
						name: "redline1",
						id: "1",
						layer: "RedLineLayer",
						group: "unassigned",
						color: "#FF0000",
						strokeWidth: "4",
						fill: "#FF0000",
						username: "Bob Smith",
						userid: "user_1",
						currentPage: 2,
						triangle_design: "none",
						polypath_arrow: "none",
						redline_text: "none",
						redline_font_size: "undefined",
						fill_opacity: "0.1",
						transform: "none",
						drawingRotation: 0
					}
						,
					1: {
						node: "RED_2",
						name: "redline2",
						id: "2",
						layer: "RedLineLayer",
						group: "unassigned",
						color: "#FF0000",
						strokeWidth: "4",
						fill: "#FF0000",
						username: "Bob Smith",
						userid: "user_1",
						currentPage: 2,
						triangle_design: "none",
						polypath_arrow: "none",
						redline_text: "none",
						redline_font_size: "undefined",
						fill_opacity: "0.1",
						transform: "none",
						drawingRotation: 0
					}
						,
					2: {
						node: "RED_3",
						name: "redline3",
						id: "3",
						layer: "RedLineLayer",
						group: "unassigned",
						color: "#FF0000",
						strokeWidth: "4",
						fill: "#FF0000",
						username: "Bob Smith",
						userid: "user_1",
						currentPage: 2,
						triangle_design: "none",
						polypath_arrow: "none",
						redline_text: "none",
						redline_font_size: "undefined",
						fill_opacity: "0.1",
						transform: "none",
						drawingRotation: 0
					}
						,
					3: {
						node: "RED_4",
						name: "redline4",
						id: "4",
						layer: "RedLineLayer",
						group: "unassigned",
						color: "#FF0000",
						strokeWidth: "4",
						fill: "#FF0000",
						username: "Bob Smith",
						userid: "user_1",
						currentPage: 2,
						triangle_design: "none",
						polypath_arrow: "none",
						redline_text: "none",
						redline_font_size: "undefined",
						fill_opacity: "0.1",
						transform: "none",
						drawingRotation: 0
					}
						,
					4: {
						node: "RED_5",
						name: "redline5",
						id: "5",
						layer: "RedLineLayer",
						group: "unassigned",
						color: "#FF0000",
						strokeWidth: "4",
						fill: "#FF0000",
						username: "Bob Smith",
						userid: "user_1",
						currentPage: 2,
						triangle_design: "none",
						polypath_arrow: "none",
						redline_text: "none",
						redline_font_size: "undefined",
						fill_opacity: "0.1",
						transform: "none",
						drawingRotation: 0
					}
						,
					5: {
						node: "SNOTE_2",
						name: "Bob Smith",
						id: "2",
						layer: "RedlineLayer",
						group: "unassigned",
						text: "Test1",
						userid: "user_1",
						currentPage: 2,
						date: "Wed Aug 18 2021 13:39:30 GMT+0200 (centraleuropeisk sommartid)",
						linked: true,
						transform: "T1583.892340425532,335.9234042553191S3.345",
						drawingRotation: 0
					}
}

function cvjs_setUpStickyNotesRedlines(paper){

var cItemRed1= paper.path("M450.86255319148944,295.3563829787234h572.9202127659574v925.2127659574468h-572.9202127659574v-925.2127659574468 Z       ").attr({stroke: "#FF0000", "stroke-width": "4", "fill": "#FF0000", "fill-opacity": "0.1"})
.data("node","RED_1");
vqRedlines.push(cItemRed1);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[0]);

var cItemRed2= paper.path("M1926.7665460526316,953.985197368421h878.0625v792.2368421052631h-878.0625v-792.2368421052631 Z    ").attr({stroke: "#FF0000", "stroke-width": "4", "fill": "#FF0000", "fill-opacity": "0.1"})
.data("node","RED_2");
vqRedlines.push(cItemRed2);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[1]);

var cItemRed3= paper.path("M1329.287927631579,680.0032894736842h402.7203947368421v415.9243421052632h-402.7203947368421v-415.9243421052632 Z   ").attr({stroke: "#FF0000", "stroke-width": "4", "fill": "#FF0000", "fill-opacity": "0.1"})
.data("node","RED_3");
vqRedlines.push(cItemRed3);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[2]);

var cItemRed4= paper.path("M1455.078125,1325.2257291666667h250.65104166666669v175.78125000000003h-250.65104166666669v-175.78125000000003 Z  ").attr({stroke: "#FF0000", "stroke-width": "4", "fill": "#FF0000", "fill-opacity": "0.1"})
.data("node","RED_4");
vqRedlines.push(cItemRed4);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[3]);

var cItemRed5= paper.path("M2094.5559756097564,443.8243902439024h319.81463414634146v186.01463414634145h-319.81463414634146v-186.01463414634145 Z ").attr({stroke: "#FF0000", "stroke-width": "4", "fill": "#FF0000", "fill-opacity": "0.1"})
.data("node","RED_5");
vqRedlines.push(cItemRed5);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[4]);

 cvjs_redline=5; 

var itemSNote1=paper.group(paper.path("M0,0h20v20h-20v-20Z").attr({stroke: "#000000", "stroke-width" : "1.0"}),paper.path("M7,12h1.3M9.5,12h3.5M11.25,12v5M9.75,12v1.75M12.75,12v1.75M10.5,17h1.5M7,13.5h1.3M7,15.25h3M7,17.0h2.2").attr({stroke: "#000000", "stroke-width" : "0.5"}),paper.text(6,9,"#2").attr({"font-size": "8px", "font-style": "italic", stroke: "#000000", "stroke-width" : "0.3", "stroke" : "0.3", "fill" : "#000000", "fill-opacity" : 1.0})).attr({'transform': "t0,0S0.01" , "opacity" : "0.1"}).attr({	fill: '#FFF', "fill-opacity": "0.8", stroke: '#000', 'stroke-opacity': "1" })
.data("node","SNOTE_2");
vqStickyNotes.push(itemSNote1);

cvjs_stickyNotesRedlines.push(cvjs_stickyNotesRedlines_Base[5]);

 cvjs_stickynote=1; 

}

jQuery(document).ready(function() { 
	stickynotesRedlines_loaded = true; 
}); 
stickynotesRedlines_loaded = true; 
