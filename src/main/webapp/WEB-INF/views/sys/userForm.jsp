<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户维护</title>
    <meta name="decorator" content="blank"/>
    <script type="text/javascript" src="${ctxStatic}/js/sys/userForm.js"></script>
</head>
<body>
<div>
    <div class="k-block">
        <div class="k-header k-shadow">用户维护</div>
        <div id="conditions">

            <div class="form-horizontal form-widgets col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-4">用户头像</label>
                    <div class="col-sm-8 col-md-6">
                        <img src="logo.png" style="height: 100px;width: 100px;">
                        <input name="files" id="files" type="file" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="email">邮箱</label>
                    <div class="col-sm-8 col-md-6">
                        <input class="k-textbox" name="email" id="email" type="email" data-bind="value:email"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="phone" id="skills_label">手机号码</label>
                    <div class="col-sm-8 col-md-6">
                        <input class="k-textbox" name="phone" id="phone" type="text" data-bind="value:phone"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="mobile">电话号码</label>
                    <div class="col-sm-8 col-md-6">
                        <input class="k-textbox" name="mobile" id="mobile" type="text" data-bind="value:mobile"
                               required>
                    </div>
                </div>
            </div>
            <div class="form-horizontal form-widgets col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="loginName">用戶名</label>
                    <div class="col-sm-8 col-md-6">
                        <input name="loginName" id="loginName" autocomplete="off" data-bind="value:loginName" required class="k-textbox">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="newPassword">密码</label>
                    <div class="col-sm-8 col-md-6">
                        <input name="newPassword" id="newPassword" type="password" data-bind="value:newPassword" autocomplete="new-password" required class="k-textbox">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="name" id="gender_label">姓名</label>
                    <div class="col-sm-8 col-md-6">
                        <input class="k-textbox" name="name" id="name" type="text" data-bind="value:name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="no" id="language_label">工号</label>
                    <div class="col-sm-8 col-md-6">
                        <input class="k-textbox" name="no" id="no" type="text" data-bind="value:no" required>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="buttons-wrap" style="border-top: 1px solid #e7e7e7;padding-top: .5em;text-align: right;">
                <button class="k-button k-state-default" data-bind="click:save">保存</button>
                <button class="k-button k-state-default" data-bind="click:save">关闭</button>
            </div>
            <%--<div id="conditions" class="form-horizontal">
                <input name="id" type="text" data-bind="value:id" style="display: none">
                &lt;%&ndash;<div class="form-group">
                    <label class="col-md-2 control-label">用戶头像</label>
                    <div class="col-md-4">
                        <input class="form-control" name="photo" id="photo" type="text"
                               data-bind="value:loginName" required>
                    </div>
                </div>&ndash;%&gt;
                &lt;%&ndash;<div class="form-group">
                    <label class="col-md-2 control-label">用戶名</label>
                    <div class="col-md-4">
                        <input class="form-control" name="loginName" id="loginName" type="text" autocomplete="off"
                               data-bind="value:loginName" required>
                    </div>
                </div>
                <div class="form-group" id="pg">
                    <label class="col-md-2 control-label">密码</label>
                    <div class="col-md-4">
                        <input class="form-control" name="newPassword" id="newPassword" type="password" data-bind="value:newPassword"
                               autocomplete="new-password" required >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">姓名</label>
                    <div class="col-md-4">
                        <input class="form-control" name="name" id="name" type="text" data-bind="value:name" required>
                    </div>
                </div>&ndash;%&gt;
                &lt;%&ndash;<div class="form-group">
                    <label class="col-md-2 control-label">工号</label>
                    <div class="col-md-4">
                        <input class="form-control" name="no" id="no" type="text" data-bind="value:no" required>
                    </div>
                </div>&ndash;%&gt;
                &lt;%&ndash;<div class="form-group">
                    <label class="col-md-2 control-label">邮箱</label>
                    <div class="col-md-4">
                        <input class="form-control" name="email" id="email" type="email" data-bind="value:email"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">手机号码</label>
                    <div class="col-md-4">
                        <input class="form-control" name="phone" id="phone" type="text" data-bind="value:phone"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">电话号码</label>
                    <div class="col-md-4">
                        <input class="form-control" name="mobile" id="mobile" type="text" data-bind="value:mobile"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6 text-center">
                        <button class="btn btn-primary" data-bind="click:save"><span
                                class="glyphicon glyphicon-floppy-disk"></span>暂存
                        </button>
                    </div>
                </div>&ndash;%&gt;
            </div>--%>
        </div>
    </div>
</div>
</div>
</body>
</html>
