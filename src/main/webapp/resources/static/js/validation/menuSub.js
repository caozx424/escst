/**
 * Created by yb on 2016/9/13
 */
var menuSubValidation = function () {
    return {
        init: function (contextPath) {
            var form = $('#menuSubForm');
            var error1 = $('.alert-error', form);
            var success1 = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                //onfocusout: false,//焦点离开时验证（单选/复选按钮除外）。如果表单中没有输入任何内容，所有的规则将被跳过，除非该表单已经被标记为无效的
                focusInvalid: false, // do not focus the last invalid input
                onkeyup: false,
                rules: {
                    menuName: {
                        required: true
                    },parentMenuId: {
                        required: true
                    },menuOrder: {
                        required: true
                    }
                },
                messages:{
                    menuName:{
                        required:"请填写菜单名称"
                    },parentMenuId:{
                        required: "请选择父菜单"
                    },menuOrder:{
                        required: "请填写菜单顺序"
                    }
                },
                submitHandler:function(form){
                    form.submit();
                }

            });

        }
    };

}();