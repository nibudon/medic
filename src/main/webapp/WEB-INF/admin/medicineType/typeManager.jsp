<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药材类别管理</title>
<link rel="shortcut icon" href="/image/title.jpg" type="image/x-icon" />

<link href="../../../../css/bootstrap.min.js" rel="stylesheet" type="text/css">
<link href="../../../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../../../js/libs/jquery-3.2.1.min.js"></script>

</head>
<body>
<div style="float: left; width: 70%;">
<div><center><strong>药品类别管理</strong></center></div>
<table class="table">
	<tr>
		<td>编号</td>
		<td>类别名称</td>
		<td>编辑</td>
		<td>删除</td>
	</tr>
	<c:if test="${not empty typeList }">
		<c:forEach items="${typeList }" var="type" varStatus="in">
			<tr>
				<td>${in.count }</td>
				<td>${type.typeName }</td>
				<td><a href="javascript:getTypeById('${type.id }')">编辑</a></td>
				<td><a href="javascript:deleteType('${type.id }')">删除</a></td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty typeList }">
		没有数据
	</c:if>
	<a href="javascript:add()">添加类别</a>
</table>
</div>
<div style="float: right; width: 30%;">
	<div id="editForm" style="display: none;">
		<center>修改类别</center>
		<form action="updateType.html" method="post">
			<input type="hidden" name="id" id="upId"><br />
			类别名称:<br />
			<input name="typeName" id="upName"><br />
			<input type="submit" value="修   改">
		</form>
	</div>
	<div id="addForm" style="display: none;">
		<center>添加类别</center>
		<form action="addType.html" method="post">
			类别名称:<br />
			<input name="typeName" id="addName"><br />
			<input type="submit" value="添  加">
		</form>
	</div>
</div>
<form name="hid" action="" method="post">
<input type="hidden" name="id">
</form>
</body>
<script type="text/javascript">
	function getTypeById(id){
		var param="id="+id;
		$.ajax({
			url : "getTypeById.html",
			type : "post",
			data : param,
			cache : false,
			dataType : "text",
			beforeSend : function(data) {
				//alert("before");
			},
			async : true,
			success : function(data) {
				var json=eval('('+data+')');
				$("#editForm").css('display','block');
				$("#addForm").css('display','none');
				$("#upId").val(json.id);
				$("#upName").val(json.typeName);
			},
			error : function() {
				alert("error");
			}
		});
	}
	function deleteType(id){
		if(confirm("确认删除此类别?")){
			if(confirm("删除此类别会导致此类别的所有药品也被删除,继续删除?")){
				document.hid.action="deleteType.html";
				document.hid.id.value=id;
				document.hid.submit();
			}
		}
	}
	function add(){
		$("#editForm").css('display','none');
		$("#addForm").css('display','block');
	}
</script>
</html>