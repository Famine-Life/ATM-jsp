<%@ page import="entity.CardInfo" %><%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询余额</title>
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
            border: 1px solid grey;
            box-shadow: 5px 5px 5px gainsboro;
        }

        #main > div {
            text-align: center;
            color: white;
            margin-top: 250px;
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
    <div>
        <h1 id="usableMoney"></h1>
        <h1 id="allMoney"></h1>
    </div>
    <footer>
        <a href="business.jsp">
            <img id="exit" width="29%" src="static/images/continue.png">
            <img id="m2" width="29%" src="static/images/return.png">
        </a>
    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    <%
        CardInfo card = (CardInfo) session.getAttribute("sec_cardInfo");
    %>
    var cardId = "<%=card.getCardId()%>";

    $.post('cardMoney_servlet',{"method":"chaxun","cardId":cardId},
        function (data) {
            console.log(data);
            console.log(data.code);
            if(data.code==="success"){
                var allMoney = data.allMoney;
                var usable = data.usable;
                //$("#usableMoney").text("可 用 金 额：" + usable);
                $("#allMoney").text("余  额：" + allMoney)
            }else{
                alert(data);
            }
    });
</script>
</body>
</html>