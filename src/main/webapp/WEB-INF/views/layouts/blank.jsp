<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <script type="text/javascript">var ctx = '${ctx}', ctxStatic = '${ctxStatic}';</script>

    <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/kendo/styles/kendo.common.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/kendo/styles/kendo.common-bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/kendo/styles/kendo.bootstrap.min.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/web_common.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/commons.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/site.css"/>--%>

    <script type="text/javascript" src="${ctxStatic}/kendo/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/kendo/js/kendo.all.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/kendo/js/cultures/kendo.culture.zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/common/web_common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/me/MEWidget.js"></script>

    <sitemesh:head/>
</head>
<body>
<sitemesh:body/>
</body>

</html>

<style>
    html,
    body {
        background-color: #f5f5f5;
    }
    .form-group .k-widget, .form-group .k-textbox {
        width: 100%;
    }
</style>
