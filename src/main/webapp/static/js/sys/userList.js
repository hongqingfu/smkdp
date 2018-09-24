$(document).ready(function () {

    form = $("#conditions").kendoMEForm({
        enableValidate: true,
        query: function () {
            console.log(form.getData())
            grid.dataSource.read(form.getData())
        },
        clear: function () {
            form.clear();
        },
        add: function () {
            $window.data("kendoMEWindow").openUrl(ctx + "/user/form?id=");
        },
        delete: function (id) {
            console.log(id);
            if (id != "undefined" && id != "") {
                confirmx("确认删除？", function () {
                    $.ajax({
                        url: ctx + "/user/delete",
                        type: "post",
                        dataType: "json",
                        data: {id: id},
                        // contentType: "application/json",
                        // async: false,
                        success: function (data) {
                            if(data.code == 200) {
                                alertx(data.message,function () {
                                    grid.dataSource.read();
                                });
                            } else {
                                alertx(data.message);
                            }

                        }
                    });
                });
            }
        },
        update: function (id) {
            if(id != "undefined" && id != "") {
                $window.data("kendoMEWindow").openUrl(ctx + "/user/form?id=" + id);
            }
        }
    }).data("kendoMEForm");

    var $window = $("<div id='detail_window'></div>").appendTo($(document.body)).kendoMEWindow({
        width: 100
    });

    var grid = $("#grid").kendoMEGrid({
        dataSource: {
            transport: {
                read: {
                    url: ctx + "/user/list",
                    type: "post"
                },
                update: {
                    url: ctx + "/user/save",
                    type: "post",
                    dataType: "json"
                },
                destroy: {
                    url: ctx + "/user/delete",
                    type: "post",
                    dataType: "json"
                },
                create: {
                    url: ctx + "/user/save",
                    type: "post",
                    dataType: "json"
                }
            },
            schema: {
                model: {
                    id: "id",
                    fields: {}
                }
            }
        },
        sortable: true,
        height: document.documentElement.clientHeight - (70 + $("#conditions").height()),
        toolbar: [{template: '<a class="k-button k-button-icontext k-grid-add"  onclick="return form.data.add()"><span class="k-icon k-i-plus"></span>新增</a>'}],
        columns: [
            {
                field: "loginName",
                title: "用户名"
            },
            {
                field: "name",
                title: "名称"
            },
            {
                field: "no",
                title: "工号"
            },
            {
                field: "company.name",
                title: "公司"
            },
            {
                field: "office.name",
                title: "部门"
            },
            {
                field: "mobile",
                title: "手机号码"
            },
            {
                field: "email",
                title: "邮箱"
            },
            {
                command: [{
                    name: "edit", text:"修改",
                    click: function (e) {
                        e.preventDefault();
                        var tr = $(e.target).closest("tr"); // get the current table row (tr)
                        var data = this.dataItem(tr);
                        form.data.update(data.id);
                    }
                }, {
                    name: "del",
                    iconClass: "k-icon k-i-delete",
                    text: "删除",
                    click: function (e) {
                        e.preventDefault();
                        var tr = $(e.target).closest("tr"); // get the current table row (tr)
                        var data = this.dataItem(tr);
                        form.data.delete(data.id);
                    }
                }],
                title: "操作",
                width: "220px"
            }
        ]
    }).data("kendoMEGrid");
});

//格式化时间
if (Date) {
    Date.prototype.toISOString = function () {
        return kendo.toString(this, "yyyy-MM-dd HH:mm:ss");
    };
}