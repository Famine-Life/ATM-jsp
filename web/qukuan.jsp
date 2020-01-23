<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>取款</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui/css/layui.css">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style>
        #main {
            background-size: cover;
            margin-top: 5px;
            background: url(static/images/timg.jpg);
            background-size: cover;
            border-radius: 10px;
            /*  border-radius: 15px;*/
            height: 750px;
            overflow: hidden;
            border: 1px solid grey;
            box-shadow: 5px 5px 5px gainsboro;
        }

        #main_top {
            text-align: center;
            color: white;
            margin-top: 150px;
        }

        section {
            width: 95%;
            margin: 50px auto;
            left: 20px;
        }

        .m2 {
            float: right;
            cursor: pointer;
        }

        header div {
            color: white;
            float: right;
            margin-top: 20px;
            margin-right: 50px;
        }
    </style>
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <header>
    </header>
    <div id="main_top">
        <span style="font-size: 50px">请 选 择 取 款 金 额</span>
        <h3>please select next step</h3>
    </div>
    <section>
        <a href="checkPassword.jsp?method=qukuan&money=200"> <img width="28%"  src="static/images/200.png"></a>
        <a href="checkPassword.jsp?method=qukuan&money=300"> <img width="28%" class="m2" style="" src="static/images/300.png"></a>
    </section>
    <section>
        <a href="checkPassword.jsp?method=qukuan&money=500"> <img style="" width="28%" src="static/images/500.png"></a>
        <a href="checkPassword.jsp?method=qukuan&money=800"> <img class="m2" width="28%" style="" src="static/images/800.png"></a>
    </section>
    <section>
        <a href="business.jsp"> <img width="28%" src="static/images/return.png"></a>
        <a href="other_money.jsp">
            <img class="m2" width="28%" style="" src="static/images/qitamiane.png">
        </a>
    </section>
</div>

<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script>

</script>
</body>
