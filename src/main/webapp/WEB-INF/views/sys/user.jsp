<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


<base href="<%=basePath%>">
<title>管理员列表</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="static/css/font-awesome.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/css/_all-skins.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body>

	<div>
		<div class="grid-btn">
			<div class="form-group col-sm-2">
				<input type="text" class="form-control" placeholder="用户名">
			</div>
			<a class="btn btn-default btn-flat" onclick="query">查询</a>
			<shiro:hasPermission name="sys:user:save">
				<a class="btn btn-primary btn-flat" onclick="add"><i class="fa fa-plus"></i>&nbsp;新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:user:update">
				<a class="btn btn-primary btn-flat" onclick="update"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:user:delete">
				<a class="btn btn-primary btn-flat" onclick="del"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
			</shiro:hasPermission>
		</div>
    </div>













	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
	<script src="static/libs/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="static/libs/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="static/libs/adminlte.min.js"></script>
</body>
</html>