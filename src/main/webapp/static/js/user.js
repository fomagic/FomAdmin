$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/user/list',
        datatype: "json",
        colModel: [			
			{ label: '用户ID', name: 'userId', index: "user_id", width: 30, key: true },
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
        gridComplete:function(){
        	//加载完毕调用
        }
    });
    
    //查询用户按钮
    $("#getUser").click(function(){
    	reloadList();
    });
    
    //添加用户按钮
    $("#insertUser").click(function(){
    	showList(false,"添加用户");
    	clearPanel();
    	$("input[name=status][value=1]").attr("checked",true); 
    	getRoleList();
    });
    //修改用户
    $("#updateUser").click(function(){
    	var userId = getSelectedRow();
    	if (userId == null) {
    		return;
    	}
    	showList(false,"修改用户信息");
    	clearPanel();
    	getRoleList();
    	getUserInfo(userId);
    });
    
    //删除用户
    $("#deleteUser").click(function(){
    
    });
    
    //保存或修改确认
    $("#saveOrUpdate").click(function(){
    
    });
    
    //返回列表
    $("#returnList").click(function(){
    	showList(true);
	   	$("#jqGrid").setGridWidth($(window).width());
    });
    
});



//-----------------

function getUserInfo(userId){
	$.get("sys/user/info/"+userId,function(result){
		var parsedJson = jQuery.parseJSON(result);
		var user = parsedJson.user;
		$("#userName").val(user.userName);
		$("#email").val(user.email);
		$("#mobile").val(user.mobile);
		$("input[name=status][value="+user.status+"]").attr("checked",true);
		$.each(user.roleIdList,function(index,roleId){
			$("#roleList input[value="+roleId+"]").attr("checked",true);
		});
	});
}

function getRoleList(){
	$.get("sys/role/select",function(result){
		var parsedJson = jQuery.parseJSON(result);
		var html="";
		$.each(parsedJson.list,function(index,role){
			html+="<label class='checkbox-inline'><input type='checkbox' value="+ role.roleId +">"+role.roleName+"</label>";
		});
		$("#roleList").append(html);
	});
}





//-----------------


function clearPanel(){
	$("#userName").val("");
	$("#password").val("");
	$("#email").val("");
	$("#mobile").val("");
	$("#roleList").empty();
}

function reloadList() {
	var page = $("#jqGrid").jqGrid('getGridParam','page');
	$("#jqGrid").jqGrid('setGridParam',{
		postData:{'searchName': $("#searchName").val()},
		page:page
	}).trigger("reloadGrid");
}


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


