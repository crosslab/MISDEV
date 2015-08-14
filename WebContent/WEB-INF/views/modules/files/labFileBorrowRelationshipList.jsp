<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料与借阅单号关联管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/files/labFileBorrowRelationship/">文件资料与借阅单号关联列表</a></li>
		<shiro:hasPermission name="files:labFileBorrowRelationship:edit"><li><a href="${ctx}/files/labFileBorrowRelationship/form">添加文件资料与借阅单号关联</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="labFileBorrowRelationship" action="${ctx}/files/labFileBorrowRelationship/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label for="fileid">文件资料编号：</label>
				<form:input path="fileid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label for="borrowid">文件资料借阅编号：</label>
				<form:input path="borrowid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>文件资料编号</th>
				<th>文件资料借阅编号</th>
				<shiro:hasPermission name="files:labFileBorrowRelationship:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="labFileBorrowRelationship">
			<tr>
				<td><a href="${ctx}/files/labFileBorrowRelationship/form?id=${labFileBorrowRelationship.id}">
					${labFileBorrowRelationship.fileid}
				</a></td>
				<td>
					${labFileBorrowRelationship.borrowid}
				</td>
				<shiro:hasPermission name="files:labFileBorrowRelationship:edit"><td>
    				<a href="${ctx}/files/labFileBorrowRelationship/form?id=${labFileBorrowRelationship.id}">修改</a>
					<a href="${ctx}/files/labFileBorrowRelationship/delete?id=${labFileBorrowRelationship.id}" onclick="return confirmx('确认要删除该文件资料与借阅单号关联吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>