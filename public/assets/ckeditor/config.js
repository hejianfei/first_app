/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(a){a.filebrowserBrowseUrl="/ckeditor/attachment_files",a.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",a.filebrowserFlashUploadUrl="/ckeditor/attachment_files",a.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",a.filebrowserImageBrowseUrl="/ckeditor/pictures",a.filebrowserImageUploadUrl="/ckeditor/pictures",a.filebrowserUploadUrl="/ckeditor/attachment_files",a.filebrowserParams=function(){var a,b,c,d=document.getElementsByTagName("meta"),e=new Object;for(var f=0;f<d.length;f++){c=d[f];switch(c.name){case"csrf-token":a=c.content;break;case"csrf-param":b=c.content;break;default:continue}}return b!==undefined&&a!==undefined&&(e[b]=a),e},a.addQueryString=function(a,b){var c=[];if(!b)return a;for(var d in b)c.push(d+"="+encodeURIComponent(b[d]));return a+(a.indexOf("?")!=-1?"&":"?")+c.join("&")},CKEDITOR.on("dialogDefinition",function(b){var c=b.data.name,d=b.data.definition,e,f;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],c)>-1&&(e=d.getContents("Upload")||d.getContents("upload"),f=e==null?null:e.get("upload"),f&&f.filebrowser["params"]==null&&(f.filebrowser.params=a.filebrowserParams(),f.action=a.addQueryString(f.action,f.filebrowser.params)))}),a.extraPlugins="embed,attachment",a.toolbar="Easy",a.toolbar_Easy=[["Source","-","Preview"],["Cut","Copy","Paste","PasteText","PasteFromWord"],["Undo","Redo","-","SelectAll","RemoveFormat"],["Styles","Format"],["Subscript","Superscript","TextColor"],["Maximize","-","About"],"/",["Bold","Italic","Underline","Strike"],["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"],["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],["Link","Unlink","Anchor"],["Image","Attachment","Flash","Embed"],["Table","HorizontalRule","Smiley","SpecialChar","PageBreak"]]};