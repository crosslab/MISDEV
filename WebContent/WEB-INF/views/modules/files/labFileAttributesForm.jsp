<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".select-time-icon").css({
			    "width" : "163px"
			});
			$(".select2").css({
			    "width" : "177px"
			});
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/files/labFileAttributes/">文件资料列表</a></li>
		<li class="active"><a href="${ctx}/files/labFileAttributes/form?id=${labFileAttributes.id}"><shiro:hasPermission name="files:labFileAttributes:edit">${not empty labFileAttributes.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="files:labFileAttributes:edit">查看</shiro:lacksPermission>文件资料</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="labFileAttributes" action="${ctx}/files/labFileAttributes/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="fileid"/>
		<form:hidden path="filestatus"/>
		<sys:message content="${message}"/>		

		<div class="control-group">
			<label class="control-label" for="filename">文件资料名称：</label>
			<div class="controls">
				<form:input path="filename" htmlEscape="false" maxlength="256" class="input-medium "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="filecontrolid">文件资料控制编号：</label>
			<div class="controls">
				<form:input path="filecontrolid" htmlEscape="false" maxlength="64" class="input-medium "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="filestandard">图书标准名称：</label>
			<div class="controls">
				<form:input path="filestandard" htmlEscape="false" maxlength="128" class="input-medium "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="filetype">文件资料类型：</label>
			<div class="controls">
			 	<form:select path="filetype" class="select2 required">
			 	<form:options items="${fns:getDictList('file_standard_type')}"
                        itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="filearchivedate">文件资料归档日期：</label>
			<div class="controls">
				<input name="filearchivedate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileAttributes.filearchivedate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="usedate">投入使用日期：</label>
			<div class="controls">
				<input name="usedate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileAttributes.usedate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="placeaddress">目前存在地点：</label>
			<div class="controls">
				<form:input path="placeaddress" htmlEscape="false" maxlength="256" class="input-medium "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="remarks">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="files:labFileAttributes:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		
	</form:form>
</body>
</html>