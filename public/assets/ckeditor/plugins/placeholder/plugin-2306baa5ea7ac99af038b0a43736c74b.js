/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){var a=/\[\[[^\]]+\]\]/g;CKEDITOR.plugins.add("placeholder",{requires:["dialog"],lang:["bg","cs","cy","da","de","el","en","eo","et","fa","fi","fr","he","hr","it","nb","nl","no","pl","pt-br","tr","ug","uk","vi","zh-cn"],init:function(a){var b=a.lang.placeholder;a.addCommand("createplaceholder",new CKEDITOR.dialogCommand("createplaceholder")),a.addCommand("editplaceholder",new CKEDITOR.dialogCommand("editplaceholder")),a.ui.addButton("CreatePlaceholder",{label:b.toolbar,command:"createplaceholder",icon:this.path+"placeholder.gif"}),a.addMenuItems&&(a.addMenuGroup("placeholder",20),a.addMenuItems({editplaceholder:{label:b.edit,command:"editplaceholder",group:"placeholder",order:1,icon:this.path+"placeholder.gif"}}),a.contextMenu&&a.contextMenu.addListener(function(a,b){return!a||!a.data("cke-placeholder")?null:{editplaceholder:CKEDITOR.TRISTATE_OFF}})),a.on("doubleclick",function(b){CKEDITOR.plugins.placeholder.getSelectedPlaceHoder(a)&&(b.data.dialog="editplaceholder")}),a.addCss(".cke_placeholder{background-color: #ffff00;"+(CKEDITOR.env.gecko?"cursor: default;":"")+"}"),a.on("contentDom",function(){a.document.getBody().on("resizestart",function(b){a.getSelection().getSelectedElement().data("cke-placeholder")&&b.data.preventDefault()})}),CKEDITOR.dialog.add("createplaceholder",this.path+"dialogs/placeholder.js"),CKEDITOR.dialog.add("editplaceholder",this.path+"dialogs/placeholder.js")},afterInit:function(b){var c=b.dataProcessor,d=c&&c.dataFilter,e=c&&c.htmlFilter;d&&d.addRules({text:function(c){return c.replace(a,function(a){return CKEDITOR.plugins.placeholder.createPlaceholder(b,null,a,1)})}}),e&&e.addRules({elements:{span:function(a){a.attributes&&a.attributes["data-cke-placeholder"]&&delete a.name}}})}})})(),CKEDITOR.plugins.placeholder={createPlaceholder:function(a,b,c,d){var e=new CKEDITOR.dom.element("span",a.document);return e.setAttributes({contentEditable:"false","data-cke-placeholder":1,"class":"cke_placeholder"}),c&&e.setText(c),d?e.getOuterHtml():(b?CKEDITOR.env.ie?(e.insertAfter(b),setTimeout(function(){b.remove(),e.focus()},10)):e.replace(b):a.insertElement(e),null)},getSelectedPlaceHoder:function(a){var b=a.getSelection().getRanges()[0];b.shrink(CKEDITOR.SHRINK_TEXT);var c=b.startContainer;while(c&&(c.type!=CKEDITOR.NODE_ELEMENT||!c.data("cke-placeholder")))c=c.getParent();return c}};