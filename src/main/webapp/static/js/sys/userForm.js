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
                    form.setData(data)
                } else {
                    alertx("系统错误，请稍后重试")
                }
            }
        });
    }

    form = $("#conditions").kendoMEForm({
        enableValidate: true,
        save: function () {
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

    $("#files").kendoUpload({
        validation: {
            allowedExtensions: [".jpg", ".jpeg", ".png", ".bmp", ".gif"]
        },
        success: onSuccess,
        showFileList: true
    });

    function onSuccess(e) {
        alert(123);
    }

});

//格式化时间
if (Date) {
    Date.prototype.toISOString = function () {
        return kendo.toString(this, "yyyy-MM-dd HH:mm:ss");
    };
}