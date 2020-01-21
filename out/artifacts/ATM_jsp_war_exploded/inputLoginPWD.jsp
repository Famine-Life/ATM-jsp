<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/20
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="static/css/password.css">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<!--主体-->
<div id="main" class="layui-main">
    <div>
        <span style="font-size: 50px">请 输 入 密 码</span>
        <h3>please input the password</h3>
        <div class="password-div">
            <label for="password" class="password-lable">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
                <input id="password" type="password" name="password" maxlength="6" th:autocomplete="off"
                       autofocus="autofocus">

            </label>
        </div>
    </div>
    <footer>
        <a th:href="@{~/index}"> <img width="29%" src="static/images/return.png" th:src="@{/images/return.png}"></a>
        <img id="m2" src="static/images/huishan.png" th:src="@{/images/huishan.png}">
    </footer>
    <form id="my_form" th:method="get"></form>
</div>

<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<%--
<script th:inline="javascript">
    layui.use('layer', function () {
        var layer = layui.layer;
        //获取卡号
        var cardId = /*[[${#session.getAttribute('cardId')}]]*/'';
        /*输入框js事件*/
        $(".password-div input").on("input", function (e) { //标签为password-div下的input添加oninput事件
            var number = 6;   //定义输入最大值
            var pw = $("input[name = 'password']").val(); //定义pw为name是password的input框的输入值
            var list = $(".password-div ul li");  //定义list是li
            for (var i = 0; i < number; i++) {    //for循环遍历将·放入li标签
                if (pw[i]) {
                    $(list[i]).text("·");
                } else {
                    $(list[i]).text("");
                }
                ;
            }
            ;
            //表单输入完后触发
            if (pw.length == 6) {
                var str = /*[[${#request.getAttribute('str')}]]*/'';     //接收页面发送过来的值来判断是什么操作
                var newUrl = '/checkPassword';  //登陆、验证账号密码是否正确
                var synchronizationUrl = '' //密码验证成功后的跳转地址
                //根据不同的请求进行不同的操作
                if (str === "payee") {   //取款
                    synchronizationUrl = "/getWithdrawal";
                } else if (str === "saveSum") { //存款
                    synchronizationUrl = "/saveMoney";
                } else if (str === "transMoney") {  //转账
                    synchronizationUrl = "/transferMoney";
                } else if (str === "editPassword") {    //修改密码
                    synchronizationUrl = "/newPassword";
                } else if (str == "login") {    //登陆
                    newUrl = "/userLogin";
                    synchronizationUrl = '/index';
                }
                $("#my_form").attr('action', synchronizationUrl);
                //判断账号密码是否正确
                $.post(newUrl, {"cardId": cardId, "password": pw}, function (data) {
                    //如果账户密码正确，则根据对应的操作进行不同的业务
                    if (data.res.trim() === "success") {
                        if (str === "payee") {  //取款
                            $.post(synchronizationUrl,{"cardId":cardId,"money":getParams("money")}, function (data) {
                                if (data.res === "success") {
                                    $("#my_form").attr('action', "/payee");
                                } else if (data.res === "error") {
                                    layer.msg(data.meg);
                                    $("#my_form").attr('action', "/otherMoney");
                                }
                            });
                            //转账操作
                        } else if (str === "transMoney") {
                            $.post(synchronizationUrl, {
                                "userCard": /*[[${#session.getAttribute('cardId')}]]*/'',
                                "transCard": /*[[${#session.getAttribute('transCardId')}]]*/'',
                                "money": getParams("money")
                            }, function (data) {
                                if (data.res === "success") {
                                    $("#my_form").attr('action', "/printed");
                                } else if (data.res === "error") {
                                    layer.msg(data.meg);
                                    $("#my_form").attr('action', "/index");
                                }
                            });
                        } else if (str === "saveSum") {   //存钱
                            $.post(synchronizationUrl,{"cardId":cardId,"money":getParams("money")},function (data) {
                                if (data.res === "success") {
                                    $("#my_form").attr('action', "/printed");
                                } else if (data.res === "error") {
                                    layer.msg(data.meg);
                                    $("#my_form").attr('action', "/otherMoney");
                                }
                            });
                        } else if (str === "editPassword") {    //修改密码
                            $("#my_form").attr('action', "/newPassword");
                        }
                        //根据不同的请求跳转到不同的页面，默认是登陆跳转到主页
                        window.setTimeout("$('#my_form').submit()", 1000);
                    } else if (data.res.trim() === "error") {
                        layer.msg(data.meg);
                        //清空表单
                        $("input[name = 'password']").val("");
                        $("#password").focus();
                        $(".password-div ul li").text("");
                    }
                });
            }
        });

        $(".password-div ul").click(function () {
            $("input[name = 'password']").val("");
            $("#password").focus();
            $(".password-div ul li").text("");
        });
        /*退卡*/
        $("#exit").click(function () {
            window.location.href = "exit.html"
        })

        /*获取页面传递参数*/
        function getParams(key) {	//key为参数名称
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) {
                return unescape(r[2]);
            }
            return null;
        };
    });
</script>
--%>
</body>
</html>