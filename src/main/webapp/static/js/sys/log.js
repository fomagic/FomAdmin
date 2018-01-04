$(function () {
	
    $("#jqGrid").jqGrid({
        url: 'sys/log/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id',width: 35, key: true },
			{ label: '用户名', name: 'userName', width: 35 },
			{ label: '用户操作', name: 'operation', width: 70 },
			{ label: '请求方法', name: 'method', width: 70 },
			{ label: '请求参数', name: 'params', width: 70 },
			{ label: '耗时(单位:毫秒)', name: 'time', width: 70},
			{ label: 'IP地址', name: 'ip', width: 70},
			{ label: '创建时间', name: 'createTime', width: 80}
        ],
		viewrecords: true,
        height: 'auto',
        rowNum: 10,
		rowList : [10,30,50,100],
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
    $("#getLog").click(function(){
    	reloadList();
    });
    
    $("#exportFile").click(function(){
    	
    	var options = {
	        //ignoreRow: [1,11,12,-2],
	        //ignoreColumn: [0,-1],
	        //pdfmake: {enabled: true},
	        tableName: 'Table name'
	      };
	
	      $.extend(true, options, {type: 'excel', excelstyles: ['background-color', 'color',
                                                                'border-bottom-color', 'border-bottom-style', 'border-bottom-width',
                                                                'border-top-color', 'border-top-style', 'border-top-width',
                                                                'border-left-color', 'border-left-style', 'border-left-width',
                                                                'border-right-color', 'border-right-style', 'border-right-width',
                                                                'font-family', 'font-size', 'font-weight']
                                  });
	
	      $('#jqGrid').tableExport(options);
    });

    
});



//重新加载表格
function reloadList() {
	var page = $("#jqGrid").jqGrid('getGridParam','page');
	$("#jqGrid").jqGrid('setGridParam',{
		postData:{'key': $("#searchName").val()},
		page:page
	}).trigger("reloadGrid");
	
	$("#jqGrid").setGridWidth($(window).width());
}

