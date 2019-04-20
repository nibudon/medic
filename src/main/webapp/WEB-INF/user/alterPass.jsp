<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18 0018
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../../../css/bootstrap.min.js" rel="stylesheet" type="text/css">
<link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../../js/libs/jquery-3.2.1.min.js"></script>
<style type="text/css">#iCenter1{width:400px; height: 180px;border:1px #000 solid; padding-left: 0px;}</style>
<style type="text/css">#iCenter2{width:400px; height: 180px;border:1px #000 solid; padding-left: 0px;}</style>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.11&key=61c2032468d7e53926f3885b04e8183b"></script>
<head>
    <title>修改密码</title>
    <link rel="shortcut icon" href="/image/title.jpg" type="image/x-icon" />
    <style>
        .a{
            text-decoration: none;
        }
        .myStyle{
            font-size: 10px;
        }
        .myTdLeft{
            text-align: right;
        }
        .myTdRight{
            margin: left;
        }
    </style>
</head>

<body>
<table class="table myStyle">
    <input type="hidden" id="uId" value="${frontuserId}" />
    <tr>
        <td class="myTdLeft">原密码：</td>
        <td class="myTdRight"><input type="password" id="oldPass">&nbsp;&nbsp;<span id="oldmsg"></span></td>
    </tr>
    <tr>
        <td class="myTdLeft">新密码：</td>
        <td class="myTdRight"><input type="password" id="newPass">&nbsp;&nbsp;<span id="newmsg"></span></td>
    </tr>
    <tr>
        <td class="myTdLeft">重复密码：</td>
        <td class="myTdRight"><input type="password" id="confPass">&nbsp;&nbsp;<span id="confmsg"></span></td>
    </tr>
    <tr>
        <td></td>
        <td><button id="alterBTN">修改</button></td>
        <td><span id="msg"></span></td>
    </tr>
</table>
<script>

    var oldPassIsCorrect = false;

    $("#oldPass").bind("blur",function(){
        var uid = $("#uId").val();
        var oPass = $("#oldPass").val();
        var param = "uid="+uid+"&oPass="+oPass;
        $.ajax({
            url : "${pageContext.request.contextPath }/user/getUserById.html",
            type : "get",
            cache : false,
            data : param,
            dataType : "text",
            beforeSend : function(datas) {
                //alert("before");
            },
            async : true,
            success : function(datas) {
                //var json=eval('('+datas+')');
                var json=JSON.parse(datas);
                //alert(json);
                oldPassIsCorrect = json.correct;
                $("#oldmsg").text(json.message);
            },
            error : function() {
                alert("error");
            }
        });
    });

    $("#confPass").bind("blur",function(){
        var oldPass = $("#oldPass").val();
        var newPass = $("#newPass").val();
        var confPass = $("#confPass").val();
        if(confPass != newPass){
            $("#confmsg").text("两次密码不一致!");
        }else if(confPass == oldPass){
                $("#confmsg").text("新密码与原密码一致!");
        }else{
            $("#confmsg").text("两次密码一致!");
        }
    });

    $("#alterBTN").bind("click",function(){
        if(oldPassIsCorrect){
            $("#oldmsg").text("原密码正确!");
        }else{
            $("#oldmsg").text("原密码错误!");
            return;
        }
        var oldPass = $("#oldPass").val();
        var newPass = $("#newPass").val();
        var confPass = $("#confPass").val();
        if(confPass != newPass){
            $("#confmsg").text("两次密码不一致!");
            return;
        }else if(confPass == oldPass){
            $("#confmsg").text("新密码与原密码一致!");
            return;
        }else{
            $("#confmsg").text("两次密码一致!");
        }
        var uid = $("#uId").val();
        var param = "uid="+uid+"&newPass="+newPass;
        $.ajax({
            url : "${pageContext.request.contextPath }/user/updatePass.html",
            type : "get",
            cache : false,
            data : param,
            dataType : "text",
            beforeSend : function(datas) {
                //alert("before");
            },
            async : true,
            success : function(datas) {
                //var json=eval('('+datas+')');
                var json=JSON.parse(datas);
                //alert(json);
                $("#msg").text(json.message);
                if(json.success){
                    $("#oldmsg").text("");
                    $("#newmsg").text("");
                    $("#confmsg").text("");
                    $("#oldPass").val("");
                    $("#newPass").val("");
                    $("#confPass").val("");
                }
            },
            error : function() {
                alert("error");
            }
        });
    });

</script>
</body>
</html>
