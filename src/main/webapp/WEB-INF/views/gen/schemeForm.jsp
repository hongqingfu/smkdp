<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>生成方案设置</title>
    <meta name="decorator" content="blank"/>
    <script type="text/javascript" src="${ctxStatic}/js/generator/schemeForm.js"></script>
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
            <%--<div class="form-group">
                <label class="col-md-3 control-label">项目路径:</label>
                <div class="col-md-7">
                    <input name="projectPath" class="input-sm form-control" data-bind="value:projectPath"/>
                </div>
            </div>--%>
           <%-- <div class="form-group">
                <label class="col-md-3 control-label">代码分层风格:</label>
                <div class="col-md-7">
                    <input name="packageStyle" class="input-sm form-control" data-bind="value:packageStyle"/>
                    <!--<option value="service">业务分层</option>
							<option value="project">代码分层</option>-->
                </div>
            </div>--%>
            <div class="form-group">
                <label class="col-md-3 control-label">表名:</label>
                <div class="col-md-7">
                    <input name="tableName" class="input-sm form-control" data-bind="value:name"/>
                    <input name="genTableId" type="hidden" class="input-sm form-control" data-bind="value:genTableId"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">生成功能描述:</label>
                <div class="col-md-7">
                    <input name="description" class="input-sm form-control" data-bind="value:comments"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">代码基础包:</label>
                <div class="col-md-7">
                    <input name="sourceBasePackage" class="input-sm form-control" placeholder="com.hqf.modules"
                           data-bind="value:packageName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">模块名:</label>
                <div class="col-md-7">
                    <input name="moduleName" class="input-sm form-control" data-bind="value:moduleName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">页面目录:</label>
                <div class="col-md-7">
                    <input name="pagePath" class="input-sm form-control" placeholder="WEB-INF/views/test"
                           data-bind="value:pagePath"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">生成代码:</label>
                <div class="col-md-7">
                    <div class="checkbox-list">
                        <label class="checkbox-inline">
                            <input type="checkbox" value="page" data-bind="checked:flags"/>page
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="entity" data-bind="checked:flags"/>entity
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="dao" data-bind="checked:flags"/>dao
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="service" data-bind="checked:flags"/>service
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="controller" data-bind="checked:flags"/>controller
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">页面风格:</label>
                <div class="col-md-7">
                    <div class="input-icon right">
                        <select class="form-control" name="pageModel" required data-bind="value:pageModel">
                            <option value="default" selected>默认风格</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">作者:</label>
                <div class="col-md-7">
                    <div class="input-icon right">
                        <input type="text" class="form-control" name="author" required data-bind="value:author"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="grid"></div>
</div>
</body>
</html>
