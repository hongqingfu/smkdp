<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="static/me/body.css" />
    <link rel="stylesheet" type="text/css" href="static/me/style.css"/>
</head>
<body>
    <div class="container">
        <section id="content">
            <form action="">
                <h1>登录</h1>
                <div>
                    <input type="text" placeholder="邮箱" required="" id="username" />
                </div>
                <div>
                    <input type="password" placeholder="密码" required="" id="password" />
                </div>
                <div class="">
                    <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div>
                <div>
                    <!-- <input type="submit" value="Log in" /> -->
                    <input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
                    <a href="#">忘记密码?</a>
                    <!-- <a href="#">Register</a> -->
                </div>
            </form><!-- form -->
            <div class="button">
                <%--<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>--%>
                <%--<a href="#">下载网盘</a>--%>
            </div> <!-- button -->
        </section><!-- content -->
    </div>
</body>
</html>
