<%@ page import="javax.smartcardio.Card" %>
<%@ page import="entity.CardInfo" %><%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/21
  Time: 20:50
  To change this template use File | Settings | File Templates.
  业务选择页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>业务选择</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui/css/layui.css"   href="static/lib/layui/css/layui.css}">
    <link href="static/lib/bootstrap/css/bootstrap.css"   href="static/lib/bootstrap/css/bootstrap.css}"
          rel="stylesheet">
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
        <div>
            <%
                CardInfo sec_cardInfo = (CardInfo) session.getAttribute("sec_cardInfo");
                String cardId = sec_cardInfo.getCardId();
            %>
            <h3><%=sec_cardInfo.getCardId()%></h3>
            <h4>welcome</h4>
        </div>
    </header>
    <div id="main_top">
        <span style="font-size: 50px">请 选 择 业 务</span>
        <h3>please select next step</h3>
    </div>
    <section>
        <a href="qukuan.jsp"> <img  style=""   src="static/images/qukuang.png"></a>
        <a href="chaxun.jsp"> <img class="m2" style=""   src="static/images/check.png"></a>
    </section>
    <section>
        <a href="zhuanzhang.jsp"> <img style="" src="static/images/zhuanzhang.png"></a>
        <a href="cunkuan.jsp"> <img class="m2" style=""   src="static/images/repository.png"></a>
    </section>
    <section>
        <a href="exit.jsp"><img   src="static/images/exit.png"></a>
        <a href="checkPassword.jsp?method=changePwd"> <img class="m2"   src="static/images/changepassword.png"></a>

    </section>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script   src="static/lib/layui/layui.js"></script>
<script   src="static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>