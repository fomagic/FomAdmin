$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/user/list',
        datatype: "json",
        colModel: [			
			{ label: '用户ID', name: 'userId', index: "user_id", width: 35, key: true },
			{ label: '用户名', name: 'userName', width: 75 },
			{ label: '邮箱', name: 'email', width: 90 },
			{ label: '手机号', name: 'mobile', width: 90 },
			{ label: '状态', name: 'status', width: 40, align:"center",formatter: function(value, options, row){
				return value === 0 ? 
					'<span class="label label-danger ">禁用</span>' : 
					'<span class="label label-success">正常</span>';
			}},
			{ label: '创建时间', name: 'createTime', index: "create_time", width: 80}
        ],
		viewrecords: true,
        height: 'auto',
        rowNum: 10,
		rowList : [10,30,50,100],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
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
        loadComplete: function(xhr){
        	//数据请求完成
        	//alert(JSON.stringify(xhr));
        },
        gridComplete:function(){
        	
        	//加载完毕调用
        }
    });
    
    //查询用户按钮
    $("#getUser").click(function(){
    	reloadList();
    });
    
    //添加用户按钮
    $("#saveUser").click(function(){
    	clearPanel();
    	getRoleList();
    	showList(false,"添加用户");
    });
    //修改用户
    $("#updateUser").click(function(){
    	var userId = getSelectedRow();
    	if (userId == null) {
    		return;
    	}
    	clearPanel();
    	getRoleList();
    	getUserInfo(userId);
    	showList(false,"修改用户信息");
    });
    
    //删除用户
    $("#deleteUser").click(function(){
    	
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

//判断是否有用户名（插入还是更新）
var mUserId = null;

//-----------------
//获取指定用户ID信息
function getUserInfo(userId){
	$.get("sys/user/info/"+userId,function(res){
		var parsed = jQuery.parseJSON(res);
		var user = parsed.user;
		$("#userName").val(user.userName);
		$("#email").val(user.email);
		$("#mobile").val(user.mobile);
		$("input[name=status][value="+user.status+"]").prop("checked",true);
		$.each(user.roleIdList,function(index,roleId){
			$("input[name=roleStatus][value="+roleId+"]").prop("checked",true);
		});
		
		mUserId = user.userId;
	});
}

//请求角色列表
function getRoleList(){
	$.get("sys/role/select",function(res){
		var parsedJson = jQuery.parseJSON(res);
		var html="";
		$.each(parsedJson.list,function(index,role){
			html+="<label class='checkbox-inline'><input type='checkbox' name='roleStatus' value="+ role.roleId +">"+role.roleName+"</label>";
		});
		$("#roleList").append(html);
	});
}

//新增或者修改用户
function saveOrUpdate(){
	var url = mUserId == null ? "sys/user/save" : "sys/user/update";
	var userInfo = getPanelInfo();
	userInfo.userId = mUserId;
	
	$.ajax({
		type:"POST",
		url:url,
		contentType : "application/json",
		dataType: "json",
		data: JSON.stringify(userInfo),
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

//删除用户
function deleteUser(){
	
	var userIds = getSelectedRows();
	if (userIds == null) {
		return;
	}
	var ret = confirm("确定删除 "+userIds.length+ "条用户信息?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/user/delete",
			contentType : "application/json",
			dataType: "json",
			data: JSON.stringify(userIds),
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
//获取编辑界面用户的信息
function getPanelInfo(){
	
	var userInfo = {roleIdList:[]};
	userInfo.userName = $("#userName").val();
	userInfo.password = $("#password").val();
	userInfo.email = $("#email").val();
	userInfo.mobile = $("#mobile").val();
	userInfo.status = Number($("input[name='status']:checked").val());
	$('input[name=roleStatus]:checked').each(function(){ 
		userInfo.roleIdList.push(Number($(this).val()));
	}); 
	return userInfo;
}

//清空编辑界信息
function clearPanel(){
	$("#userName").val("");
	$("#password").val("");
	$("#email").val("");
	$("#mobile").val("");
	$("#roleList").empty();
	mUserId = null;
	$("input[name=status][value=1]").prop("checked",true); 
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
	$("#user-title").text(title);
	if (show) {
		$("#user-list").show();
		$("#user-information").hide();
	} else {
		$("#user-list").hide();
		$("#user-information").show();
	}
}

//验证(demo)
function validator(){
	
	if ($("#userName").val().length==0){
		alert("用户名不能为空");
		//myAlert("用户名不能为空");
		return true;
	}
	
	if (mUserId == null && $("#password").val().length==0) {
		alert("密码不能为空");
		return true;
	}
	
	if ($("#email").val().length==0) {
		alert("邮箱不能为空");
		return true;
	}
	
}


