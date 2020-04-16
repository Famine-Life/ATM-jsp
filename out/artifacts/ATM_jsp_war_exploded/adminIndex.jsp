<%@ page import="dao.cardDao" %>
<%@ page import="entity.CardInfo" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/3/30
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ATM管理面板</title>
    <!-- Custom styles for this template -->
    <link href="static/css/jumbotron-narrow.css" rel="stylesheet">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="static/lib/jquery/jquery.min.js"></script>
    <script src="static/lib/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<%
    cardDao cardDao = new cardDao();
    List<CardInfo> cardList = cardDao.getCardAll();

%>
<div class="container">
    <div class="header clearfix">
        <h3 class="text-muted">银行卡管理</h3>
    </div>
    <div class="row">
        <div class="col-md-12">
                <table class="table table-striped">
                    <tr>
                        <th>卡号</th>
                        <th>余额</th>
                        <th>密码</th>
                        <th>操作</th>
                    </tr>
        <%
            for (CardInfo card :cardList) {
        %>
                    <tr>
                        <td><%=card.getCardId() %></td>
                        <td class="cardMoney"><%=card.getMoney() %></td>
                        <td class="cardPassword"><%=card.getPassword() %></td>
                        <td>
                            <span   style="cursor:pointer" value="<%=card.getCardId() %>" class="glyphicon glyphicon-pencil edit-btn" aria-hidden="true"></span>
                            <span   style="cursor:pointer" value="<%=card.getCardId() %>" class="glyphicon glyphicon-trash delete-btn" aria-hidden="true"></span>
                        </td>
                    </tr>

        <%
            }
        %>
                </table>
        </div>
    </div>


    <footer class="footer">
        <button type="button" class="btn btn-success newCard-btn">办理新卡</button>
    </footer>

</div> <!-- /container -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">更新操作</h4>
            </div>
            <div class="modal-body">
                <form id="modelForm" style="width:80%;margin:0 auto;text-align:center">
                    <input type="hidden" name="method" id="modelMethod">
                    <label>账号:</label>
                    <input style="width: 300px" type="text" name="cardId" id="modelCardId"><br>
                    <label>余额:</label>
                    <input style="width: 300px" type="text" name="money" id="modelMoney"><br>
                    <label>密码:</label>
                    <input style="width: 300px" type="text" name="password" id="modelPassword"><br>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary model-submit-btn">提交</button>
            </div>
        </div>
    </div>
</div>


<script>
$(function () {
    //编辑按钮
    $(".edit-btn").click(function () {
        let cardId = $(this).attr("value");
        let cardMoney = $(this).parent().siblings(".cardMoney").text();
        let cardPassword = $(this).parent().siblings(".cardPassword").text();
        $("#myModal #modelCardId").val(cardId);
        $("#myModal #modelMoney").val(cardMoney);
        $("#myModal #modelPassword").val(cardPassword);
        $("#myModal #modelMethod").val("edit");     //给后台传递操作类型
        $('#myModal').modal('toggle');
        // $("#myModal #modelCardId").attr("disabled","disabled");
    });
    //删除按钮
    $(".delete-btn").click(function () {
        let cardId = $(this).attr("value");
        var i = confirm("确定销户吗？数据将无法恢复!");
        if(i){
            $.post("admin",{"method":"delete","cardId":cardId},
                function (res) {
                    alert(res);
                    window.location.reload();
                })
        }
    });

    //办理新卡按钮
    $(".newCard-btn").click(function () {
        $('#myModal').modal('toggle');
        $("#myModal #modelMethod").val("new");     //给后台传递操作类型
    });


    //提交按钮
    $("#myModal .model-submit-btn").click(function () {
        $.post("admin",$("#modelForm").serialize(),
            function (res) {
                console.log(res);
                $('#myModal').modal('toggle');
                alert(res);
                window.location.reload();
            }
        );
    });

})
</script>

</body>
</html>
