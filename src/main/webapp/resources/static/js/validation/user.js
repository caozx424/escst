
var userAddValidation = function () {
    return {
        init: function (contextPath) {
            var form = $("#add_form");
            var error1 = $('.alert-error', form);
            var success1 = $('.alert-success', form);

            //检测手机号是否正确
            $.validator.addMethod("isMobile", function(value, element) {
                var length = value.length;
                var regPhone = /^1([3578]\d|4[57])\d{8}$/;
                return this.optional(element) || ( length == 11 && regPhone.test( value ) );
            }, "请正确填写您的手机号码");

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                //onfocusout: false,//焦点离开时验证（单选/复选按钮除外）。如果表单中没有输入任何内容，所有的规则将被跳过，除非该表单已经被标记为无效的
                focusInvalid: false, // do not focus the last invalid input
                onkeyup: false,
                rules:{
                    username:{
                        required:true,
                        minlength:2,
                        remote:{
                            type:"post",
                            url:contextPath+"/user/checkUsername",
                            data:{
                                username:function(){
                                    return $("#username").val();
                                }
                            },
                            dataFilter:function(data,type){
                                if(data=="true"){
                                    return true;
                                }else{
                                    return false;
                                }
                            }
                        }
                    },
                    realname:{
                        required:true,
                        minlength:2
                    },
                    password:{
                        required:true,
                        minlength:6
                    },
                    repassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#password"
                    },
                    mobile:{
                        required:true,
                        isMobile:true
                    },
                    belong_Province:{
                        required:true
                    },
                    belong_City:{
                        required:true
                    },
                    belong_Area:{
                        required:true
                    },
                    role_ids:{
                        required:true
                    },
                    email: {
                        required: true,
                        email:true
                    }
                },
                messages: {
                    username: {
                        required:"请填写用户名",
                        minlength:"至少2个字符",
                        remote:"该用户名已存在！"
                    },
                    realname:{
                        required:"请填写真实姓名",
                        minlength:"至少2个字符"
                    },
                    password: {
                        required: "请输入密码",
                        minlength: "密码不能少于6个字符"
                    },
                    repassword: {
                        required: "请输入确认密码",
                        minlength: "确认密码不能少于6个字符",
                        equalTo: "密码输入不一致"
                    },
                    mobile:{
                        required:"请输入手机号码"
                    },
                    belong_Province:{
                        required:"请输入省份"
                    },
                    belong_City:{
                        required:"请输入城市"
                    },
                    belong_Area:{
                        required:"请输入区县"
                    },
                    role_ids:{
                        required:"请输入角色"
                    },
                    email:{
                        required:"请输入一个邮件地址",
                        email:"email地址不正确"
                    }

                },
                submitHandler:function(form){
                    form.submit();
                }

            });

        }
    };

}();