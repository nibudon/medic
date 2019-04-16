<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>药材详情</title>
<link rel="shortcut icon" href="/image/title.jpg" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/proDetail.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/medicineType/getAllTypes.html",
		type : "get",
		cache : false,
		dataType : "text",
		beforeSend : function(datas) {
			//alert("before");
		},
		async : true,
		success : function(datas) {
			//var json=eval('('+datas+')');
			var json=JSON.parse(datas);
			//alert(json);
			for (var i = 0; i < json.length; i++) {
				var data=json[i];
				var op="<li><a href='${pageContext.request.contextPath}/shop/puffingType?type="+data.id+"'>"+data.typeName+"</a>|</li>";
				$("#headNav").append(op);
			}
		},
		error : function() {
			alert("error");
		}
	});
});
</script>
<style type="text/css">  
        table  
        {  
            border-collapse: collapse;  
            text-align: left;  
        }  
        table td, table th  
        {  
            border: 1px solid #cad9ea;  
            color: #666;  
            height: 30px;  
            width: 300px; 
            text-align: left;
            border: 0px;
        }  
        table thead th  
        {  
            background-color: #CCE8EB;  
            width: 200px;  
        }  
        table tr:nth-child(odd)  
        {  
            background: #fff;  
        }  
        table tr:nth-child(even)  
        {  
            background: #F5FAFA;  
        }  
    </style> 
</head>
<body>
<div class="span11">
		<div class="cart">
			<a  href="${pageContext.request.contextPath}/sorder/gotocar">购物车</a>
		</div>
		<div class="phone">
			电话热线:
			<strong>153****3101</strong>
		</div>
		<div class="weixin">
				<img src="${pageContext.request.contextPath}/image/trimImg/wxBZ.png" alt="微信图标" class="weixin-icon"/>
				微信服务:
				<strong id="yc" style="cursor:pointer;">点击扫码加微信</strong>
			    <img id="ewm" style="display:none;" src="${pageContext.request.contextPath}/image/trimImg/myEWM.png" alt="微信图标" class="weixin-ewm"/>
		</div>
</div>
<div class="container header">
	<div class="span5">
		<div class="logo">
				<img id="logoPic" src="${pageContext.request.contextPath}/image/trimImg/snackBZ.jpg" style="display: block;" alt="食尚零食"/>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:if test="${sessionScope.frontuser==null}">
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="${pageContext.request.contextPath}/shop/userLoginGet">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${pageContext.request.contextPath}/user/userRegisterGet">注册</a>|
				</li>
				</c:if>	
				<c:if test="${sessionScope.frontuser!=null}">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
					    <input id="pd" value="${sessionScope.frontuser}" type="hidden"/>
						<a href="javascript:void()">欢迎:${sessionScope.frontuser}</a>|
					</li>
				</c:if>	
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a>[退出]</a>|
				</li>
				       <c:if test="${sessionScope.frontuser!=null}">
						<li class="personalInfo">
							<a href="${pageContext.request.contextPath}/user/userPersonalInfo">会员中心</a>
							|
						</li>
						</c:if>
						<c:if test="${sessionScope.frontuser==null}">
						<li class="personalInfo">
							<a href="${pageContext.request.contextPath}/shop/userLoginGet">会员中心</a>
							|
						</li>
						</c:if>
			</ul>
		</div>

	</div>
	<div class="span24">
		<ul class="mainNav" id="headNav">
			<li>
				<a href="${pageContext.request.contextPath}/shop/index">首页</a>
				|
			</li>
		</ul>
	</div>
</div>	


<div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
						<img alt="无" src="${pageContext.request.contextPath}/image/persionLeft.jpg" width="100%" height="500px">
			</div>
			

		</div>
		<div class="span18 last">
			<div class="productImage">
				<img style="opacity: 1;" title="" class="medium" src="${pageContext.request.contextPath}/image/${sck.sPictureurl}">
			</div>
			<div class="name">${sck.sName}</div>
			<div class="sn">
				<div>编号:${sck.sBatch}</div>
			</div>
			<div class="info">
					<dl>
						<dd>
							现价:<strong>￥:${sck.sPrice*sck.sDiscount/10}元/份</strong>
							原 价:<del>￥${sck.sPrice}元/份</del>
						</dd>
						<dd>品牌:${sck.sBrand}</dd>
						<dd>产地:${sck.sPlace}</dd>
					</dl>
			</div>
				<div class="action">
					<form action="${pageContext.request.contextPath}/sorder/add" method="post">
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input type="hidden" name="sId" value="${sck.sId}"/>
								<input id="sNumber" name="sNumber" value="1" maxlength="4" onpaste="return false;" type="text"/>
								<div>
									<span id="increase" class="increase">&nbsp;</span>
									<span id="decrease" class="decrease">&nbsp;</span>
								</div>
							</dd>
							<dd>件</dd>
						</dl>
						<div class="buy">
								<input id="addCart" class="addCart" value="加入购物车" type="submit">
					
						</div>
					</form>
				</div>
				<div id="introduction" class="introduction">
					<div class="title">
						<strong>药品详情</strong>
					</div>
					123
					<div>
					  <table>
					        <tr>
					        	<td>规格参数:</td>
					        </tr>
					  		<tr>
					  			<td>品牌:${sck.sBrand}</td>
					  			<td>产地:${sck.sPlace}</td>
					  			<td>名称:${sck.sName}</td>
					  		</tr>
					  		<tr>
					  			<td>生产日期:${sck.sPdate}</td>
					  			<td>保质期:${sck.sQdate}个月</td>
					  			<td>上架日期:${sck.sCreatedate}</td>
					  		</tr>
					  		<tr>
					  			<td>详情:${sck.sDese}</td>
					  		</tr>
					  </table>
					</div>
				</div>
				
				
		</div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/proDetail.js"></script>
</body>
</html>