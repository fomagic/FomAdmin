
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


<base href="<%=basePath%>">
<title>角色管理</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="static/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="static/css/font-awesome.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="static/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
     folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/css/_all-skins.min.css">
<!-- jqGrid -->
<link rel="stylesheet" href="static/plugins/jqGrid/css/ui.jqgrid-bootstrap.css">
<!-- zTree -->
<link rel="stylesheet" href="static/plugins/zTree/css/metroStyle/metroStyle.css">

<!-- Owner -->
<link rel="stylesheet" href="static/css/main.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


</head>
<body>

	<div id="role-list">
		<div class="grid-btn row" >
			<div class="form-group col-sm-3" >
				<div class="input-group">
					<input type="text" class="form-control" id="searchName" placeholder="角色名称"> 
					<span class="input-group-btn">
						<button class="btn btn-default form-control" type="button" id="getRole">查询</button>
					</span>
				</div>
			</div>
			<div class="form-group col-sm-4  pull-right text-right">
				<shiro:hasPermission name="sys:role:save">
					<a class="btn btn-primary btn-flat" id="saveRole"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:role:update">
					<a class="btn btn-primary btn-flat" id="updateRole"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:role:delete">
					<a class="btn btn-primary btn-flat" id="deleteRole"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
				</shiro:hasPermission>
			</div>
		</div>
		<table id="jqGrid"></table>
		<div id="jqGridPager"></div>
	</div>



	<div class="panel panel-default  div-display-none" id="role-information">
		<div class="panel-heading" id="role-title">角色</div>
		<div class="panel-body">
			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">角色名称</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="rolename" placeholder="角色名称" id="roleName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">备注</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="roleremark" placeholder="备注" id="roleRemark" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">授权</label>
					<div class="col-sm-10">
						<ul id="menuTree" class="ztree"></ul>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-4">
						<input type="button" class="btn btn-primary btn-flat" value="确定" id="saveOrUpdate"/>
						<input type="button" class="btn btn-warning btn-flat pull-right" value="返回" id="returnList"/>
					</div>
				</div>
			</form>
		</div>

	</div>



	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
	<script src="static/libs/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="static/libs/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="static/libs/adminlte.min.js"></script>

	<!-- jqGrid -->
	<script src="static/plugins/jqGrid/js/grid.locale-cn.js"></script>
	<script src="static/plugins/jqGrid/js/jquery.jqGrid.min.js"></script>
	
	<!-- zTree -->
	<script src="static/plugins/zTree/js/jquery.ztree.all.js"></script>

	<!-- Owner  -->
	<script src="static/js/common.js"></script>
	<script src="static/js/role.js"></script>
</body>
</html>