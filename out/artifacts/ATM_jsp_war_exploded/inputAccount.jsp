<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/19
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输入账号</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="static/lib/layui/css/layui.css" rel="stylesheet">
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
        #continue{
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
        <span style="font-size: 50px">请 输 入 卡 号</span>
        <h3>please select next step</h3>
        <form class="form-inline">
            <div class="form-group">
                <input type="text" name="cardId" style="height: 50px;font-size: 24px;" class="form-control"
                       placeholder="请 输 入 卡 号">
            </div>
        </form>
    </div>
    <footer>
        <img id="continue" width="29%" src="static/images/continue.png">
        <a  href="index.jsp"><img id="m2" width="29%" src="static/images/return.png"></a>
    </footer>
</div>
<%--<form id="myform" th:action="@{~/load}"></form>--%>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        $("#continue").click(function () {
            var cardId = $('input[name="cardId"]').val();
            $.post("getCardIdInfo_servlet", {"cardId": cardId,"method": "comfirmCardID"},
                function (data) {
                    if(data=='200'){
                        //卡号存在跳转到密码输入页面
                        window.location.href="inputLoginPWD.jsp?cardId="+cardId;
                    }else{
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            //alert(data);
                            layer.msg(data);
                        });
                    }


            });
        });

    })
</script>
</body>
</html>