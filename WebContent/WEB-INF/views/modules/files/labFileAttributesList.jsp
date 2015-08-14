<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			<%-- 预订申请 --%>
			$("#revserveForm").validate({
                submitHandler: function(form){
                    confirmx("确认预订申请该文件资料？",function(){
                        loading('正在提交，请稍等...');
			            form.submit();
			        });
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
		<li class="active"><a href="${ctx}/files/labFileAttributes/">文件资料列表</a></li>
		<shiro:hasPermission name="files:labFileAttributes:edit"><li><a href="${ctx}/files/labFileAttributes/form">添加文件资料</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="labFileAttributes" action="${ctx}/files/labFileAttributes/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label for="fileid">文件资料编号：</label>
				<form:input path="fileid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label for="filename">文件资料名称：</label>
				<form:input path="filename" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<br><br>
			
			<li><label for="filecontrolid">文件控制编号：</label>
				<form:input path="filecontrolid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label for="filestandard">图书标准名称：</label>
				<form:input path="filestandard" htmlEscape="false" maxlength="128" class="input-medium"/>
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
				<th>文件资料名称</th>
				<th>文件资料控制编号</th>
				<th>文件资料类别</th>
				<th>图书标准名称</th>
				<th>当前状态</th>
				<shiro:hasPermission name="files:labFileAttributes:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="labFileAttributes">
			<tr>
				<td><a href="${ctx}/files/labFileAttributes/view?id=${labFileAttributes.id}">
					${labFileAttributes.fileid}
				</a></td>
				<td>
					${labFileAttributes.filename}
				</td>
				<td>
					${labFileAttributes.filecontrolid}
				</td>
				<td>
					${fns:getDictLabel(labFileAttributes.filetype, "file_standard_type", "图书标准")}
				</td>
				<td>
					${labFileAttributes.filestandard}
				</td>			
				<td>
					${fns:getDictLabel(labFileAttributes.filestatus, "file_borrow_status", "空闲")}
				</td>
				<td>
					<shiro:hasPermission name="files:labFileAttributes:edit">
	    				<a href="${ctx}/files/labFileAttributes/form?id=${labFileAttributes.id}">修改</a>
						<a href="${ctx}/files/labFileAttributes/delete?id=${labFileAttributes.id}" onclick="return confirmx('确认要删除该文件资料管理吗？', this.href)">删除</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="files:labFileAttributes:lend">
                    	<a href="#" onClick="reserve('${labFileAttributes.id}','${labFileAttributes.filename}','${labFileAttributes.filestatus}')">借出</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	
	
	<%-- 弹出页，预订借阅文件资料 --%>
    <div id="myModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<%-- 弹出页，标题--%>
		<h4 id="myModalLabel">申请借阅文件资料</h4>
		</div>
		<%-- 弹出页，主体--%>
		<div class="modal-body">
		    <br/>
			<form:form id="revserveForm" modelAttribute="labFileAttributes" 
			     action="${ctx}/files/labFileBorrow/revserveOK" method="post" class="form-horizontal">
		        <%-- 隐藏域--%>
		        <form:hidden path="id" id="paramId"/>
		        <form:hidden path="filename" id="paramName"/>
		        
		        <sys:message content="${message}"/>
		        <%-- js下拉窗组件，显示文件资料申请单号--%>
		        <div class="control-group">
		            <label class="control-label" for="t2">文件资料申请单号：</label>
		            <div class="controls">
                        <input id="t2" name="t2" class="required"/>
		                <span class="help-inline"><font color="red">*</font> </span>
		            </div>
		        </div>

		        <div class="control-group">
		            <label class="control-label" for="t1">经办人：</label>
		            <div class="controls">
		                <form:input path="t1" htmlEscape="false" maxlength="20"
		                    class="input required" readOnly="true" value="${fns:getUser().getName()}"/>
		            </div>
		        </div>
		        
		        <div class="control-group">
		            <label class="control-label" for="t2">操作日期：</label>
		            <div class="controls">
		                <input type="text" htmlEscape="false" maxlength="60" 
		                    class="input " readOnly="true" value="${fns:getDate('yyyy-MM-dd')}"/>
		            </div>
		        </div>
		        
		        <div class="modal-footer">
		        <input type="submit" class="btn btn-primary" value="确 定"></button>
		        <input type="button" class="btn" data-dismiss="modal" aria-hidden="true" value="取 消"></button>
		        </div>
		    </form:form>
		</div>
    </div>
	<%-- 弹出页，申请借阅文件资料 ，结束--%>
		
  <script type="text/javascript">
    <%--申请操作：1.ajax获取预定号列表;2.显示对话框;3.提交操作--%>
   	function reserve(id,fname,fstatus){
   		if(fstatus && fstatus != 1) {
   			alertx("只可以预定空闲状态的文件资料。");
   			return;
   		}
   		
    	<%--1.查询预定申请号列表参数--%>
        var para={"id":id};  
    	<%--2.查询文件资料申请号--%>
        $.ajax({ 
            type:"POST", 
            url:"${ctx}/files/labFileBorrow/request", 
            dataType:"json",      
            contentType:"application/json;charset=UTF-8",               
            data:JSON.stringify(para), 
            cache:false,
            complete:function(XHR, TS){},
            success:function(data){
            	<%--3.查询成功后--%>
            	<%--3.1.构造select2下拉窗选项，key:id，value:text--%>
            	var dataAry=[]; 
            	for(var i =0;i<data.length;i++) {
            		dataAry.push({"id":data[i].fileborrowid,"text":data[i].fileborrowid});
            	};
            	<%--3.2设置隐藏域的值：文件id和文件名称--%>
            	$("#paramId").val(id);
            	$("#paramName").val(fname);
            	<%--3.3初始化下拉框，常用的<form:select>标签不同，select2下拉框需要前台初始化，form:select tag由后台生成--%>
            	$("#t2").select2({
				    data:dataAry,
				    placeholder: "选择申请单号",
				    width:'220px'
				});
            } ,
            error:function(xhr,t,e){
            	alertx(e);
            }
         });
        $('#myModal').modal();
	};
	
	</script>
	
	
</body>
</html>