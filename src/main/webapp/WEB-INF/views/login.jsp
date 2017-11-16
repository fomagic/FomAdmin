<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
<base href="<%=basePath%>">
<title>FOM登录界面</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="static/css/font-awesome.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/css/AdminLTE.min.css">
<link rel="stylesheet" href="static/css/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="login"><b>FOM</b>管理系统</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">登录后台</p>

			<form action="login" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="账号" name="userName"  value="${user.userName}">
					<span class="glyphicon glyphicon-envelope form-control-feedback" ></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="密码"  name="password"  value="${user.password}">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" name="rememberMe"> 记住我
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
					<!-- /.col -->
				</div>
				<div class="form-group has-error">
					<span class="help-block">${errMsg}</span>
				</div>

			</form>
			
			<!--<a href="#">忘记密码</a>&nbsp&nbsp&nbsp-->
			<!--<a href="register.html" class="text-center">注册</a>-->

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script src="static/js/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="static/js/bootstrap.min.js"></script>


</body>
</html>