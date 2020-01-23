<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        }
        #main>div{
            text-align: center;
            color: white;
            margin-top: 180px;
        }
    </style>
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <div>
        <h1>正在出钞，请稍等....</h1>
        <h3>Reading card data,please wait....</h3>
    </div>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script>
    //2秒后自动跳转到交易成功页面
    setTimeout(function () {
        window.location.href="print_success.jsp";
    },2000);
</script>
</body>
</html>
