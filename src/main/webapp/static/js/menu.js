$(function() {
	
	reloadMenuList();
	getTreeGrid();

	// 查询菜单按钮
	$("#searchMenu").click(function() {
		//reloadMenuList();
	});

	// 添加菜单按钮
	$("#saveMenu").click(function() {
		clearPanel();
		showList(false, "新增菜单");
	});
	// 修改用户
	$("#updateMenu").click(function() {
		var menuId = getSelectedRow();
		if (menuId == null) {
			return;
		}
		clearPanel();
		getMenuInfo(menuId);
		showList(false, "修改菜单");
	});

	// 删除用户
	$("#deleteMenu").click(function() {

		deleteMenu();
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
		reloadMenuList();
		showList(true);
	});
	
	

});

var treeData = [];

//加载菜单列表并按照规则整理数据
function reloadMenuList() {
	
	treeData=[];
	$("#jqGrid").jqGrid('clearGridData'); //清空表格
	
	$.ajax({
		url : "sys/menu/list",
		dataType : "JSON",
		success : function(res) {
			getLevelData(res, 0, 0);
			
			$("#jqGrid").jqGrid('setGridParam',{ // 重新加载数据
			 	datastr: treeData,
			 	treedatatype : "jsonstring"
			}).trigger("reloadGrid");
		}
	});
}

//加载获取后的数据到jqgrid
function getTreeGrid() {
	$("#jqGrid").jqGrid({
		//url: "sys/menu/list",
		datatype : "jsonstring",
		datastr : treeData,
		colModel : [
				{ label : "菜单ID", name : 'menuId', index : 'menuId', width : 50, key : true }, 
				{ label : "菜单名称", name : 'name', width : 120 },
				{ label : "父菜单", name : 'parentName', width : 60, align : "center" },
				{ label : "图标", name : 'icon', width : 40, align : 'center', formatter : function(value, options, row){
					return value == null ? '' : '<i class = "' + value +'">';
				}},
				{ label : "类型", name : 'type', width : 60, align : "center" ,formatter:function(value, options, row){
					
					if (value === 0) {
						return '<sapn class="label label-primary">目录</span>';
					}  
					if (value === 1) {
						return '<sapn class="label label-success">菜单</span>';
					}
					if (value === 2) {
						return '<sapn class="label label-warning">按钮</span>';
					}
				}}, 
				{ label : "序号", name : 'orderNum', width : 50, align : "center" }, 
				{ label : "URL", name : 'url', width : 120 }, 
				{ label : "授权", name : 'perms', width : 180}
		],
		hoverrows : false,
		viewrecords : false,
		gridview : true,
		height : "auto",
        autowidth:true,
		sortname : "menuId",
		treeGrid : true,
		ExpandColumn : "name",
		treedatatype : "local",
		// treeGridModel: "nested",
		treeGridModel : "adjacency",
		loadonce : true,
		treeReader : {
			parent_id_field : "parentId",
			level_field : "level",
			leaf_field : "isLeaf",
			expanded_field : "expanded",
			loaded : "loaded",
			icon_field:"xicon"
		},
        loadComplete: function(xhr){
        	
        },
        gridComplete:function(){
        	//加载完毕调用				
        }
//		treeIcons : {
//			plus: "ui-icon-circlesmall-plus",
//			minus: "ui-icon-circlesmall-minus",
//			leaf : ""
//		}

	});
	
}


//递归数组，排序生成符合treegrid要求的格式（暂时解决，效率问题，以后修改 思路：生成等级数组or遍历减去父节点）
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
var mMenuId = null;

// -----------------
// 获取指定菜单ID信息
function getMenuInfo(menuId) {
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
	$("input[name=menuType][value=0]").prop("checked", true);
}


// 显示列表或者编辑界面
function showList(show, title) {
	$("#menu-title").text(title);
	if (show) {
		$("#menu-list").show();
		$("#menu-information").hide();
	} else {
		$("#menu-list").hide();
		$("#menu-information").show();
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
