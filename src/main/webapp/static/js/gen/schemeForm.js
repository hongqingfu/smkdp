var form;
$(document).ready(function () {
    var id = getQueryString("id");

    form = $("#conditions").kendoMEForm({
        enableValidate: true,
        flags:["page","entity","dao","service","controller"],
        packageName: "com.hqf.modules",
        genTableId: id,
        save: function () {
            console.log(form.getData());
            var data = form.getData();
            $.ajax({
                url: ctx + "/scheme/create",
                type: "post",
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                // async: false,
                success: function (data) {
                    if (data) {
                        form.setData(data)
                    } else {
                        alertx("no data")
                    }
                }
            });
        }
    }).data("kendoMEForm");

    // 加载数据
    $.ajax({
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
    });



    var $window = $("<div id='detail_window'></div>").appendTo($(document.body)).kendoMEWindow();

});

//格式化时间
if (Date) {
    Date.prototype.toISOString = function () {
        return kendo.toString(this, "yyyy-MM-dd HH:mm:ss");
    };
}