<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>借阅文件资料详情</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".control-label").css({
			    "width" : "200px"
			});
			$(".select-time-icon").css({
			    "width" : "163px"
			});
			$(".select2").css({
			    "width" : "177px"
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/files/labFileBorrow/">文件资料借阅列表</a></li>
		<li class="active"><a href="${ctx}/files/labFileBorrow/form?id=${labFileBorrow.id}">查看文件资料借阅信息</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="labFileBorrow" action="${ctx}/files/labFileBorrow/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label" for="fileborrowid">文件资料借阅单号：</label>
			<div class="controls">
				<form:input path="fileborrowid" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
			</div>
		</div>
		
		<shiro:hasPermission name="files:labFileBorrow:edit">
		
			<div class="control-group">
				<label class="control-label" for="fileborrowstatus">文件资料借阅状态：</label>
				<div class="controls">
				 	<form:select path="fileborrowstatus" class="select2 required" disabled="true">
				 	<form:options items="${fns:getDictList('file_borrow_status')}"
	                        itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</div>
			</div>
			
		</shiro:hasPermission>
		
		<div class="control-group">
			<label class="control-label" for="reqname">申请人姓名：</label>
			<div class="controls">
				<form:input path="reqname" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="reqdepartment">申请借阅部门：</label>
			<div class="controls">
				<form:input path="reqdepartment" htmlEscape="false" maxlength="128" class="input-medium " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqstartdate">预计申请开始日期：</label>
			<div class="controls">
				<input name="reqstartdate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileBorrow.reqstartdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqenddate">预计申请截止日期：</label>
			<div class="controls">
				<input name="reqenddate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileBorrow.reqenddate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="reqreason">申请借阅原因：</label>
			<div class="controls">
				<form:textarea path="reqreason" htmlEscape="false" maxlength="256" rows="4" class="input-xxlarge " readonly="true"/>
			</div>
		</div>	
		<div class="control-group">
			<label style="width:200px" class="control-label"  for="reqcontentcount">申请文件资料名称及数量：</label>
			<div class="controls">
				<form:textarea path="reqcontentcount" htmlEscape="false" maxlength="1024" rows="4" class="input-xxlarge " readonly="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="remarks">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " readonly="true"/>
			</div>
		</div>
		
		<shiro:hasPermission name="files:labFileBorrow:edit">
			<div class="control-group">
				<label class="control-label" for="approvename">审批人姓名：</label>
				<div class="controls">
					<form:input path="approvename" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="approveopinion">审批人意见：</label>
				<div class="controls">
					<form:textarea path="approveopinion" htmlEscape="false" maxlength="256" rows="4" class="input-xxlarge " readonly="true"/>
				</div>
			</div>
	
			<div class="control-group">
				<label class="control-label" for="approvedate">审批的日期：</label>
				<div class="controls">
					<input name="approvedate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
						value="<fmt:formatDate value="${labFileBorrow.approvedate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="borrowexecuter">借阅经办人：</label>
				<div class="controls">
					<form:input path="borrowexecuter" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="borrowrecheck">借阅复核人：</label>
				<div class="controls">
					<form:input path="borrowrecheck" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="borrowrecheckdate">借阅执行日期：</label>
				<div class="controls">
					<input name="borrowrecheckdate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
						value="<fmt:formatDate value="${labFileBorrow.borrowrecheckdate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="revertexecuter">归还经办人：</label>
				<div class="controls">
					<form:input path="revertexecuter" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="revertrecheck">归还复核人：</label>
				<div class="controls">
					<form:input path="revertrecheck" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="revertrecheckdate">归还执行日期：</label>
				<div class="controls">
					<input name="revertrecheckdate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
						value="<fmt:formatDate value="${labFileBorrow.revertrecheckdate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
				</div>
			</div>
		</shiro:hasPermission>
		
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>