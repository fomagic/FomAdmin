//角色表格
$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/role/list',
        datatype: "json",
        colModel: [			
			{ label: '角色ID', name: 'roleId', index: "role_id", width: 35, key: true },
			{ label: '角色名称', name: 'roleName', index:"role_name", width: 75 },
			{ label: '备注', name: 'remark', width: 100 },
			{ label: '创建时间', name: 'createTime', index: "create_time", width: 80}
        ],
		viewrecords: true,
        height: 'auto',
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
		multiselectWidth: 28,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//加载完毕调用
        }
    });
    
    //查询角色按钮
    $("#getRole").click(function(){
    	reloadList();
    });
    
    //添加角色按钮
    $("#saveRole").click(function(){
    	clearPanel();
    	getMenuTree();
    	showList(false,"添加角色");
    });
    //修改角色
    $("#updateRole").click(function(){
    	var roleId = getSelectedRow();
    	if (roleId == null) {
    		return;
    	}
    	clearPanel();
    	getMenuTree();
    	getRoleInfo(roleId);
    	showList(false,"修改角色");
    });
    
    //删除角色
    $("#deleteRole").click(function(){
    	
    	deleteUser();
    });
    
    //保存或修改确认
    $("#saveOrUpdate").click(function(){
    	
	    if(validator()){
	    	return;
	    }
    	saveOrUpdate();
    });
    
    //返回列表
    $("#returnList").click(function(){
    	reloadList();
    });
    
    
});



//----------------
var zTree;
var setting = {
	check: {
		enable: true
	},
	data: {
		key:{
			url: "xUrl"
		},
		simpleData: {
			enable: true,
			idKey:"menuId",
			pIdKey:"parentId",
			rootPId:null
		}
	}
};


//-----------------

//判断是否有角色名（插入还是更新）
var mRoleId = null;


//请求菜单树
function getMenuTree() {
	$.get("sys/menu/list",function(res){
		var parsed = jQuery.parseJSON(res);
		zTree = $.fn.zTree.init($("#menuTree"), setting, parsed);
		zTree.expandAll(true);
	});
}


//获取指定角色ID信息
function getRoleInfo(roleId){
	$.get("sys/role/info/"+roleId,function(res){
		
		var parsed = jQuery.parseJSON(res);
		var role = parsed.role;
		$("#roleName").val(role.roleName);
		$("#roleRemark").val(role.remark);
		
		(role.menuIdList).forEach(function(value,index,array){
		    var node = zTree.getNodeByParam("menuId",value);
		    zTree.checkNode(node,true,false,false);
	    });
		
		mRoleId = role.roleId;
	});
}


//新增或者修改角色
function saveOrUpdate(){
	
	var url = mRoleId == null ? "sys/role/save" : "sys/role/update";
	var roleInfo = getPanelInfo();
	roleInfo.roleId = mRoleId;
	
	$.ajax({
		type:"POST",
		url:url,
		contentType:"application/json",
		dataType: "json",
		data: JSON.stringify(roleInfo),
		success: function(res) {
			
			if (res.code === 0) {
				alert("操作成功");
				reloadList();
			} else {
				alert(res.msg);
			}
		}
	});
}

//删除角色
function deleteUser(){
	
	var roleIds = getSelectedRows();
	if (roleIds == null) {
		return;
	}
	var ret = confirm("确定删除 "+roleIds.length+ "条角色信息?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/role/delete",
			contentType:"application/json",
			dataType: "json",
			data: JSON.stringify(roleIds),
			success:function(res){
			
    			if (res.code === 0) {
    				alert("删除成功");
    				reloadList();
    			} else {
    				alert(res.msg);
    			}
			}
		});
	}
}

//-----------------
//获取编辑界面角色的信息
function getPanelInfo(){
	var nodes = zTree.getCheckedNodes(true);
	var menuIdList = new Array();
	for (var i = 0; i < nodes.length; i++) {
		menuIdList.push(nodes[i].menuId);
	}
	
	var roleInfo = {menuIdList:[]};
	roleInfo.roleName = $("#roleName").val();
	roleInfo.remark = $("#roleRemark").val();
	roleInfo.menuIdList = menuIdList;
	return roleInfo;
}

//清空编辑界信息
function clearPanel(){
	$("#roleName").val("");
	$("#roleRemark").val("");
	if (zTree) {
		zTree.cancelSelectedNode();
	}
 	mRoleId = null;
}

//重新加载表格
function reloadList() {
	showList(true);
	var page = $("#jqGrid").jqGrid('getGridParam','page');
	$("#jqGrid").jqGrid('setGridParam',{
		postData:{'searchName': $("#searchName").val()},
		page:page
	}).trigger("reloadGrid");
	
	$("#jqGrid").setGridWidth($(window).width());
}

//显示列表或者编辑界面
function showList(show,title) {
	
	if (show) {
		$("#role-list").show();
		$("#role-information").hide();
	} else {
		$("#role-list").hide();
		$("#role-information").show();
		$("#role-title").text(title);
	}
}

//验证(demo)
function validator(){
	
	if ($("#roleName").val().length==0){
		alert("角色名不能为空");
		return true;
	}
	
}


