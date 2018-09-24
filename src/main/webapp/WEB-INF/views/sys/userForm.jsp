<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户维护</title>
    <meta name="decorator" content="blank"/>
    <script type="text/javascript" src="${ctxStatic}/js/sys/userForm.js"></script>
    <style>
        .file-box {
            position: relative;
            display: inline-block;
        }

        .file-box img {
            /*width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: 0px;
            left: 0;
            display: inline-block;
            border: none;*/
            max-width: 100%;
            width: auto;
            vertical-align: middle;
            border: 0;
        }

        .file-box .txt, .file-box .file {
            width: 100px;
            height: 36px;
            position: absolute;
            top: 30px;
            left: 130px;
            text-align: center;
        }
    </style>
    <script>

        function imgPreview(fileDom) {
            //判断是否支持FileReader
            if (window.FileReader) {
                var reader = new FileReader();
            } else {
                alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
            }
            //获取文件
            var file = fileDom.files[0];
            var imageType = /^image\//;
            //是否是图片
            if (!imageType.test(file.type)) {
                alert("请选择图片！");
                return;
            }
            //读取完成
            reader.onload = function (e) {
                //获取图片dom
                var img = document.getElementById("preview");
                //图片路径设置为读取的图片
                img.src = e.target.result;
            };
            reader.readAsDataURL(file);
            var formData = new FormData();
            formData.append('file', $('#input_file')[0].files[0]);  //添加图片信息的参数
            formData.append('sizeid', 123);  //添加其他参数
            $.ajax({
                url: ctx + '/user/upload',
                type: 'POST',
                cache: false, //上传文件不需要缓存
                data: formData,
                processData: false, // 告诉jQuery不要去处理发送的数据
                contentType: false, // 告诉jQuery不要去设置Content-Type请求头
                success: function (data) {
                    // var rs = eval("("+data+")");
                    console.log(data);
                    $("#photo").val(data);
                    $("#photo").change();
                },
                error: function (data) {
                    alert("上传失败");
                }
            });
        }
    </script>
</head>
<body>
<div>
    <div class="k-block col-sm-9">
        <div class="k-header k-shadow">用户维护</div>
        <div id="conditions" class="container-fluid">
            <input type="hidden" id="id" data-bind="value:id">
            <div class="col-sm-3">
                <div style="height: 100px;">
                    <div class="file-box" id="filebox">
                        <img id="preview" src="../static/images/Koala.jpg" onclick="$('#input_file').click();"/>
                        <%--<input type="text" id="imgfield" class="txt" placeholder="预览">--%>
                        <%--<button type="button" id="imgfield" class="txt" onclick="$('#input_file').click();">预览</button>&nbsp;--%>
                        <input type="file" name="file" id="input_file" class="file" style="display: none;"
                               accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" onchange="imgPreview(this)">
                        <input type="hidden" data-bind="value:photo" id="photo" name="photo">
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="form-horizontal form-widgets">
                    <h5>登录信息</h5>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="loginName">用戶名</label>
                        <div class="col-sm-8 col-md-10">
                            <input name="loginName" id="loginName" autocomplete="off" data-bind="value:loginName" class="k-textbox" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="newPassword">密码</label>
                        <div class="col-sm-8 col-md-10">
                            <input name="newPassword" id="newPassword" type="password" data-bind="value:newPassword"
                                   required class="k-textbox">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">姓名</label>
                        <div class="col-sm-8 col-md-10">
                            <input class="k-textbox" name="name" id="name" type="text" data-bind="value:name" required>
                        </div>
                    </div>
                    <h5>个人信息</h5>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="no">工号</label>
                        <div class="col-sm-8 col-md-10">
                            <input class="k-textbox" name="no" id="no" type="text" data-bind="value:no" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="companyId">归属公司</label>
                        <div class="col-sm-8 col-md-10">
                            <input name="companyId" id="companyId" data-bind="value:companyId" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="companyId">归属部门</label>
                        <div class="col-sm-8 col-md-10">
                            <input name="officeId" id="officeId" data-bind="value:officeId" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">邮箱</label>
                        <div class="col-sm-8 col-md-10">
                            <input class="k-textbox" name="email" id="email" type="email" data-bind="value:email"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="phone" id="skills_label">手机号码</label>
                        <div class="col-sm-8 col-md-10">
                            <input class="k-textbox" name="phone" id="phone" type="text" data-bind="value:phone"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="mobile">电话号码</label>
                        <div class="col-sm-8 col-md-10">
                            <input class="k-textbox" name="mobile" id="mobile" type="text" data-bind="value:mobile"
                                   required>
                        </div>
                    </div>
                </div>
                <div class="buttons-wrap" style="border-top: 1px solid #e7e7e7;padding-top: .5em;text-align: center;">
                    <button class="k-button k-state-default" data-bind="click:save">保存</button>
                    <button class="k-button k-state-default" data-bind="click:close">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        其他通知
    </div>
</div>
</body>
</html>
