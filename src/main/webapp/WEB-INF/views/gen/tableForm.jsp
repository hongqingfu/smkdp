<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>用户设置</title>
    <meta name="decorator" content="blank"/>
    <script type="text/javascript" src="${ctxStatic}/js/gen/tableForm.js"></script>
</head>
<body>
<div id="conditions" class="form-horizontal">
    <div class="form-group">
        <button class="btn btn-success" style="float:right;margin-right:5px"
                data-bind="click:submit,style:{display:pkid?'display':'none'}"><span
                class="glyphicon glyphicon-ok"></span>提交
        </button>
        <button class="btn btn-primary" style="float:right;margin-right:5px" data-bind="click:save" remove="approve"><span
                class="glyphicon glyphicon-floppy-disk"></span>暂存
        </button>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">表单配置</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-md-1 control-label">名称</label>
                <div class="col-md-2">
                    <input id="name" name="name" class="input-sm form-control" data-bind="value:name" readonly/>
                </div>
                <label class="col-md-1 control-label">类名</label>
                <div class="col-md-2">
                    <input id="className" name="className" class="input-sm form-control" data-bind="value:className" readonly/>
                </div>
                <label class="col-md-1 control-label">描述</label>
                <div class="col-md-2">
                    <input id="comments" name="comments" class="input-sm form-control" data-bind="value:comments" readonly/>
                </div>
            </div>
        </div>
    </div>
    <div id="grid"></div>
</div>
</body>
</html>
