<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/2 0002
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/js/libs/jquery-3.2.1.min.js"></script>
<script src="/js/libs/md5.js"></script>
<script>

    $(document).ready(function(){
        $("#oldPass").bind("blur",function(){
            var inputOldPass=$("#oldPass").val();
            var eInputOldPass=$.md5(inputOldPass);
            var myPass=$("#adminPass").val();
            if(inputOldPass!=""){
                if(myPass==eInputOldPass){
                    $("#oldPassMessage").text("原密码正确!");
                    $("#oldPassMessage").css("color","green");
                }else{
                    $("#oldPassMessage").text("原密码错误!");
                    $("#oldPassMessage").css("color","red");
                }
            }else{
                $("#oldPassMessage").text("");
            }
        });

        $("#cOldPass").bind("blur",function(){
            var inputOldPass=$("#oldPass").val();
            var cOldPass=$("#cOldPass").val();
            if(cOldPass!=""){
                if(cOldPass==inputOldPass && cOldPass!=""){
                    $("#cOldPassMessage").text("两次密码一致!");
                    $("#cOldPassMessage").css("color","green");
                }else{
                    $("#cOldPassMessage").text("两次密码不一致!");
                    $("#cOldPassMessage").css("color","red");
                }
            }else{
                $("#cOldPassMessage").text("");
            }
        });

        $("#newPass").bind("blur",function(){
            var newPass=$("#newPass").val();
            var myPass=$("#adminPass").val();
            var enewPass=$.md5(newPass);
            if(enewPass==myPass){
                $("#newPassMessage").text("新密码与原密码一致,请重新输入新密码!");
                $("#newPassMessage").css("color","red");
            }else if(enewPass!="" && newPass!=""){
                $("#newPassMessage").text("新密码可用!");
                $("#newPassMessage").css("color","green");
            }
        });

        $("#alterPass").bind("click",function(){
            var flag=true;
            var id=$("#adminId").val();
            var inputOldPass=$("#oldPass").val();
            var cOldPass=$("#cOldPass").val();
            var eInputOldPass=$.md5(inputOldPass);
            var cInputOldPass=$.md5(cOldPass);
            var myPass=$("#adminPass").val();
            var newPass=$("#newPass").val();
            var enewPass=$.md5(newPass);
            if(myPass!=eInputOldPass){
                $("#oldPassMessage").text("原密码错误!");
                $("#oldPassMessage").css("color","red");
                flag=false;
                return;
            }
            if(cOldPass!=inputOldPass){
                $("#cOldPassMessage").text("两次密码不一致!");
                $("#cOldPassMessage").css("color","red");
                flag=false;
                return;
            }
            if(newPass==inputOldPass){
                $("#newPassMessage").text("新密码与原密码一致,请重新输入新密码!");
                $("#newPassMessage").css("color","red");
                flag=false;
                return;
            }
            if(flag){
                var param="id="+id+"&oldPass="+eInputOldPass+"&cOldPass="+cInputOldPass+"&newPass="+enewPass;
                $.ajax({
                    url : "${pageContext.request.contextPath }/admin/login/alertPass.html",
                    type : "post",
                    data : param,
                    cache : false,
                    dataType : "text",
                    beforeSend : function(datas) {
                        //alert("before");
                    },
                    async : true,
                    success : function(datas) {
                        //var json=eval('('+datas+')');
                        var json=JSON.parse(datas);
                        $("#globeMessage").text(json.message);
                    },
                    error : function() {
                        // alert("error");
                    }
                });
            }
        });
    });

    function check(){
        var flag=true;
        var inputOldPass=$("#oldPass").val();
        var eInputOldPass=$.md5(inputOldPass);
        var myPass=$("#adminPass").val();
        var cOldPass=$("#cOldPass").val();
        var newPass=$("#newPass").val();
        if(myPass==eInputOldPass){
            $("#oldPassMessage").text("原密码错误!");
            $("#oldPassMessage").css("color","red");
            flag=false;
            return;
        }
        if(cOldPass!=inputOldPass){
            $("#cOldPassMessage").text("两次密码不一致!");
            $("#cOldPassMessage").css("color","red");
            flag=false;
            return;
        }
        if(newPass==inputOldPass){
            $("#newPassMessage").text("新密码与原密码一致,请重新输入新密码!");
            $("#newPassMessage").css("color","red");
            flag=false;
            return;
        }
        return flag;
    }
</script>
<body>
<div style="font-size: 20px; text-align: center;">修改密码</div>
<form method="post">
    <input type="hidden" id="adminId" value="${adminId}">
    <input type="hidden" id="adminPass" value="${adminPass}">
原&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" id="oldPass" name="oldPass">&nbsp;<div id="oldPassMessage" style="display: inline; color: red;font-size: 12px;"></div><br />
重复原密码:<input type="password" name="cOldPass" id="cOldPass">&nbsp;<div id="cOldPassMessage" style="display: inline; color: red;font-size: 12px;"></div><br />
新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" id="newPass" name="newPass">&nbsp;<div id="newPassMessage" style="display: inline; color: red;font-size: 12px;"></div><br />
<div id="globeMessage" style="display: inline; font-size: 12px;"></div><br />
<input type="button" id="alterPass" value="修改密码"><br />
</form>
</body>
</html>
