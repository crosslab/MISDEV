/*!
 * Copyright &copy; 2012-2014 <a href="https://github.com/labs/labs">labs</a> All rights reserved.
 * 
 * 通用公共方法
 * @author labs
 * @version 2014-4-29
 */
$(document).ready(function() {
	try{
		// 链接去掉虚框
		$("a").bind("focus",function() {
			if(this.blur) {this.blur()};
		});
		//所有下拉框使用select2
		$("select").select2();
	}catch(e){
		// blank
	}
});

var PAGELIST="[10,20,30,50,100]";

// 引入js和css文件
function include(id, path, file){
	if (document.getElementById(id)==null){
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++){
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i==0?" id="+id:"") + attr + link + "></" + tag + ">");
        }
	}
}

// 获取URL地址参数
function getQueryString(name, url) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    if (!url || url == ""){
	    url = window.location.search;
    }else{	
    	url = url.substring(url.indexOf("?"));
    }
    r = url.substr(1).match(reg)
    if (r != null) return unescape(r[2]); return null;
}

//获取字典标签
function getDictLabel(data, value, defaultValue){
	for (var i=0; i<data.length; i++){
		var row = data[i];
		if (row.value == value){
			return row.label;
		}
	}
	return defaultValue;
}

// 打开一个窗体
function windowOpen(url, name, width, height){
	var top=parseInt((window.screen.height-height)/2,10),left=parseInt((window.screen.width-width)/2,10),
		options="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,"+
		"resizable=yes,scrollbars=yes,"+"width="+width+",height="+height+",top="+top+",left="+left;
	window.open(url ,name , options);
}

// 恢复提示框显示
function resetTip(){
	top.$.jBox.tip.mess = null;
}

// 关闭提示框
function closeTip(){
	top.$.jBox.closeTip();
}

//显示提示框
function showTip(mess, type, timeout, lazytime){
	resetTip();
	setTimeout(function(){
		top.$.jBox.tip(mess, (type == undefined || type == '' ? 'info' : type), {opacity:0, 
			timeout:  timeout == undefined ? 2000 : timeout});
	}, lazytime == undefined ? 500 : lazytime);
}

// 显示加载框
function loading(mess){
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	resetTip();
	top.$.jBox.tip(mess,'loading',{opacity:0});
}

// 警告对话框
function alertx(mess, closed){
	top.$.jBox.info(mess, '提示', {closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	top.$('.jbox-body .jbox-icon').css('top','55px');
}

// 确认对话框
function confirmx(mess, href, closed){
	top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
		if(v=='ok'){
			if (typeof href == 'function') {
				href();
			}else{
				resetTip(); //loading();
				location = href;
			}
		}
	},{buttonsFocus:1, closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	top.$('.jbox-body .jbox-icon').css('top','55px');
	return false;
}

// 提示输入对话框
function promptx(title, lable, href, closed){
	top.$.jBox("<div class='form-search' style='padding:20px;text-align:center;'>" + lable + "：<input type='text' id='txt' name='txt'/></div>", {
			title: title, submit: function (v, h, f){
	    if (f.txt == '') {
	        top.$.jBox.tip("请输入" + lable + "。", 'error');
	        return false;
	    }
		if (typeof href == 'function') {
			href();
		}else{
			resetTip(); //loading();
			location = href + encodeURIComponent(f.txt);
		}
	},closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	return false;
}

// 添加TAB页面
function addTabPage(title, url, closeable, $this, refresh){
	top.$.fn.jerichoTab.addTab({
        tabFirer: $this,
        title: title,
        closeable: closeable == undefined,
        data: {
            dataType: 'iframe',
            dataLink: url
        }
    }).loadData(refresh != undefined);
}

// cookie操作
function cookie(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}

// 数值前补零
function pad(num, n) {
    var len = num.toString().length;
    while(len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

// 转换为日期
function strToDate(date){
	return new Date(date.replace(/-/g,"/"));
}

// 日期加减
function addDate(date, dadd){  
	date = date.valueOf();
	date = date + dadd * 24 * 60 * 60 * 1000;
	return new Date(date);  
}

//截取字符串，区别汉字和英文
function abbr(name, maxLength){  
 if(!maxLength){  
     maxLength = 20;  
 }  
 if(name==null||name.length<1){  
     return "";  
 }  
 var w = 0;//字符串长度，一个汉字长度为2   
 var s = 0;//汉字个数   
 var p = false;//判断字符串当前循环的前一个字符是否为汉字   
 var b = false;//判断字符串当前循环的字符是否为汉字   
 var nameSub;  
 for (var i=0; i<name.length; i++) {  
    if(i>1 && b==false){  
         p = false;  
    }  
    if(i>1 && b==true){  
         p = true;  
    }  
    var c = name.charCodeAt(i);  
    //单字节加1   
    if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {  
         w++;  
         b = false;  
    }else {  
         w+=2;  
         s++;  
         b = true;  
    }  
    if(w>maxLength && i<=name.length-1){  
         if(b==true && p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(b==false && p==false){  
             nameSub = name.substring(0,i-3)+"...";  
         }  
         if(b==true && p==false){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         break;  
    }  
 }  
 if(w<=maxLength){  
     return name;  
 }  
 return nameSub;  
}

/**
 * url
 * jsonString
 * success
 * error
 */
function postJson(url,jsonString,success,error){
	$.ajax({ 
        type:"POST", 
        url:url, 
        dataType:"json",      
        contentType:"application/json;charset=UTF-8",               
        data:jsonString, 
        cache:false,
        success:success,
        error:error,
        statusCode: {404: function() {
            alert('页面不存在');
          },500: function() {
            alert('内部错误');
          }
        }
     }); 
}

function makeFormReadOnly(formId){
	$("#"+formId+" :text").prop("readOnly","readOnly");
	$("#"+formId+" :password").prop("readOnly","readOnly");
	$("#"+formId+" :file").prop("readOnly","readOnly");
	$("#"+formId+" textarea").prop("readOnly","readOnly");
	
	$("#"+formId+" :checkbox").prop("disabled","disabled");
	$("#"+formId+" :radio").prop("disabled","disabled");
}

function removeFormReadOnly(formId){
	$("#"+formId+" :text").removeProp("readOnly","readOnly");
	$("#"+formId+" :password").removeProp("readOnly","readOnly");
	$("#"+formId+" :file").removeProp("readOnly","readOnly");
	$("#"+formId+" textarea").removeProp("readOnly","readOnly");
	
	$("#"+formId+" :checkbox").removeProp("disabled","disabled");
	$("#"+formId+" :radio").removeProp("disabled","disabled");
}

//拖动bootstrap 弹出框,使用方法$('.modal-header').bind('mousedown', {target : $("#myModal")
//}, onMouseDown).css('cursor', 'move');
var doDown = function(e) {
	var dragData = e.data;
	dragData.target.find('.draggable').hide();
	return false;
}

var doMove = function(e) {
	var dragData = e.data;
	var left = dragData.startLeft + e.pageX - dragData.startX;
	var top = dragData.startTop + e.pageY - dragData.startY;
	if (true) {
		var minTop = 1;
		var maxTop = document.documentElement.clientHeight
				- e.data.target.height() / 2 - 1;
		var minLeft = 1;
		var maxLeft = document.documentElement.clientWidth
				- e.data.target.width() / 2 - 1;
		if (top < minTop)
			top = minTop;
		if (top > maxTop)
			top = maxTop;
		if (left < minLeft)
			left = minLeft;
		if (left > maxLeft)
			left = maxLeft;
	}
	dragData.target.css({
		left : left,
		top : top
	});
	return false;
}
var doUp = function(e) {
	$(document).unbind('.draggable');
	e.data.target.find('.draggable').show();
	return false;
}
var onMouseDown = function(e) {
	var position = e.data.target.position();
	var data = {
		target : e.data.target,
		startX : e.pageX,
		startY : e.pageY,
		startLeft : position.left,
		startTop : position.top
	};
	$(document).bind('mousedown.draggable', data, doDown).bind(
			'mousemove.draggable', data, doMove).bind(
			'mouseup.draggable', data, doUp);
}
//end拖动

// 解决select2组件在modal对话框中不能过滤问题
$.fn.modal.Constructor.prototype.enforceFocus=function(){
	  var that = this;
	  $(document).on("focusin.modal",function(e){
	  if($(e.target).hasClass("select2-input")) {return true;}
	   /* if(that.$element[0] !=e.target && !that.$element.has(e.target).length){
	     that.$element.focus();
	   } */
	   });
};

/**
 *
 * 校验表单
 * formId 表单id
 * handler 提交时回调 
 */
function onSubmitx(formId, handler) {
	$("#" + formId).validate(
			{
				submitHandler : handler,
				errorContainer : "#messageBox",
				errorPlacement : function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio")
							|| element.parent().is(".input-append")) {
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
}

$.fn.button.defaults = {
    loadingText: '提交中...'
}

//提交时，设置提交按钮忙碌，可以防止重复提交等问题。
//参数：context:提交按钮所在context,一般是form；jQ对象；
function busying(context){
    $("input[type='submit']",context).each(function(i,e){
    	$(this).attr("data-loading-text","稍等...").button("loading");
    	//console.log(i);console.log(e);
    });
}