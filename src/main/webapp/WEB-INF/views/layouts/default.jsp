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
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/site.css"/>

    <script type="text/javascript" src="${ctxStatic}/kendo/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/kendo/js/kendo.all.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/kendo/js/cultures/kendo.culture.zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/common/web_common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/me/MEWidget.js"></script>

    <sitemesh:head/>
</head>
<body>
<div class="header-panel">
    <div class="navbar-header">
        <img style="height: 45px;" src="img/logo.png" >
        <span id="navbar-header-project" style="color:#fff; font-size:23px;vertical-align:middle;margin-right:6px;">XXX管理系统</span>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            <li class="navbar-item dropdown-parent" id="main-dropdown">
                <div class="navbar-header-menu-container dropdown-toggle">
                    <span class="float-clear-helper"></span>
                    <a href=""><img class="navbar-header-menu-icon" title="主页" src=""></a>
                </div>
            </li>
            <li class="navbar-item dropdown-parent" id="setting-dropdown">
                <span style="float: right; padding-right: 20px; line-height: 50px; color: #ffffff">
                    当前用户：系统管理员
                    <button class="btn btn-small btn-primary" id="logout">注销</button>                </span>
            </li>
        </ul>
    </div>
</div>
<div id="main-panel">
    <div id="main-splider">
        <div id="left-panel">
            <div id="menu"></div>
        </div>
        <div id="content-panel">
            <div class="container-fluid">
                <sitemesh:body/>
            </div>
        </div>

    </div>

</div>
<script>
    $(document).ready(function () {
        $("#main-splider").kendoSplitter({
            panes: [
                { collapsible: true, max: "20%",size: "15%" },
                { collapsible: false}
            ]
        });


        /****************************菜单**************************************/
        var homogeneous = new kendo.data.HierarchicalDataSource({
            transport: {
                read: {
                    url: ctx + "/sys/menus",
                    dataType: "json"
                }
            },
            schema: {
                model: {
                    id: "id",
                    hasChildren: function (dataItem) {
                        if (dataItem.hasChildren == 0) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                }
            }
        });

//        $("#menu-panelbar").kendoPanelBar({
//            dataSource: homogeneous,
//            template: function (dataItem) {
//                if (!dataItem.item.hasChildren) {
//                    var href = window.location.origin + "/" + dataItem.item.href;
//                    var a = "<a href='" + href +"'>" + dataItem.item.name + "</a>";
//                    return a;
//                } else {
//                    return dataItem.item.name
//                }
//            },
//            dataTextField: "name"
//        });
        $("#menu").kendoMEMenu();
    });
</script>
</body>
</html>