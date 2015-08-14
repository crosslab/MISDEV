<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="classes" type="java.lang.String" required="false" description="样式类"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="标题"%>
<script type="text/javascript">
	 $(document).ready(function() {
		 //event
	     $("#launch").click(function() {
		     
		     //绑定事件放在构造modal后
            $("#btnOK").unbind("click");
            $("#btnOK").on("click",function(){
                var rs = $('#table2').bootstrapTable('getSelections');
                if(rs && rs.length > 0){
                	  modalCallback(rs);
                      $('#myModal').modal('hide');
                }else{
                      alert("请选择一条数据。");
                }
             });
		     
		     //绑定拖动事件
		     $(".modal-header").unbind('mousedown');
		     $('.modal-header').bind('mousedown', {
		         target : $("#myModal")
		     }, onMouseDown).css('cursor', 'move');
	     
	         $('#table2').bootstrapTable("destroy");
	         $('#table2').bootstrapTable({
	             columns : [ {
	                 field : 'state',
	                 title : '选择',
	                 radio : "true",
	                 halign : "center"
	             }, {
	                 field : 'id',
	                 title : 'Item ID',
	                 width : "20%",
	                 halign : "center",
	                 align : "right"
	             }, {
	                 field : 'name',
	                 title : '名称',
	                 sortable : "true",
	                 width : "45%",
	                 halign : "center"
	             }, {
	                 field : 'code',
	                 title : '代码',
	                 sortable : "true",
	                 width : "35%",
	                 halign : "center"
	             }],
	             url : "${ctx}/sys/dict/sj",
	             toggle : "table",
	             idField : "id",
	             sidePagination : "server",
	             pagination : "true",
	             pageList : PAGELIST,
	             sortName : "id",
	             sortOrder : "asc",
	             clickToSelect : "true",
	             singleSelect : "true"
	         });
	         
             //弹出
             $('#myModal').modal('show');
	     });
	 });
</script>
        
 <!-- Button to trigger modal -->
 <a id="launch" role="button" class="btn" data-toggle="modal">Launch</a>

 <!-- Modal -->
<div id="${id}" class="modal hide draggable ${classes}" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-header"
		style="top: 1px; background-color: #F5F5F5; height: 20px; border-radius: 6px 6px 0px 0px;">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true" title="关闭">×</button>
		<h5 id="myModalLabel">${title}</h5>
	</div>
	<div class="modal-body">
	   <table id="table2" class="table-striped"></table>
	</div>
	<div class="modal-footer">
		<input class="btn" id="btnOK" type="button" value="选择"></input> 
        <input class="btn" data-dismiss="modal" type="button" aria-hidden="true"
			value="关闭" title="关闭"></input>
	</div>
</div>
