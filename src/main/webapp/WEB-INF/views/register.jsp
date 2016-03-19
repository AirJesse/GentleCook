<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/app.css">
    <link rel="stylesheet" href="resources/css/bootstrapValidator.min.css">
    <style>
        #register-form {
            width: 500px;

        }
    </style>
</head>
<body>
<%@include file="pub/nav.jsp"%>
    <div class="container">
        <h3>用户注册：</h3>
        <form id="register-form"  class="form-horizontal center-block">
            <div class="form-group">
                <label class="col-sm-3 control-label" for="username">用户名</label>
                <div class="col-sm-9">
                    <input class="form-control" type="text" name="username" id="username" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="password">密码</label>
                <div class="col-sm-9">
                    <input class="form-control" type="password" name="password" id="password" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="ckpassword">再次输入密码</label>
                <div class="col-sm-9">
                    <input class="form-control" type="password" name="ckpassword" id="ckpassword" placeholder="再次输入密码">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="email">邮箱</label>
                <div class="col-sm-9">
                    <input class="form-control" type="text" name="email" id="email" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group " style="text-align: center;word-spacing: 20px">
                <button type="submit" class="btn btn-primary  btn-lg  " >注册</button>
                <button type="reset" class="btn btn-default btn-lg ">重置</button>
            </div>
        </form>
        <div class="alert alert-success text-center hidden">注册成功,正在跳转...</div>
    </div>





<%@include file="pub/footer.jsp"%>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrapValidator.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/app.js"></script>
<script>
    $(document).ready(function () {
        $("#register-form").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
            username:{
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 20,
                        message: '长度必须处于4-20个字符质检'
                    },
//                    regexp: {
//                        regexp: /^[a-zA-Z0-9_]+$/,
//                        message: '只能使用字母数字和下划线'
//                    },
                    callback:{
                        message:'用户名已被占用',
                        callback:function(value){
                            var res = true;
                            if(value.match(/^[a-zA-Z0-9_]+$/) && value.length>=4) {
                                $.ajax({
                                    url: "register/checkusername.pub",
                                    type: 'post',
                                    dataType: 'json',
                                    async: false,
                                    data: {username: value},
                                    success: function (data) {
                                        if (data.status == 'success') {
                                            res = false;
                                        }
                                    }
                                });
                            }
                            return res;
                        }
                    }
                }
                },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '长度必须处于6-20个字符质检'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '只能使用字母数字和下划线'
                    }
                }
            },
            ckpassword:{
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '长度必须处于6-20个字符质检'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '只能使用字母数字和下划线'
                    },
                    callback:{
                        message:'两次输入的密码不同',
                        callback:function(value){
                            if(value == $("#password").val()){
                                return true;
                            }else{
                                return false;
                            }
                        }
                    }
                }


            }
            }
        });
        $("#register-form").submit(function(e){
            e.preventDefault();
            $(this).ajaxSubmit({
                url:"register.pub",
                type:'post',
                success:function(data){
                    console.log(data);
                    $('.alert').removeClass('hidden');
                    setTimeout(function(){
                        location.href = "login";
                    },2000);
                }

            })
            return false;
        });

    });
</script>
</body>
</html>