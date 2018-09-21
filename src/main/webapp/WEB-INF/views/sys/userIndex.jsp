<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/js/sys/userList.js"></script>
</head>
<body>
<div id="conditions" class="widget-box">
    <div class="widget-header widget-header-small">
        <h5 class="lighter">查询条件</h5>
    </div>
    <div class="widget-body">
        <div class="widget-main">
            <div class="row">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-1 control-label">登陆名</label>
                        <div class="col-md-2">
                            <input name="loginName" class="input-sm form-control" data-bind="value:loginName"/>
                        </div>
                        <label class="col-md-1 control-label">机构</label>
                        <div class="col-md-2">
                            <input name="comments" class="input-sm form-control" data-bind="value:comments"/>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-small btn-primary" data-bind="click:query">
                                <span class="glyphicon glyphicon-search"></span>查询
                            </button>
                            <button class="btn btn-small btn-primary" data-bind="click:clear">
                                <span class="glyphicon glyphicon-repeat"></span>重置
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="row" style="text-align: center">
                <button class="btn btn-primary" id="test">
                    <span class="glyphicon glyphicon-search"></span>查询
                </button>
                <button class="btn btn-primary">
                    <span class="glyphicon glyphicon-repeat"></span>重置
                </button>
            </div>--%>
        </div>
    </div>
</div>

<div id="grid"></div>

</body>
</html>
