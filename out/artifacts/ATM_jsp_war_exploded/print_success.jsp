<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交易成功</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui/css/layui.css">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style>
        #main {
            background-size: cover;
            margin-top: 5px;
            background:url(static/images/timg.jpg);
            background-size: cover;
            border-radius: 10px;
            /*  border-radius: 15px;*/
            height: 750px;
            border: 1px solid grey;
            box-shadow: 5px 5px 5px gainsboro;
            overflow: hidden;
        }
        #main>div{
            text-align: center;
            color: white;
            margin-top: 180px;
        }
        footer {
            width: 95%;
            margin: 350px auto;
            left: 20px;
        }

        #m2 {
            float: right;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <div>
        <h1>交 易 成 功，是 否 打 印 凭 条</h1>
        <h3>Whether to print slip or not</h3>
    </div>
    <footer>
        <a href="business.jsp"> <img id="m2" width="29%" src="static/images/return.png"></a>
        <a href="receipt.jsp"><img id="continue" width="29%" src="static/images/print.png"></a>
<%--        <a href="receipt.jsp" onclick="alert('系统暂时无法打印凭条！')"><img id="continue" width="29%" src="static/images/print.png"></a>--%>

    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>