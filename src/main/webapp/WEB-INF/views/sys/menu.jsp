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
<!-- free-jqGrid -->
<link rel="stylesheet" href="static/plugins/free-jqgrid/css/ui.jqgrid.css">
<link rel="stylesheet" href="static/plugins/free-jqgrid/css/ui.jqgrid.bootstrap.css">
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

	<div id="menu-list">
		<div class="grid-btn row">
			<div class="form-group col-sm-4 pull-right text-right">
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
		</div>
		<table id="jqGrid"></table>
	</div>


	<div class="panel panel-default div-display-none" id="menu-information">
		<div class="panel-heading" id="menu-title">菜单</div>
		<div class="panel-body">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">类型</label>
					<div class="col-sm-10">
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = 0 >目录
						</label>
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = 1 >菜单
						</label>
						<label class="radio-inline">
							<input type="radio" name = "menuType" value = 2 >按钮
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
						<input type="text" class="form-control" name="parentName" placeholder="默认为一级菜单,请选择" id="parentName" readonly >
					</div>
				</div>
				<div class="form-group" id="div-menu-url">
					<label class="col-sm-2 control-label">菜单URL</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="url" placeholder="菜单URL" id="menuURL">
					</div>
				</div>
				<div class="form-group"  id="div-menu-perms">
					<label class="col-sm-2 control-label">授权标识</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="perms" placeholder="多个逗号分割：user:list,user:update" id="perms">
					</div>
				</div>
				<div class="form-group"  id="div-menu-order">
					<label class="col-sm-2 control-label">序号</label>
					<div class="col-sm-4">
						<input type="number" class="form-control" value=0 name="orderNum" id="orderNum">
					</div>
				</div>
				<div class="form-group" id="div-menu-icon">
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
	
	<div class="modal fade" tabindex="-1" role="dialog" id="showMenuList">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
					<h4 class="modal-title">选择菜单</h4>
				</div>
				<div class="modal-body">
					<ul id="menuTree" class="ztree"></ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-flat" id="selectMenu">确定</button>
				</div>
			</div>
		</div>
	</div>



	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
	<script src="static/libs/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="static/libs/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="static/libs/adminlte.min.js"></script>

	<!-- free-jqGrid -->
	<script src="static/plugins/free-jqgrid/js/jquery.jqgrid.src.js"></script>
	<script src="static/plugins/free-jqgrid/js/grid.locale-cn.js"></script>

	<!-- zTree -->
	<script src="static/plugins/zTree/js/jquery.ztree.all.js"></script>
	
	<!-- Owner  -->
	<script src="static/js/common.js"></script>
	<script src="static/js/sys/menu.js"></script>
</body>
</html>