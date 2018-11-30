var form;
$(document).ready(function () {
    var id = getQueryString("id");
    console.log(id);

    if(id != "" && id != "undefined") {
        $.ajax({
            url: ctx + "/user/get?id=" + id,
            type: "post",
            dataType: "json",
            // async: false,
            success: function (data) {
                if (data) {
                    $("#pg").remove();
                    form.setData(data);
                } else {
                    alertx("系统错误，请稍后重试")
                }
            }
        });
    }

    form = $("#conditions").kendoMEForm({
        enableValidate: true,
        save: function () {
            console.log(typeof form.getData())
            if (form.validate()) {
                console.log(form.getData());
                var data = form.getData();
                $.ajax({
                    url: ctx + "/user/save",
                    type: "post",
                    dataType: "json",
                    data: data,
                    // contentType: "application/json",
                    // async: false,
                    success: function (data) {
                        console.log(data);
                        if (data.code == 500) {
                            alertx(data.message);
                        }
                        if (data.code == 200) {
                            alertx(data.message,function () {
                                window.parent.$("#detail_window").data("kendoMEWindow").close();
                            });
                        }

                    }
                });
            }
        },
        close: function () {
            window.parent.$("#detail_window").data("kendoMEWindow").close();
        }
    }).data("kendoMEForm");

    // 加载数据
    /*$.ajax({
        url: ctx + "/table/get?id=" + id,
        type: "post",
        dataType: "json",
        // async: false,
        success: function (data) {
            if (data) {
                form.setData(data)
            } else {
                alertx("no data")
            }
        }
    });*/


    var $window = $("<div id='detail_window'></div>").appendTo($(document.body)).kendoMEWindow();

    var company = $("#companyId").kendoDropDownList({
        autoBind: false,
        optionLabel: "请选择",
        filter: "contains",
        dataTextField: "name",
        dataValueField: "id",
        valuePrimitive: true,
        dataSource: {
            transport: {
                read: ctx + "/office/officeList",
                // contentType: "application/json",
                dataType: "json"
            }
        },
        change: function (e) {
            office.dataSource.read({parentId: company.value()});
            office.select(0);
        }
    }).data("kendoDropDownList");

    var office = $("#officeId").kendoDropDownList({
        autoBind: false,
        optionLabel: "请选择",
        filter: "contains",
        dataTextField: "name",
        dataValueField: "id",
        valuePrimitive: true,
        dataSource: {
            transport: {
                read: ctx + "/office/officeList",
                // contentType: "application/json",
                dataType: "json"
            }
        }
    }).data("kendoDropDownList");

});

//格式化时间
// if (Date) {
//     Date.prototype.toISOString = function () {
//         return kendo.toString(this, "yyyy-MM-dd HH:mm:ss");
//     };
// }