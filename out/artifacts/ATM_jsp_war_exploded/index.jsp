<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎使用ATM机</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="static/lib/layui/css/layui.css" rel="stylesheet">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/welcome.css" rel="stylesheet" >
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <section>
        <div id="main_left">
            <ul>
                <li><img src="static/images/shoujiqukuan.png"></li>
                <li><img src="static/images/wukajiaoyi.png"></li>
                <li><img src="static/images/qitayiwu.png"></li>
            </ul>
        </div>
        <div id="main_right">
            <div id="right_top">
                <img src="static/images/kacao.png">
            </div>
            <div id="right_main">
                <div id="right_1">
                    <p style="font-size: 50px;color: white;margin-left: 20px;">请插入
                        <br/>您的卡片</p>
                    <span style="font-size: 30px;color: white;margin-left: 20px">Insert your card</span>
                </div>
                <div id="right_2">
                    <a href="inputAccount.jsp">
                        <img id="oimg" src="static/images/card.png">
                    </a>
                </div>
            </div>
            <div id="right_footer">
                <img width="14%" src="static/images/01.jpg">
                <img width="14%" src="static/images/未标题-2_03.png">
                <img width="14%" src="static/images/未标题-2_05.png">
                <img width="14%" src="static/images/未标题-2_07.png">
            </div>
        </div>
    </section>
    <footer>
        <span class="glyphicon glyphicon-time" style="font-size: 40px;color: white;" aria-hidden="true"><span
                style="margin-left:10px;font-size: 20px;color: white" id="cg"> </span></span>
    </footer>
</div>

<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script>
    window.onload=function() {
        setInterval("cg.innerHTML=new Date().toLocaleString()", 10);
    }
</script>
</body>
</html>