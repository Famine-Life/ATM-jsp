<%@ page import="entity.CardInfo" %><%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>转账</title>
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
        <span style="font-size: 50px">请 输 入 卡 号</span>
        <h3>please select next step</h3>
        <form class="form-inline">
            <div class="form-group">
                <input id="card1" type="text" name="cardId" style="height: 50px;font-size: 24px;" class="form-control" required
                       placeholder="请 输 对 方 卡 号">
                <input id="card2" type="text" name="cardId" style="height: 50px;font-size: 24px;" class="form-control" required
                       placeholder="请 再 次 输 入 ">
            </div>
        </form>
    </div>
    <footer>
        <img id="continue" width="29%" src="static/images/continue.png">
        <a href="business.jsp"><img id="m2" width="29%" src="static/images/return.png"></a>
    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    <%
      CardInfo card = (CardInfo) session.getAttribute("sec_cardInfo");
      String cardId = card.getCardId();
      request.setAttribute("cardId",cardId);
  %>
    var cardId = "<%=card.getCardId()%>";

    $(function () {
        var to_location = "zhuanzhang_money.jsp";
        var method = "zhuanzhang";

        $("#card2").hide();
        $("#continue").click(function () {
            var to_cardId1 = $("#card1").val();
            if(to_cardId1==""){
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg("卡号不能为空");
                });
            }else if(to_cardId1==cardId){
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg("不能转账给自己！");
                });
            }else{
                console.log(to_cardId1)
                $("#card1").hide();
                $("#card2").show();
                var to_cardId2 = $("#card2").val();
                if (to_cardId2 != "") {
                    if (to_cardId1 === to_cardId2) {
                        //跳转
                        window.location.href = to_location+"?to_cardId="+to_cardId2;
                    }else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg("两次输入账号不一致，请重新输入");
                        });
                        $("#card2").val("");
                        $("#card1").val("");
                        $("#card1").show();
                        $("#card2").hide();
                    }
                }else{
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg("再次输入账号！");
                    });
                }
            }

        });

    })
</script>
</body>
</html>