$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/scheduleLog/list',
        datatype: "json",
        colModel: [			
			{ label: '日志ID', name: 'logId',width: 35, key: true },
			{ label: '任务ID', name: 'jobId', width: 35 },
			{ label: 'bean名称', name: 'beanName', width: 70 },
			{ label: '方法名称', name: 'methodName', width: 70 },
			{ label: '参数', name: 'params', width: 70 },
			{ label: '状态', name: 'status', width: 40, align: 'center', formatter: function(value, options, row){
				return value === 0 ? 
					'<span class="label label-success">成功</span>': 
					'<span class="label label-danger pointer" onclick="showScheduleLogError('+row.logId+')">失败</span>' ;
			}},
			{ label: '耗时(单位:毫秒)', name: 'times', width: 70},
			{ label: '执行时间', name: 'createTime', width: 80}
        ],
		viewrecords: true,
        height: 'auto',
        rowNum: 10,
		rowList : [10,30,50,100,-1],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
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
    $("#getScheduleLog").click(function(){
    	reloadList();
    });
    
    //返回列表
    $("#back").click(function(){
    	history.go(-1);
    });
    
    $("#exportFile").click(function(){
    	
	      $('#jqGrid').tableExport( {type:'excel', excelstyles: ['background-color', 'color',
                                                                 'border-bottom-color', 'border-bottom-style', 'border-bottom-width',
                                                                 'border-top-color', 'border-top-style', 'border-top-width',
                                                                 'border-left-color', 'border-left-style', 'border-left-width',
                                                                 'border-right-color', 'border-right-style', 'border-right-width',
                                                                 'font-family', 'font-size', 'font-weight']});
  });
});



//重新加载表格
function reloadList() {
	$("#jqGrid").jqGrid('setGridParam',{
		postData:{'jobId': $("#searchName").val()},
		page:1
	}).trigger("reloadGrid");
	
	$("#jqGrid").setGridWidth($(window).width()-42);
}


//显示错误信息
function showScheduleLogError(logId){
	
	$.get("sys/scheduleLog/info/"+logId,function(res){
		var parsedJson = jQuery.parseJSON(res);
		alert(parsedJson.log.error);
	});
	
}
