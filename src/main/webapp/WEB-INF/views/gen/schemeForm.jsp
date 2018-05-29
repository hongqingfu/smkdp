<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>生成方案设置</title>
    <meta name="decorator" content="blank"/>
    <script type="text/javascript" src="${ctxStatic}/js/gen/schemeForm.js"></script>
</head>
<body>
<div id="conditions" class="form-horizontal">
    <div class="row">
        <button class="btn btn-success" style="float:right;margin-right:5px"
                data-bind="click:submit,style:{display:pkid?'display':'none'}"><span
                class="glyphicon glyphicon-ok"></span>提交
        </button>
        <button class="btn btn-primary" style="float:right;margin-right:5px" data-bind="click:save"
                remove="approve"><span
                class="glyphicon glyphicon-floppy-disk"></span>暂存
        </button>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">表单配置</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-md-7 control-label">方案名称:</label>
                <div class="col-md-7">
                    <input name="name" class="input-sm form-control" data-bind="value:name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">模板分类:</label>
                <div class="col-md-7">
                    <input name="category" class="input-sm form-control" data-bind="value:category"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成包路径:</label>
                <div class="col-md-7">
                    <input name="packageName" class="input-sm form-control" data-bind="value:packageName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成模块名:</label>
                <div class="col-md-7">
                    <input name="moduleName" class="input-sm form-control" data-bind="value:moduleName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成子模块名:</label>
                <div class="col-md-7">
                    <input name="subModuleName" class="input-sm form-control" data-bind="value:subModuleName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成功能描述:</label>
                <div class="col-md-7">
                    <input name="description" class="input-sm form-control" data-bind="value:comments"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成功能名:</label>
                <div class="col-md-7">
                    <input name="functionName" class="input-sm form-control" data-bind="value:functionName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">生成功能作者:</label>
                <div class="col-md-7">
                    <input name="functionAuthor" class="input-sm form-control" data-bind="value:functionAuthor"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-7 control-label">业务表名:</label>
                <div class="col-md-7">
                    <input name="tableName" class="input-sm form-control" data-bind="value:tableName"/>
                    <input name="genTableId" type="hidden" class="input-sm form-control" data-bind="value:genTableId"/>
                </div>
            </div>
        </div>
    </div>
    <div id="grid"></div>
</div>
</body>
</html>
