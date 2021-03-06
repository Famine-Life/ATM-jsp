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
    <title>登录密码页面</title>
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
                <input id="password" type="password" name="password" maxlength="6"
                       autofocus="autofocus">

            </label>
        </div>
    </div>
    <footer>
        <a href="index.jsp"> <img width="29%" src="static/images/return.png" ></a>
        <img id="m2" onclick="BackSpace()" src="static/images/huishan.png" >
    </footer>
<%--    <form id="my_form" method="get"></form>--%>
</div>

<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    layui.use('layer', function () {
        //限制密码输入错误的次数
        var inputPwdNum = 1;

        var layer = layui.layer;
        //获取卡号
        var cardId = "<%=request.getParameter("cardId")%>";
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
                };
            };
            //表单输入完后触发
            if (pw.length == 6) {
                console.log("pw:",pw);
                $.post("login_servlet", {"cardId": cardId, "password": pw },
                    function (data) {
                        console.log("data:",data)
                        if (data === "success") {
                            //跳转到业务选择页面
                            window.location.href="business.jsp";
                            console.log("登录成功!");
                        } else if (data === "error") {
                            console.log("登录失败!");
                            layer.msg("密码错误！");
                            $("input[name = 'password']").val("");
                            $(".password-div ul li").text("");
                            if(inputPwdNum===3){
                                console.log("密码错误达到3次。");
                                layer.msg("密码错误达到3次！3秒后为你返回ATM机主页面。");
                                setTimeout(function () {
                                    window.location.href="index.jsp";
                                },3000)
                            }else {
                                inputPwdNum++;
                            }
                        }
                });
            }


            $(".password-div ul").click(function () {
                $("input[name = 'password']").val("");
                $("#password").focus();
                $(".password-div ul li").text("");
            });


            // /*退卡*/
            // $("#exit").click(function () {
            //     window.location.href = "exit.html"
            // });

        });
    });

    //回删点击
    function BackSpace() {
        var m2 = document.querySelector("#m2");
        var pw = $("input[name = 'password']").val(); //定义pw为name是password的input框的输入值

        //删除pw最后一个数字
        pw=pw.substring(0,pw.length-1);
        console.log("pw 回删:",pw);

        //设置焦点
        $("input[name = 'password']").focus();

        //重新渲染li的样式
        var number = 6;   //定义输入最大值
        $("input[name = 'password']").val(pw); //设置输入密码为修改过后的
        var list = $(".password-div ul li");  //定义list是li
        for (var i = 0; i < number; i++) {    //for循环遍历将·放入li标签
            if (pw[i]) {
                $(list[i]).text("·");
            } else {
                $(list[i]).text("");
            };
        };
    }

</script>
</body>
</html>