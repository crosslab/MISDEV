<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请借阅文件资料</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$(".control-label").css({
			    "width" : "200px"
			});
			$(".select-time-icon").css({
			    "width" : "163px"
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
		<li><a href="${ctx}/files/labFileBorrow/">文件资料借阅列表</a></li>
		<li class="active"><a href="${ctx}/files/labFileBorrow/form?id=${labFileBorrow.id}"><shiro:hasPermission name="files:labFileBorrow:edit">${not empty labFileBorrow.id?'修改':'申请'}</shiro:hasPermission><shiro:lacksPermission name="files:labFileBorrow:edit">查看</shiro:lacksPermission>借阅文件资料</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="labFileBorrow" action="${ctx}/files/labFileBorrow/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="fileborrowstatus"/>
		<form:hidden path="fileborrowid"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label" for="reqname">申请人姓名：</label>
			<div class="controls">
				<form:input path="reqname" htmlEscape="false" maxlength="64" class="input-medium "/>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="reqdepartment">申请借阅部门：</label>
			<div class="controls">
				<form:input path="reqdepartment" htmlEscape="false" maxlength="128" class="input-medium "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqstartdate">预计申请开始日期：</label>
			<div class="controls">
				<input name="reqstartdate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileBorrow.reqstartdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqenddate">预计申请截止日期：</label>
			<div class="controls">
				<input name="reqenddate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileBorrow.reqenddate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqreason">申请借阅原因：</label>
			<div class="controls">
				<form:textarea path="reqreason" htmlEscape="false" maxlength="256" rows="4" class="input-xxlarge "/>
			</div>
		</div>		
		
		<div class="control-group">
			<label class="control-label" for="reqcontentcount">申请文件资料名称及数量：</label>
			<div class="controls">
				<form:textarea path="reqcontentcount" htmlEscape="false" maxlength="1024" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="remarks">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="files:labFileBorrow:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>