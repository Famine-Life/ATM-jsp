<%@ page import="entity.TransInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>凭条</title>
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
        .layui-table tbody tr:hover {
            background:none;
        }
        .layui-table {
            width: 100%;
            color: black;
        }
        footer {
            width: 95%;
            margin: 200px auto;
            left: 20px;
        }

        #m2 {
            float: right;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
    TransInfo transInfo = (TransInfo) session.getAttribute("transInfo");

%>

<!--主体-->
<div id="main" class="layui-main">
    <div>
        <h1>凭 条 信 息</h1>
        <table class="layui-table" style="width: 50%; margin: 30px auto; box-shadow:5px 3px 3px darkgrey;">
            <tbody style="">
            <tr>
                <td>卡 号：</td>
                <td>${transInfo.cardId}</td>
            </tr>
            <tr>
                <td>日 期:</td>
                <td>${transInfo.transDate}</td>
            </tr>
            <tr>
                <td>交 易 类 型:</td>
                <%
                    Integer transType = transInfo.getTransType();
                    String type =null;
                    if(transType==0){
                        type="存款";
                    }
                    if(transType==1){
                        type="取款";
                    }
                    if(transType==2){
                        type="转账";
                    }
                %>
                <td><%=type%></td>
<%--                <td>存款</td>--%>
<%--                <td>取款</td>--%>
<%--                <td>转账</td>--%>
            </tr>
            <tr>
                <td>金 额：</td>
                <td>${transInfo.transMoney}</td>
            </tr>
            <%
                String remark = transInfo.getRemark();
                //if(remark!=null&& !remark.equals("")){
                if(transType==2){
            %>
            <tr>
                <td>转 入 账 户：</td>
                <td>${transInfo.remark}</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <footer>
        <a href="exit.jsp"><img id="m2"  width="29%" src="static/images/exit.png"></a>
        <a href="business.jsp"> <img id="continue" width="29%" src="static/images/return.png"></a>

    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
