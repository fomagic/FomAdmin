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
<title>菜单管理</title>

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

	<div id="menu-list">
		<div class="grid-btn">
			<div class="form-group col-sm-3">
				<div class="input-group ">
					<input type="text" class="form-control" id="searchName" placeholder="菜单名称"> <span class="input-group-btn">
						<button class="btn btn-default form-control" type="button" id="searchMenu">查询</button>
					</span>
				</div>
			</div>
			<shiro:hasPermission name="sys:menu:save">
				<a class="btn btn-primary btn-flat" id="saveMenu"><i class="fa fa-plus"></i>&nbsp;新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:menu:update">
				<a class="btn btn-primary btn-flat" id="updateMenu"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:menu:delete">
				<a class="btn btn-primary btn-flat" id="deleteMenu"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
			</shiro:hasPermission>
		</div>
		<table id="jqGrid"></table>
	</div>

	

	<div class="panel panel-default div-display-none" id="menu-information">
		<div class="panel-heading" id="menu-title">菜单</div>
		<div class="panel-body">
			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">类型</label>
					<div class="col-sm-10">
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = "0" >目录
						</label>
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = "1" >菜单
						</label>
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = "2" >按钮
						</label>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">名称</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="menuName" placeholder="菜单或按钮名称" id="menuName" >
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">上级菜单</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="parentId" placeholder="默认为一级菜单" id="parentId" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">菜单URL</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="url" placeholder="菜单URL" id="menuURL">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">授权标识</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="perms" placeholder="多个逗号分割：user:list,user:update" id="perms">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">序号</label>
					<div class="col-sm-4">
						<input type="number" class="form-control" value=0 name="orderNum" id="orderNum">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">图标</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="icon" id="icon">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-4">
						<input type="button" class="btn btn-primary btn-flat" value="确定"
							id="saveOrUpdate" /> <input type="button"
							class="btn btn-warning btn-flat pull-right" value="返回"
							id="returnList" />
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
	<script src="static/plugins/jqGrid/js/jquery.jqGrid.js"></script>

	<!-- Owner  -->
	<script src="static/js/common.js"></script>
	<script src="static/js/menu.js"></script>
</body>
</html>