$(function() {

			$.ajax({
						url : "sys/menu/list",
						dataType : "JSON",
						success : function(res) {
							getLevelData(res, 0, 0);
							// $("#treegrid").jqGrid('clearGridData'); //清空表格
							// $("#treegrid").jqGrid('setGridParam',{ // 重新加载数据
							// datatype: "jsonstring",
							// datastr: treeData
							// }).trigger("reloadGrid");
							getTreeGrid();
						}
					});

			// 查询用户按钮
			$("#getUser").click(function() {
						reloadList();
					});

			// 添加用户按钮
			$("#saveUser").click(function() {
						clearPanel();
						getRoleList();
						showList(false, "添加用户");
					});
			// 修改用户
			$("#updateUser").click(function() {
						var userId = getSelectedRow();
						if (userId == null) {
							return;
						}
						clearPanel();
						getRoleList();
						getUserInfo(userId);
						showList(false, "修改用户信息");
					});

			// 删除用户
			$("#deleteMenu").click(function() {

						// deleteUser();
					});

			// 保存或修改确认
			$("#saveOrUpdate").click(function() {

						if (validator()) {
							return;
						}
						saveOrUpdate();
					});

			// 返回列表
			$("#returnList").click(function() {
						reloadList();
					});

		});

		var treeData = [];
function getTreeGrid() {
	$("#treegrid").jqGrid({
		// url: "data.json",
		datatype : "jsonstring",
		datastr : treeData,
		colModel : [
				{ label : "菜单ID", name : 'menuId', index : 'menuId', width : 80, key : true }, 
				{ label : "菜单名称", name : 'name', width : 160 },
				{ label : "父菜单", name : 'parentName', width : 100, align : "center" },
				{
					label : "图标",
					name : 'icon',
					width : 100
				}, {
					label : "类型",
					name : 'type',
					width : 60,
					align : "center"
				}, {
					label : "序号",
					name : 'orderNum',
					width : 60,
					align : "center"
				}, {
					label : "URL",
					name : 'url',
					width : 180
				}, {
					label : "授权",
					name : 'perms',
					width : 180
				}],
		hoverrows : false,
		viewrecords : false,
		gridview : true,
		height : "auto",
		sortname : "menuId",
		treeGrid : true,
		ExpandColumn : "name",
		treedatatype : "local",
		// treeGridModel: "nested",
		treeGridModel : "adjacency",
		loadonce : true,
		// configuration of the data comming from server
		treeReader : {
			parent_id_field : "parentId",
			level_field : "level",
			leaf_field : "isLeaf",
			expanded_field : "expanded",
			loaded : "loaded",
			icon_field:"xicon"
		}

	});
}
function getLevelData(rows,menuId,lv) {
	var level = lv;
	$.each(rows, function(index, item) {
		if(item.parentId==menuId){
			var isLeaf = false;
			$.each(rows, function(i, c) {
				if (item.menuId == c.parentId) {
					isLeaf = false;
					return false;
				}
				isLeaf = true;
			});
			item.level = level;
			item.isLeaf = isLeaf;
			item.expanded = false;
			item.loaded = true;
			treeData.push(item);
			getLevelData(rows,item.menuId,level+1)
		} 
	});
}

// 判断是否有用户名（插入还是更新）
var mUserId = null;

// -----------------
// 获取指定用户ID信息
function getUserInfo(userId) {
	$.get("sys/user/info/" + userId, function(res) {
				var parsed = jQuery.parseJSON(res);
				var user = parsed.user;
				$("#userName").val(user.userName);
				$("#email").val(user.email);
				$("#mobile").val(user.mobile);
				$("input[name=status][value=" + user.status + "]").prop(
						"checked", true);
				$.each(user.roleIdList, function(index, roleId) {
							$("input[name=roleStatus][value=" + roleId + "]")
									.prop("checked", true);
						});

				mUserId = user.userId;
			});
}

// 请求角色列表
function getRoleList() {
	$.get("sys/role/select", function(res) {
		var parsedJson = jQuery.parseJSON(res);
		var html = "";
		$.each(parsedJson.list, function(index, role) {
			html += "<label class='checkbox-inline'><input type='checkbox' name='roleStatus' value="
					+ role.roleId + ">" + role.roleName + "</label>";
		});
		$("#roleList").append(html);
	});
}

// 新增或者修改用户
function saveOrUpdate() {
	var url = mUserId == null ? "sys/user/save" : "sys/user/update";
	var userInfo = getPanelInfo();
	userInfo.userId = mUserId;

	$.ajax({
				type : "POST",
				url : url,
				contentType : "application/json",
				data : JSON.stringify(userInfo),
				success : function(res) {

					var parsed = jQuery.parseJSON(res);

					if (parsed.code === 0) {
						alert("操作成功");
						reloadList();
					} else {
						alert(parsed.msg);
					}
				}
			});
}

// 删除用户
function deleteUser() {

	var userIds = getSelectedRows();
	if (userIds == null) {
		return;
	}
	var ret = confirm("确定删除 " + userIds.length + "条用户信息?");
	if (ret == true) {
		$.ajax({
			type : "POST",
			url : "sys/user/delete",
			dataType : "JSON",
			data : JSON.stringify(userIds),
			success : function(res) {
				var parsed = jQuery.parseJSON(res);

				if (parsed.code === 0) {
					alert("删除成功");
					reloadList();
				} else {
					alert(parsed.msg);
				}
			}
		});
	}
}

// -----------------
// 获取编辑界面用户的信息
function getPanelInfo() {

	var userInfo = {
		roleIdList : []
	};
	userInfo.userName = $("#userName").val();
	userInfo.password = $("#password").val();
	userInfo.email = $("#email").val();
	userInfo.mobile = $("#mobile").val();
	userInfo.status = Number($("input[name='status']:checked").val());
	$('input[name=roleStatus]:checked').each(function() {
				userInfo.roleIdList.push(Number($(this).val()));
			});
	return userInfo;
}

// 清空编辑界信息
function clearPanel() {
	$("#userName").val("");
	$("#password").val("");
	$("#email").val("");
	$("#mobile").val("");
	$("#roleList").empty();
	mUserId = null;
	$("input[name=status][value=1]").prop("checked", true);
}

// 重新加载表格
function reloadList() {
	showList(true);
	var page = $("#jqGrid").jqGrid('getGridParam', 'page');
	$("#jqGrid").jqGrid('setGridParam', {
				postData : {
					'searchName' : $("#searchName").val()
				},
				page : page
			}).trigger("reloadGrid");

	$("#jqGrid").setGridWidth($(window).width());
}

// 显示列表或者编辑界面
function showList(show, title) {
	$("#user-title").text(title);
	if (show) {
		$("#user-list").show();
		$("#user-information").hide();
	} else {
		$("#user-list").hide();
		$("#user-information").show();
	}
}

// 验证(demo)
function validator() {

	if ($("#userName").val().length == 0) {
		alert("用户名不能为空");
		return true;
	}

	if (mUserId == null && $("#password").val().length == 0) {
		alert("密码不能为空");
		return true;
	}

	if ($("#email").val().length == 0) {
		alert("邮箱不能为空");
		return true;
	}

}
