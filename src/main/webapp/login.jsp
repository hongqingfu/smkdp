<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆</title>
    <%--<link rel="stylesheet" type="text/css" href="static/me/body.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="static/me/style.css"/>--%>
</head>
<body>
<div class="login-page">
    <div class="login-card">
        <div class="main ivu-card ivu-card-bordered">
            <div class="ivu-card-body">
                <h2 class="title">登录系统帐号</h2>
                <form autocomplete="off" class="submit-form ivu-form ivu-form-label-top">
                    <div class="ivu-form-item">
                        <label class="ivu-form-item-label">账号：</label>
                        <div class="ivu-form-item-content">
                            <div class="ivu-input-wrapper ivu-input-wrapper-large ivu-input-type">
                                <i class="ivu-icon ivu-icon-load-c ivu-load-loop ivu-input-icon ivu-input-icon-validate"></i>
                                <input autocomplete="off" spellcheck="false" type="text" placeholder="" class="ivu-input ivu-input-large">
                            </div>
                        </div>
                    </div>
                    <div class="ivu-form-item">
                        <label class="ivu-form-item-label">密码：</label>
                        <div class="ivu-form-item-content">
                            <div class="ivu-input-wrapper ivu-input-wrapper-large ivu-input-type">
                                <i class="ivu-icon ivu-icon-load-c ivu-load-loop ivu-input-icon ivu-input-icon-validate"></i>
                                <input autocomplete="off" spellcheck="false" type="text" placeholder="" class="ivu-input ivu-input-large">
                            </div>
                        </div>
                    </div>
                    <div class="sub text-center">
                        <button type="button" class="login-btn ivu-btn ivu-btn-primary ivu-btn-long ivu-btn-large">
                            <span>登&nbsp;&nbsp;录</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<style>

    .login-page {
        background: #FFF;
        height: 100%;
        position: absolute;
        width: 100%;
    }

    .login-card {
        width: 840px;
        height: 482px;
        margin: 100px auto;
        border-radius: 3px;
        box-shadow: 0 0 4px rgba(0, 0, 0, .2);
        line-height: 1;
        background: url("static/images/login_bg.jpg");
    }

    .login-card .main {
        position: relative;
        float: left;
        border: 1px solid #e5e5e5;
        border-radius: 3px;
        background-color: #fff;
        box-shadow: 2px 2px 56px rgba(0, 0, 0, .13);
        -webkit-box-shadow: 2px 2px 56px rgba(0, 0, 0, .13);
        width: 380px;
        height: 564px;
        top: -40px;
        padding-left: 55px;
        margin-left: 340px;
    }

    .ivu-card-bordered {
        border: 1px solid #dddee1;
        border-color: #e9eaec;
    }

    .ivu-card {
        background: #fff;
        border-radius: 4px;
        font-size: 14px;
        position: relative;
        transition: all 0.2s ease-in-out;
    }

    .ivu-card-body {
        padding: 16px;
    }

    .login-card .main .title {
        margin: 50px 0 0;
        color: #212121;
        font-size: 30px;
        font-weight: 300;
    }
    .login-card .main .submit-form {
        margin-top: 78px;
        width: 315px;
    }
    .ivu-form-item {
        margin-bottom: 24px;
        vertical-align: top;
        zoom: 1;
    }
    .ivu-form-label-top .ivu-form-item-label {
        float: none;
        display: inline-block;
        padding: 0 0 10px 0;
    }
    .ivu-form-item-content {
        position: relative;
        line-height: 32px;
        font-size: 12px;
    }
    .ivu-input-wrapper {
        display: inline-block;
        width: 100%;
        position: relative;
        vertical-align: middle;
        line-height: normal;
    }
    .ivu-input-wrapper-large .ivu-input-icon {
        font-size: 18px;
        height: 36px;
        line-height: 36px;
    }
    .ivu-input-large {
        font-size: 14px;
        padding: 6px 7px;
        height: 36px;
    }
    .ivu-input {
        display: inline-block;
        width: 100%;
        height: 32px;
        line-height: 1.5;
        padding: 4px 7px;
        font-size: 12px;
        border: 1px solid #dddee1;
        border-radius: 4px;
        color: #383838;
        background-color: #fff;
        background-image: none;
        position: relative;
        cursor: text;
        transition: border 0.2s ease-in-out, background 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }
    .sub {
        margin-top: 36px;
        padding-bottom: 20px;
    }
    .text-center {
        text-align: center;
    }
    .login-btn {
        padding-bottom: 6px;
        font-size: 16px;
    }
    .ivu-btn-primary {
        color: #fff;
        background-color: #2d8cf0;
        border-color: #2d8cf0;
    }
    .ivu-btn-long {
        width: 100%;
    }
    .ivu-btn-large {
        padding: 6px 15px 6px 15px;
        font-size: 14px;
        border-radius: 4px;
    }
    .ivu-btn, .ivu-btn:active, .ivu-btn:focus {
        outline: 0;
    }
    .ivu-btn {
        display: inline-block;
        margin-bottom: 0;
        font-weight: normal;
        text-align: center;
        vertical-align: middle;
        touch-action: manipulation;
        cursor: pointer;
        background-image: none;
        border: 1px solid transparent;
        white-space: nowrap;
        line-height: 1.5;
        user-select: none;
        padding: 6px 15px;
        font-size: 12px;
        border-radius: 4px;
        transition: color 0.2s linear, background-color 0.2s linear, border 0.2s linear, box-shadow 0.2s linear;
        color: #383838;
        /*background-color: #f7f7f7;*/
        border-color: #dddee1;
    }
    button, html [type="button"], [type="reset"], [type="submit"] {
        -webkit-appearance: button;
    }
</style>
</body>
</html>
