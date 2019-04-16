<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"/>
	<title>测试H5</title>
	
</head>

<body>
<h1 id="content">好不<img src="http://10.16.81.11:18080/icc/images/common/emoticons/11.gif"></h1>

 <button id="button">点击复制</button>

<div contenteditable="true" style="background-color: rgb(232,242,254);"><img src="http://10.16.81.11:18080/icc/images/common/emoticons/11.gif"><img src="http://10.16.81.11:18080/icc/images/common/emoticons/11.gif"></div>

 <script>

     window.addEventListener('copy', function(clipBoardEvent) {

         var text = window.getSelection().toString();
		 alert(text);
         console.log(clipBoardEvent);

         clipBoardEvent.clipboardData.setData('text/plain', text + ' myinfo'); // 写入文本

         clipBoardEvent.preventDefault();

     });

    (function(){

        button.addEventListener('click', function(){

            var copyDom = document.querySelector('#content');

            //创建选中范围

            var range = document.createRange();

            range.selectNode(copyDom);

            //移除剪切板中内容

            window.getSelection().removeAllRanges();

            //添加新的内容到剪切板

            window.getSelection().addRange(range);

            //复制

            var successful = document.execCommand('copy');

 

            try{

                var msg = successful ? "successful" : "failed";

                setTimeout(function(){
                	alert('Copy command was : ' + msg);
                },100);

            } catch(err){

                alert('Oops , unable to copy!');

            }

        })

    })()

</script>
</body>
</html>