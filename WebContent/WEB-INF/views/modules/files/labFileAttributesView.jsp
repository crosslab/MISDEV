<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料详细信息</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".select-time-icon").css({
			    "width" : "163px"
			});
			$(".select2").css({
			    "width" : "177px"
			});
		});
		
		function viewPrint(){
			$("#inputForm").submit();
        	return true;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/files/labFileAttributes/">文件资料列表</a></li>
		<li class="active"><a href="${ctx}/files/labFileAttributes/view?id=${labFileAttributes.id}">查看文件资料</a></li>
	</ul>
    <legend>基本信息</legend>
	<form:form id="inputForm" modelAttribute="labFileAttributes" action="${ctx}/files/labFileAttributes/viewPrint" method="post" class="form-horizontal" target="_blank">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		

		<div class="control-group">
			<label class="control-label" for="fileid">文件资料编号：</label>
			<div class="controls">
				<form:input path="fileid" htmlEscape="false" maxlength="64" class="input-medium" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="filename">文件资料名称：</label>
			<div class="controls">
				<form:input path="filename" htmlEscape="false" maxlength="256" class="input-medium " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="filecontrolid">文件资料控制编号：</label>
			<div class="controls">
				<form:input path="filecontrolid" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="filestandard">图书标准名称：</label>
			<div class="controls">
				<form:input path="filestandard" htmlEscape="false" maxlength="128" class="input-medium " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="filetype">文件资料类型：</label>
			<div class="controls">
			 	<form:select path="filetype" class="select2 required" disabled="true">
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
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="usedate">投入使用日期：</label>
			<div class="controls">
				<input name="usedate" type="text" readonly="readonly" maxlength="20" class="select-time-icon Wdate "
					value="<fmt:formatDate value="${labFileAttributes.usedate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="disabled"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="placeaddress">目前存在地点：</label>
			<div class="controls">
				<form:input path="placeaddress" htmlEscape="false" maxlength="256" class="input-medium " readonly="true"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="filestatus">当前状态：</label>
			<div class="controls">
			 	<form:select path="filestatus" class="select2 required" disabled="true">
			 	<form:options items="${fns:getDictList('file_borrow_status')}"
                        itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="remarks">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " readonly="true"/>
			</div>
		</div>
	</form:form>
	
    <legend >借用记录</legend>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
            <tr>
                <th>文件资料借阅单号</th>
                <th>申请人姓名</th>
                <th>申请借阅部门</th>
                <th>文件资料借阅状态</th>
                <th>预计申请开始日期</th>
                <th>预计申请截止日期</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${labFileBorrowList}" var="labFileBorrow">
            <tr>
                <td>
                    ${labFileBorrow.fileborrowid}
                </td>
                <td>
                    ${labFileBorrow.reqname}
                </td>
                <td>
                    ${labFileBorrow.reqdepartment}
                </td>
                <td>
                    ${fns:getDictLabel(labFileBorrow.fileborrowstatus, "file_borrow_status", "空闲")}
                </td>
                <td>
                    <fmt:formatDate value="${labFileBorrow.reqstartdate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <fmt:formatDate value="${labFileBorrow.reqenddate}" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
        <div class="form-actions">
            <input type="button" class="btn btn-primary" value="打印" onclick="viewPrint()"> 
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
        
</body>
</html>