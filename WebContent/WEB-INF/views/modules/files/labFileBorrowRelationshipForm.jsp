<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料与借阅单号关联管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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
		<li><a href="${ctx}/files/labFileBorrowRelationship/">文件资料与借阅单号关联列表</a></li>
		<li class="active"><a href="${ctx}/files/labFileBorrowRelationship/form?id=${labFileBorrowRelationship.id}"><shiro:hasPermission name="files:labFileBorrowRelationship:edit">${not empty labFileBorrowRelationship.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="files:labFileBorrowRelationship:edit">查看</shiro:lacksPermission>文件资料与借阅单号关联</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="labFileBorrowRelationship" action="${ctx}/files/labFileBorrowRelationship/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		

		<div class="control-group">
			<label class="control-label" for="fileid">文件资料编号：</label>
			<div class="controls">
				<form:input path="fileid" htmlEscape="false" maxlength="64" class="input-small "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="borrowid">文件资料借阅编号：</label>
			<div class="controls">
				<form:input path="borrowid" htmlEscape="false" maxlength="64" class="input-small "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="remarks">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-small "/>
			</div>
		</div>
				
		<div class="form-actions">
			<shiro:hasPermission name="files:labFileBorrowRelationship:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>