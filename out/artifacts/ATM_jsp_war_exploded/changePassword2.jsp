<%@ page import="entity.CardInfo" %><%--
  Created by IntelliJ IDEA.
  User: wonder
  Date: 2020/1/22
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="static/css/password.css">
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
        <span style="font-size: 50px">请 再 次 输 入 新 密 码</span>
        <h3>please select next step</h3>
        <div class="password-div">
            <label id="input2" for="pwd2" class="password-lable">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
                <input id="pwd2" type="password" name="password" maxlength="6"
                       autofocus="autofocus">

            </label>
        </div>
    </div>
    <footer>
        <%--        <img id="continue" width="29%" src="static/images/continue.png">--%>
        <a href="business.jsp"><img width="29%" src="static/images/return.png"></a>
        <img id="m2" onclick="BackSpace()" src="static/images/huishan.png" >
    </footer>
</div>
<script src="static/lib/jquery/jquery.min.js"></script>
<script src="static/lib/layui/layui.js"></script>
<script src="static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    <%
      CardInfo card = (CardInfo) session.getAttribute("sec_cardInfo");
  %>
    var new_pwd1 = "<%=request.getParameter("new_password1")%>"
    var se_cardId = "<%=card.getCardId()%>";
    var postUrl = "changePassword_servlet";

    layui.use('layer', function () {
        /*输入框js事件*/
        $(".password-div input").on("input", function (e) { //标签为password-div下的input添加oninput事件
            var number = 6;   //定义输入最大值
            var new_pwd2 = $("input[name = 'password']").val(); //获取密码
            var list = $(".password-div ul li");  //定义list是li
            for (var i = 0; i < number; i++) {    //for循环遍历将·放入li标签
                if (new_pwd2[i]) {
                    $(list[i]).text("·");
                } else {
                    $(list[i]).text("");
                };
            };
            //表单输入完后触发
            if (new_pwd2.length == 6) {
                console.log("密码：",new_pwd1,new_pwd2);
                if (new_pwd1 == new_pwd2) {
                    $.post(postUrl, {"cardId": se_cardId, "new_password": new_pwd2,},
                        function (data) {
                            if(data==="success"){
                                //window.location.href = to_location;
                                layui.use('layer', function () {
                                    var layer = layui.layer;
                                    layer.msg("密码修改成功!5秒后为您跳转到业务选择页面！");
                                    setTimeout(function () {
                                        window.location.href="business.jsp";
                                    },5000)
                                });
                            }else {
                                alert(data);
                            }

                        }
                    )
                }else{
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg("两次输入密码不一致，请重新输入");
                        setTimeout(function () {
                            window.location.href="changePassword.jsp";
                        },3000)
                    });
                }

            }


            $(".password-div ul").click(function () {
                $("input[name = 'password']").val("");
                $("#password").focus();
                $(".password-div ul li").text("");
            });


        });

    })
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