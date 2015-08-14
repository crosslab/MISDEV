<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>字典管理</title>
<meta name="decorator" content="default" />
<link rel="stylesheet" href="${ctxStatic}/bootstrap-table/bootstrap-table.css" />
<script src="${ctxStatic}/bootstrap-table/bootstrap-table.js"></script>
<script src="${ctxStatic}/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			$("#value").focus();
			$("#inputForm").validate(
				{
					submitHandler : function(form) {
						loading('正在提交，请稍等...');
						form.submit();
					},
					errorContainer : "#messageBox",
					errorPlacement : function(error, element) {
						$("#messageBox").text("输入有误，请先更正。");
						if (element.is(":checkbox")
								|| element.is(":radio")
								|| element.parent().is(
										".input-append")) {
							error.appendTo(element.parent()
									.parent());
						} else {
							error.insertAfter(element);
						}
					}
				});
			<shiro:lacksPermission name="sys:dict:edit">
			     makeFormReadOnly("inputForm");
			</shiro:lacksPermission>
		});
	
       var  modalCallback = function(rs){
           alert(JSON.stringify(rs));
       };
</script>
<style type="text/css">
.mc{
    width:600px;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/dict/">字典列表</a></li>
		<li class="active">
		<a href="${ctx}/sys/dict/form?id=${dict.id}">字典
			<shiro:hasPermission name="sys:dict:edit">${not empty dict.id?'修改':'添加'}</shiro:hasPermission>
			<shiro:lacksPermission name="sys:dict:edit">查看</shiro:lacksPermission>
		</a>
		</li>
	</ul>
	<form:form id="inputForm" modelAttribute="dict"
            action="${ctx}/sys/dict/save" method="post" class="form-horizontal">
            <form:hidden path="id" />
            <sys:message content="${message}" />
            <div class="control-group">
                <label class="control-label">键值:</label>
                <div class="controls">
                    <form:input path="value" htmlEscape="false" maxlength="50"
                        class="required" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">标签:</label>
                <div class="controls">
                    <form:input path="label" htmlEscape="false" maxlength="50"
                        class="required" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">类型:</label>
                <div class="controls">
                    <form:select id="type" path="type" class="select2 required" >
                        <form:option value="" label="" />
                        <form:options items="${typeList}" itemValue="code"
                            itemLabel="name" htmlEscape="false" />
                    </form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">描述:</label>
                <div class="controls">
                    <form:input path="description" htmlEscape="false" maxlength="50"
                        class="required" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">排序:</label>
                <div class="controls">
                    <form:input path="sort" htmlEscape="false" maxlength="11"
                        class="required digits" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注:</label>
                <div class="controls">
                    <form:textarea path="remarks" htmlEscape="false" rows="3"
                        maxlength="200" class="input-large" />
                </div>
            </div>
            </div>
            <div class="form-actions">
                    <shiro:hasPermission name="sys:dict:edit">
                    <!-- 查看时隐藏保存按钮 -->
                        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存" />&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
</body>
</html>