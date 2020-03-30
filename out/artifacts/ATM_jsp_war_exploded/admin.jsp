<%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/3/30
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理界面</title>
    <!-- Custom styles for this template -->
    <link href="static/css/signin.css" rel="stylesheet">
    <link href="static/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="static/lib/jquery/jquery.min.js"></script>
    <script src="static/lib/bootstrap/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
    <form class="form-signin">
        <h2 class="form-signin-heading">登录管理面板</h2>
<%--        <label for="inputUsername" class="sr-only">username</label>--%>
        <input type="text" name="username" id="inputUsername" class="form-control" placeholder="username" required autofocus>
<%--        <label for="inputPassword" class="sr-only">Password</label>--%>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住密码
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block submit-btn" type="button">登录</button>
    </form>

</div> <!-- /container -->

</body>

<script>
$(function () {

    $(".submit-btn").click(function () {
        var username = $("#inputUsername").val();
        var pwd = $("#inputPassword").val();
        console.log(username);
        console.log(pwd);
        $.post("adminLogin", {"username": username, "password": pwd},
            function (data) {
                console.log(data)
                if (data === "0") {
                    alert("账号或密码错误!");
                } else {
                    alert("登录成功!");
                    window.location.href = "adminIndex.jsp";
                }
            })
    });

})
</script>
</html>
