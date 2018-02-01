$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/schedule/list',
        datatype: "json",
        colModel: [			
			{ label: '任务ID', name: 'jobId',width: 35, key: true },
			{ label: 'bean名称', name: 'beanName', width: 75 },
			{ label: '方法名称', name: 'methodName', width: 75 },
			{ label: '参数', name: 'params', width: 75 },
			{ label: 'cron表达式', name: 'cronExpression', width: 90 },
			{ label: '备注', name: 'remark', width: 90 },
			{ label: '状态', name: 'status', width: 40, align: 'center', formatter: function(value, options, row){
				return value === 0 ? 
					'<span class="label label-success">正常</span>': 
					'<span class="label label-danger ">暂停</span>' ;
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
        loadComplete: function(xhr){
        	//数据请求完成
        	//alert(JSON.stringify(xhr));
        },
        gridComplete:function(){
        	
        	//加载完毕调用
        }
    });
    
    //查询
    $("#getSchedule").click(function(){
    	reloadList();
    });
    
    //添加
    $("#addSchedule").click(function(){
    	clearPanel();
    	showList(false,"添加任务");
    });
    //修改
    $("#updateSchedule").click(function(){
    	var jobId = getSelectedRow();
    	if (jobId == null) {
    		return;
    	}
    	clearPanel();
    	getScheduleInfo(jobId);
    	showList(false,"修改用任务");
    });
    
    //删除
    $("#deleteSchedule").click(function(){
    	deleteSchedule();
    });
    
    //暂停
    $("#pauseSchedule").click(function(){
    	pauseSchedule();
    });
    
    //恢复执行
    $("#resumeSchedule").click(function(){
    	resumeSchedule();
    });
    
    //立即执行
    $("#runSchedule").click(function(){
    	runSchedule();
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
    	clearPanel();
    	reloadList();
    });
    
    //查看日志
    $("#logSchedule").click(function(){
    	window.location.href="sys/scheduleLog";
    });
    
});

//判断是否有任务ID（插入还是更新）
var mJobId = null;
var mStatus = 0;
//-----------------
//获取指定任务ID信息
function getScheduleInfo(jobId){
	$.get("sys/schedule/info/"+jobId,function(res){
		var parsed = jQuery.parseJSON(res);
		var job = parsed.schedule;
		$("#beanName").val(job.beanName);
		$("#methodName").val(job.methodName);
		$("#params").val(job.params);
		$("#cronExpression").val(job.cronExpression);
		$("#remark").val(job.remark);
		
		mJobId = job.jobId;
		mStatus = job.status;
	});
}

//新增或者修改用户
function saveOrUpdate(){
	var url = mJobId == null ? "sys/schedule/save" : "sys/schedule/update";
	var jobInfo = getPanelInfo();
	jobInfo.jobId = mJobId;
	
	$.ajax({
		type:"POST",
		url:url,
		contentType : "application/json",
		dataType: "json",
		data: JSON.stringify(jobInfo),
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

//删除定时任务
function deleteSchedule(){
	
	var jobIds = getSelectedRows();
	if (jobIds == null) {
		return;
	}
	var ret = confirm("确定删除 "+jobIds.length+ "条定时任务?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/schedule/delete",
			contentType : "application/json",
			dataType: "json",
			data: JSON.stringify(jobIds),
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

//暂停定时任务
function pauseSchedule(){
	
	var jobIds = getSelectedRows();
	if (jobIds == null) {
		return;
	}
	var ret = confirm("确定暂停 "+jobIds.length+ "条定时任务?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/schedule/pause",
			contentType : "application/json",
			dataType: "json",
			data: JSON.stringify(jobIds),
			success:function(res){
    			if (res.code === 0) {
    				alert("暂停成功");
    				reloadList();
    			} else {
    				alert(res.msg);
    			}
			}
		});
	}
}

//恢复定时任务
function resumeSchedule(){
	
	var jobIds = getSelectedRows();
	if (jobIds == null) {
		return;
	}
	var ret = confirm("确定恢复 "+jobIds.length+ "条定时任务?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/schedule/resume",
			contentType : "application/json",
			dataType: "json",
			data: JSON.stringify(jobIds),
			success:function(res){
    			if (res.code === 0) {
    				alert("恢复成功");
    				reloadList();
    			} else {
    				alert(res.msg);
    			}
			}
		});
	}
}

//立即执行定时任务
function runSchedule(){
	
	var jobIds = getSelectedRows();
	if (jobIds == null) {
		return;
	}
	var ret = confirm("确定立即执行 "+jobIds.length+ "条定时任务?");
	if (ret==true) {
		$.ajax({
			type:"POST",
			url:"sys/schedule/run",
			contentType : "application/json",
			dataType: "json",
			data: JSON.stringify(jobIds),
			success:function(res){
    			if (res.code === 0) {
    				alert("执行成功");
    				reloadList();
    			} else {
    				alert(res.msg);
    			}
			}
		});
	}
}

//-----------------
//获取编辑界面信息
function getPanelInfo(){
	
	var jobInfo = {};
	jobInfo.beanName = $("#beanName").val();
	jobInfo.methodName = $("#methodName").val();
	jobInfo.params = $("#params").val();
	jobInfo.cronExpression = $("#cronExpression").val();
	jobInfo.remark = $("#remark").val();
	jobInfo.remark = $("#remark").val();
	jobInfo.status = mStatus;
	return jobInfo;
}

//清空编辑界信息
function clearPanel(){
	$("#beanName").val("");
	$("#methodName").val("");
	$("#params").val("");
	$("#cronExpression").val("");
	$("#remark").empty();
	mJobId = null;
	mStatus = null;
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
	$("#schedule-title").text(title);
	if (show) {
		$("#schedule-list").show();
		$("#schedule-information").hide();
	} else {
		$("#schedule-list").hide();
		$("#schedule-information").show();
	}
}

//验证(demo)
function validator(){
	
	if ($("#beanName").val().length==0){
		alert("用户名不能为空");
		return true;
	}
	
	if ($("#methodName").val().length==0) {
		alert("方法名称不能为空");
		return true;
	}
	
	if ($("#cronExpression").val().length==0) {
		alert("cron不能为空");
		return true;
	}
	
}


