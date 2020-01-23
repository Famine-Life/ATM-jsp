<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>存款</title>
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

        #m2 {
            float: right;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <header>
    </header>
    <div id="main_top">
        <span style="font-size: 50px">请 将 钞 票 放 入 钞 票 口</span>
        <h3>please select next step</h3>
        <form id="my_form" action="/cardMoney_servlet" class="form-inline">
            <div class="form-group">
                <input type="text" name="money" style="height: 50px;font-size: 24px;" class="form-control"
                       autofocus="autofocus"
                       placeholder="请 输 入 存 款 金 额" required="required">
            </div>
        </form>

    </div>
    <footer>
        <img id="continue" width="29%" src="static/images/continue.png">
        <img id="m2" width="29%" src="static/images/return.png">
    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        //监听存款的点击
        $("#continue").click(function () {
            var money = $("input[name='money']").val();
            if (money % 100 != 0) {
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg("输入金额必须为100的倍数");
                });
            } else {
                $("#my_form").submit();
            }
        });

    })
</script>
</body>
</html>