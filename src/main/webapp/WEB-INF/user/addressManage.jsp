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
    <title>地址管理</title>
    <link rel="shortcut icon" href="/image/title.jpg" type="image/x-icon" />
    <style>
        .a{
            text-decoration: none;
        }
        .myStyle{
            font-size: 10px;
        }
    </style>
</head>
<script>

    function getAddress(type){
        if(type=="add"){
            s="iCenter1";
        }else{
            s="iCenter2";
        }
        var mapObj = new AMap.Map(s);
        mapObj.plugin('AMap.Geolocation', function () {
            geolocation = new AMap.Geolocation({
                enableHighAccuracy: true, // 是否使用高精度定位，默认:true
                timeout: 10000,           // 超过10秒后停止定位，默认：无穷大
                maximumAge: 0,            // 定位结果缓存0毫秒，默认：0
                convert: true,            // 自动偏移坐标，偏移后的坐标为高德坐标，默认：true
                showButton: true,         // 显示定位按钮，默认：true
                buttonPosition: 'LB',     // 定位按钮停靠位置，默认：'LB'，左下角
                buttonOffset: new AMap.Pixel(10, 20), // 定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
                showMarker: true,         // 定位成功后在定位到的位置显示点标记，默认：true
                showCircle: true,         // 定位成功后用圆圈表示定位精度范围，默认：true
                panToLocation: true,      // 定位成功后将定位到的位置作为地图中心点，默认：true
                zoomToAccuracy:true       // 定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            });
            mapObj.addControl(geolocation);
            geolocation.getCurrentPosition();
            AMap.event.addListener(geolocation, 'complete', onComplete); // 返回定位信息
            AMap.event.addListener(geolocation, 'error', onError);       // 返回定位出错信息
        });

        function onComplete(obj){
            var res = '经纬度：' + obj.position +
                '\n精度范围：' + obj.accuracy +
                '米\n定位结果的来源：' + obj.location_type +
                '\n状态信息：' + obj.info +
                '\n地址：' + obj.formattedAddress +
                '\n地址信息：' + JSON.stringify(obj.addressComponent, null, 4);
            //alert(res);
            if(type=="add"){
                $("#aAddress").val(obj.formattedAddress);
                $("#aAddress").focus();
            }else{
                $("#uAddress").val(obj.formattedAddress);
                $("#uAddress").focus();
            }

        }

        function onError(obj) {
            alert(obj.info + '--' + obj.message);
            console.log(obj);
        }
    }

    function toPage(uId,page){
        location.href="/address/addressManage.html?page="+page+"&uId="+uId;
    }

    function deleteAddress(id) {
        if(confirm("确认删除此地址?")){
            var tNum=$("#tNum").val();
            var cp=$("#cPage").val();
            var pSize=$("#pSize").val();
            var tPage=$("#tPage").val();
            var param="id="+id;
            $.ajax({
                url : "/address/deleteAddress.html",
                type : "post",
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
                    alert(json.message);
                    if(tPage==cp&&(tNum-1)%pSize==0&&tPage>1){
                        cp=cp-1;
                    }else{
                        cp=cp;
                    }
                    location.href="/address/addressManage.html?page="+cp+"&uId=${frontuserId }";
                },
                error : function() {
                    alert("error");
                }
            });
        }
    }

    function getAddressById(aId){
        var param="id="+aId;
        $.ajax({
            url : "/address/getAddressById.html",
            type : "post",
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
                $("#addressDiv").css("display","none");
                $("#uReceivePerson").val(json.receivePerson);
                $("#uTelephone").val(json.telephone);
                $("#uAddress").val(json.address);
                $("#updateId").val(json.id);
                $("#updateUserId").val(json.uId);
                $("#uIsDefault"+json.isDefault)[0].checked=true;
                $("#UpdateDiv").css("display","block");
            },
            error : function() {
                alert("error");
            }
        });
    }

    $(document).ready(function(){
        $("#addAddress").bind("click",function(){
            $("#addressDiv").css("display","block");
            $("#UpdateDiv").css("display","none");
        });

        $("#add").bind("click",function(){
            var cp=$("#cPage").val();
            var receivePerson=document.addForm.receivePerson.value;
            var telephone=document.addForm.telephone.value;
            var address=document.addForm.address.value;
            var isDefault=document.addForm.isDefault.value;
            var uId=document.updateForm.uId.value;
            var f=true;
            if(receivePerson==""){
                alert("请填写收货人姓名!");
                f=false;
                return;
            }
            if(telephone==""){
                alert("请填写收货人电话号码!");
                f=false;
                return;
            }
            if(address==""){
                alert("请填写收货人地址!");
                f=false;
                return;
            }
            var param="receivePerson="+receivePerson+"&telephone="+telephone+"&address="+address+"&isDefault="+isDefault+"&page="+cp;
            if(f){
                $.ajax({
                    url : "/address/addAddress.html",
                    type : "post",
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
                        alert(json.message);
                        $("#addressDiv").css("display","none");
                        //toPage(cp,uId);
                    },
                    error : function() {
                        alert("error");
                    }
                });
            }
        });
        $("#update").bind("click",function(){
            var cp=$("#cPage").val();
            var receivePerson=document.updateForm.receivePerson.value;
            var telephone=document.updateForm.telephone.value;
            var address=document.updateForm.address.value;
            var isDefault=document.updateForm.isDefault.value;
            var uId=document.updateForm.uId.value;
            var id=document.updateForm.id.value;
            var f=true;
            if(receivePerson==""){
                alert("请填写收货人姓名!");
                f=false;
                return;
            }
            if(telephone==""){
                alert("请填写收货人电话号码!");
                f=false;
                return;
            }
            if(address==""){
                alert("请填写收货人地址!");
                f=false;
                return;
            }
            var param="receivePerson="+receivePerson+"&telephone="+telephone+"&address="+address+"&isDefault="+isDefault+"&uId="+uId+"&id="+id+"&page="+cp;
            if(f){
                $.ajax({
                    url : "/address/updateAddress.html",
                    type : "post",
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
                        alert(json.message);
                        $("#addressDiv").css("display","none");
                        $("#UpdateDiv").css("display","none");
                        //toPage(cp,uId);
                    },
                    error : function() {
                        alert("error");
                    }
                });
            }
        });
    });

    function toThisPage(uId){
        var cp=$("#thisPage").val();
        var hcp=$("#cPage").val();
        var tp=$("#tPage").val();
        if(cp<1 || cp>tp || cp==hcp){
            if(cp==hcp){
                retutn;
            }else{
                alert("请输入正确的页码!");
            }
        }else{
            location.href="/address/addressManage.html?page="+cp+"&uId="+uId;
        }
    }

    /*$(document).ready(function(){
        //弹出一个页面层
        $('#addBtn').on('click', function(){
            layer.open({
                type: 1,
                area: ['800px', '600px'],
                shadeClose: true, //点击遮罩关闭
                content: '<form class="am-form">\n' +
                '            <br>\n' +
                '            <label for="username">收货人:</label>\n' +
                '            <input type="text" name="name" id="name"/>\n' +
                '            <br>\n' +
                '            <label for="username">电话:</label>\n' +
                '            <input type="text" name="username" id="username"/>\n' +
                '            <br>\n' +
                '            <label for="password">收货地址:</label>\n' +
                '            <input type="password" name="password" id="password"/>\n' +
                '            <br>\n' +
                '            <div class="am-cf">\n' +
                '                <input type="submit"  id="submit" value="添加"  class="am-btn am-btn-primary am-btn-sm am-fl">\n' +
                '            </div>\n' +
                '        </form>'
            });
        });
    });*/

</script>
<body>
<div style="height: 800px;overflow: scroll;">
    <table class="table myStyle">
        <c:if test="${not empty addressList }">
            <tr>
                <td>编号</td>
                <td>收货人</td>
                <td>电话</td>
                <td>收货地址</td>
                <td>是否默认</td>
                <td>编辑</td>
                <td>删除</td>
            </tr>

            <c:forEach items="${addressList }" var="address" varStatus="in">
                <tr>
                    <td>${(currentPage-1)*pageSize+in.count }</td>
                    <td>${address.receivePerson }</td>
                    <td>${address.telephone }</td>
                    <td>${address.address }</td>
                    <td><c:if test="${address.isDefault eq '1' }">是</c:if><c:if test="${address.isDefault eq '0' }">否</c:if></td>
                    <td><a href="javascript:getAddressById('${address.id }')">编辑</a></td>
                    <td><a href="javascript:deleteAddress('${address.id }')">删除</a></td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty addressList }">
            没有数据
        </c:if>
        <button id="addAddress">添加收货地址</button>
    </table>
    <div id="pageList">
        <input type="hidden" id="cPage" value="${currentPage }">
        <input type="hidden" id="tNum" value="${count }">
        <input type="hidden" id="tPage" value="${totalPage }">
        <input type="hidden" id="pSize" value="${pageSize }">
        <c:if test="${currentPage != 1}"><a href="javascript:toPage('${frontuserId }','1');">首页</a></c:if><c:if test="${currentPage == 1}">首页</c:if>
        <c:if test="${currentPage != 1 }"><a href="javascript:toPage('${frontuserId }','${currentPage-1 }');">上一页</a></c:if><c:if test="${currentPage == 1 }">上一页</c:if>
        <c:if test="${currentPage != totalPage }"><a href="javascript:toPage('${frontuserId }','${currentPage+1 }');">下一页</a></c:if><c:if test="${currentPage == totalPage }">下一页</c:if>
        <c:if test="${currentPage != totalPage}"><a href="javascript:toPage('${frontuserId }','${totalPage }');">末页</a></c:if><c:if test="${currentPage == totalPage}">末页</c:if>
        &nbsp;&nbsp;<input id="thisPage" style="width: 20px;" value="${currentPage }"><a href="javascript:toThisPage('${frontuserId }');">GO</a>&nbsp;&nbsp;当前第${currentPage }页,共${totalPage }页,共${count}条数据,每页显示${pageSize}条数据.
    </div>
    <div id="addressDiv" style="display: none; height: 300px;">
        <hr />
        <form name="addForm">
            收&nbsp;&nbsp;货&nbsp;&nbsp;人:<input name="receivePerson"><br />
            电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:<input name="telephone"><br />
            收货地址:<input id="aAddress" name="address" style="width: 400px;">&nbsp;<a href="javascript:getAddress('add')">获取当前位置信息</a><br />
            <div id="iCenter1"></div>
            是否默认:<input type="radio" checked name="isDefault" value="1">是<input type="radio" name="isDefault" value="0">否<br />
            <button id="add">添 加</button>
        </form>
    </div>
    <div id="UpdateDiv" style="display: none;  height: 300px;">
        <hr />
        <form name="updateForm">
            <input type="hidden" name="id" id="updateId">
            <input type="hidden" name="uId" id="updateUserId">
            收&nbsp;&nbsp;货&nbsp;&nbsp;人:<input id="uReceivePerson" name="receivePerson"><br />
            电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:<input id="uTelephone" name="telephone"><br />
            收货地址:<input id="uAddress" name="address" style="width: 400px;">&nbsp;<a href="javascript:getAddress('update')">获取当前位置信息</a><br />
            <div id="iCenter2"></div>
            是否默认:<input type="radio" checked id="uIsDefault1" name="isDefault" value="1">是<input type="radio" id="uIsDefault0" name="isDefault" value="0">否<br />
            <button id="update">修 改</button>
        </form>
    </div>
</div>
</body>
</html>
