<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>转账金额</title>
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
        <span style="font-size: 50px">请 输 入 转 账 金 额</span>
        <h3>please select next step</h3>
        <form id="my_form" class="form-inline">
            <div class="form-group">
                <input type="text" name="money" style="height: 50px;font-size: 24px;" class="form-control" autofocus="autofocus"
                       placeholder="请 输 入 转 账 金 额">
            </div>
        </form>
    </div>
    <footer>
        <a id="continue"><img width="29%" src="static/images/continue.png"></a>
        <a href="business.jsp"> <img id="m2" width="29%" src="static/images/return.png"></a>
    </footer>
</div>
</body>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">

    var to_location = "checkPassword.jsp";
    var method = "zhuanzhang";
    var to_cardId = "";
    var to_cardId = "<%=request.getParameter("to_cardId")%>"; //要转入的卡号
    console.log(to_cardId);
    $("#continue").click(function () {
        var money = $("input[name='money']").val();
        console.log(money);//""
        console.log(money%100!=0);//false
        if(money==0||money==""||money%100!=0){
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.msg("输入金额必须为100的倍数");
            });
        }else {
           //跳转到checkPassword.jsp
            console.log("continue");
            window.location.href = to_location+"?method="+method+"&to_cardId="+to_cardId+"&money="+money;
        }
    });

</script>

</html>