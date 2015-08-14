<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文件资料借阅记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#approveForm").validate({
	        submitHandler: function(form){
	            confirmx("确认审批通过？",function(){
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
		
		$("#denyForm").validate({
	        submitHandler: function(form){
	            confirmx("确认审批拒绝？",function(){
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
		
		<%-- 借出复核、借出 --%>
		onSubmitx("lendForm",function(form){
           confirmx("确认借出操作？",function(){
               loading('正在提交，请稍等...');
               form.submit();
           });
        });

        <%-- 归还复核、归还 --%>
        onSubmitx("returnForm",function(form){
           if($("#returnForm #revertexecuter").val()=="${fns:getUser().getLoginName()}"){
                 alertx("归还复核人与归还经办人不能是同一人。");
                 return ;
             }
            confirmx("确认归还操作？",function(){
                loading('正在提交，请稍等...');
                form.submit();
            });
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
		<li class="active"><a href="${ctx}/files/labFileBorrow/">文件资料借阅列表</a></li>
		<shiro:hasPermission name="files:labFileBorrow:edit"><li><a href="${ctx}/files/labFileBorrow/form">申请借阅文件资料</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="labFileBorrow" action="${ctx}/files/labFileBorrow/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label for="fileborrowid">文件借阅单号：</label>
				<form:input path="fileborrowid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label for="reqname">申请人姓名：</label>
				<form:input path="reqname" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>文件资料借阅单号</th>
				<th>申请人姓名</th>
				<th>申请借阅部门</th>
				<th>文件资料借阅状态</th>
				<th>预计申请开始日期</th>
				<th>预计申请截止日期</th>
				<shiro:hasPermission name="files:labFileBorrow:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="labFileBorrow">
			<tr>
				<td><a href="${ctx}/files/labFileBorrow/view?id=${labFileBorrow.id}">
					${labFileBorrow.fileborrowid}
				</a></td>
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
				<td>
					<shiro:hasPermission name="files:labFileBorrow:edit">
    					<a href="${ctx}/files/labFileBorrow/form?id=${labFileBorrow.id}">修改</a>
						<a href="${ctx}/files/labFileBorrow/delete?id=${labFileBorrow.id}" onclick="return confirmx('确认要删除该文件资料借阅记录吗？', this.href)">删除</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="files:labFileBorrow:approve">
						<c:if test="${labFileBorrow.fileborrowstatus == '2'}">
		                    <a href="#" onclick="approve('${labFileBorrow.id}','${labFileBorrow.fileborrowstatus}')">通过</a>
		                    <a href="#" onclick="deny('${labFileBorrow.id}','${labFileBorrow.fileborrowstatus}')">拒绝</a>
	                    </c:if>
                    </shiro:hasPermission>
 					<%--<shiro:hasPermission name="files:labFileBorrow:lend">
						<c:if test="${labFileBorrow.fileborrowstatus == '3'}">
		                    <a href="#" onclick="lend('${labFileBorrow.id}','${labFileBorrow.fileborrowstatus}')">借出</a>
	                    </c:if>
                    </shiro:hasPermission>--%>      
					<shiro:hasPermission name="files:labFileBorrow:lend">
						<c:if test="${labFileBorrow.fileborrowstatus == '4'}">
		                    <a href="#" onclick="giveBack('${labFileBorrow.id}','${labFileBorrow.fileborrowstatus}')">归还</a>
	                    </c:if>
                    </shiro:hasPermission>
                    
                </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	
<%-- 弹出页，审批-通过 --%>
    <div id="approveModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="approveModalLabel" aria-hidden="true" >
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <%-- 弹出页，标题--%>
        <h4 id="approveModalLabel">审批通过</h4>
        </div>
        <%-- 弹出页，主体--%>
        <div class="modal-body">
            <br/>
            <form:form id="approveForm" modelAttribute="labFileBorrow" 
                 action="${ctx}/files/labFileBorrow/approve" method="post" class="form-horizontal">
                <%-- 隐藏域--%>
                <form:hidden path="approvename" value="${fns:getUser().getName()}"/>
                <form:hidden path="id" id="id1"/>
                <div class="control-group">
		            <label class="control-label" for="approveopinion" style="width:120px">审批意见：</label>
		            <div class="controls"   style="margin-left:10px;">
		                <form:textarea path="approveopinion" htmlEscape="false" 
		                maxlength="200" class="input-xlarge required" rows="4"/>
		            </div>
		        </div>
                <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="确 定"></button>
                <input type="button" class="btn" data-dismiss="modal" aria-hidden="true" value="取 消"></button>
                </div>
            </form:form>
        </div>
    </div>
    <%-- 弹出页，审批-通过 ，结束--%>
    
    <%-- 弹出页，审批-拒绝 --%>
    <div id="denyModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="denyModalLabel" aria-hidden="true" >
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <%-- 弹出页，标题--%>
        <h4 id="denyModalLabel">审批拒绝</h4>
        </div>
        <%-- 弹出页，主体--%>
        <div class="modal-body">
            <br/>
            <form:form id="denyForm" modelAttribute="labFileBorrow" 
                 action="${ctx}/files/labFileBorrow/deny" method="post" class="form-horizontal">
                <%-- 隐藏域--%>
                <form:hidden path="approvename" value="${fns:getUser().getName()}"/>
                <form:hidden path="id" id="id2"/>
                <div class="control-group">
                    <label class="control-label" for="approveopinion" style="width:120px">审批意见：</label>
                    <div class="controls"   style="margin-left:10px;">
                        <form:textarea path="approveopinion" htmlEscape="false" 
                        maxlength="200" class="input-xlarge required" rows="4"/>
                    </div>
                </div>
                <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="确 定"></button>
                <input type="button" class="btn" data-dismiss="modal" aria-hidden="true" value="取 消"></button>
                </div>
            </form:form>
        </div>
    </div>
    <%-- 弹出页，审批-拒绝 ，结束--%>
  
   
    <%-- 弹出页，借出 --%>
    <div id="lendModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="lendModalLabel" aria-hidden="true" >
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <%-- 弹出页，标题--%>
        <h4 id="lendModalLabel">借出</h4>
        </div>
        <%-- 弹出页，主体--%>
        <div class="modal-body">
            <br/>
            <form:form id="lendForm" modelAttribute="labFileBorrow" 
                 action="${ctx}/files/labFileBorrow/lend" method="post" class="form-horizontal">
                <%-- 隐藏域--%>
                <form:hidden path="id" id="id3"/>

                <div class="control-group">
                    <label class="control-label" for="borrowexecuter">借出经办人：</label>
                    <div class="controls">
                        <form:input path="borrowexecuter" htmlEscape="false" maxlength="20"
                            class="input required" readOnly="true" value="${fns:getUser().getName()}"/>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="borrowrecheckdate">操作日期：</label>
                    <div class="controls">
                        <form:input path="borrowrecheckdate" htmlEscape="false" maxlength="60" 
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
    <%-- 弹出页，借出--%>
        
    <%-- 弹出页，归还同机复核 --%>
    <div id="returnModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="returnModalLabel" aria-hidden="true" >
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <%-- 弹出页，标题--%>
        <h4 id="returnModalLabel">归还</h4>
        </div>
        <%-- 弹出页，主体--%>
        <div class="modal-body">
            <br/>
            <form:form id="returnForm" modelAttribute="labFileBorrow" 
                 action="${ctx}/files/labFileBorrow/giveBack" method="post" class="form-horizontal">
                <%-- 隐藏域--%>
                <form:hidden path="id" id="id4"/>
                
                <div class="control-group">
                    <label class="control-label" for="revertrecheck">归还复核人：</label>
                    <div class="controls">
                        <form:input path="revertrecheck"  htmlEscape="false" maxlength="20"
                            class="input required" />
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                
                 <div class="control-group">
                    <label class="control-label" for="t1">归还复核人密码：</label>
                    <div class="controls">
                        <form:password path="t1" htmlEscape="false" maxlength="20"
                            class="input required" />
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="revertexecuter">归还经办人：</label>
                    <div class="controls">
                        <form:input path="revertexecuter" htmlEscape="false" maxlength="20"
                            class="input required" readOnly="true" value="${fns:getUser().getName()}"/>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="revertrecheckdate">操作日期：</label>
                    <div class="controls">
                        <form:input path="revertrecheckdate" htmlEscape="false" maxlength="60" 
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
    <%-- 弹出页，归还复核--%>


    <script type="text/javascript">
        function approve(id,dqzt){
        	$("#id1").val(id);
        	$('#approveModal').modal();
        }
        
        function deny(id,dqzt){
            $("#id2").val(id);
        	$('#denyModal').modal();
        }
        <%-- 借出 --%>
        function lend(id,dqzt){
            $("#id3").val(id);
            $('#lendModal').modal();
        }
        <%-- 归还同机复核 --%>
        function giveBack(id,dqzt){
            $("#id4").val(id);
            $('#returnModal').modal();
        }
        
    </script>
     	
	
</body>
</html>