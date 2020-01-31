
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
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
            overflow: hidden;
            border: 1px solid grey;
            box-shadow: 5px 5px 5px gainsboro;
        }
        #main>div{
            text-align: center;
            color: white;
            margin-top: 200px;
        }
        section {
            width: 95%;
            margin: 50px auto;
            left: 20px;
        }

        header div {
            color: white;
            float: right;
            margin-top: 20px;
            margin-right: 50px;
        }

        footer {
            width: 95%;
            margin: 240px auto;
            left: 20px;
        }

        #m2{
            float: right;
            cursor: pointer;
        }
        #continue{
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <div>
        <span style="font-size: 50px">请 取 走 您 的 磁 卡 ！</span>
        <h3>欢迎下次光临</h3>
    </div>
    <footer>
<%--        <img id="continue" width="29%" src="static/images/continue.png">--%>
        <a href="index.jsp"><img id="m2" width="29%" src="static/images/return.png"></a>
    </footer>
</div>

<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script>
</script>
</body>
</html>
