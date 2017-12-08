$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';


//选择记录
function getSelectedRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");

    if (!rowKey){
        alert("选择一条记录");
        return;
	} 
	var selectedIDs = grid.getGridParam("selarrrow");
//    var result = "";
//    for (var i = 0; i < selectedIDs.length; i++) {
//        result += selectedIDs[i] + ",";
//    }
//    alert(result);
	if (selectedIDs.length>1) {
		alert("只能选择一条记录");
        return;
	} 
	
	return selectedIDs[0];
}