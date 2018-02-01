//iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height()-100);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
}).resize();



//显示点击状态
function loadFrame(obj) {
	var url = obj.contentWindow.location.href;
	//var index = url.lastIndexOf("\/");
	//var str = url.substring(index + 1, url.length);
	var str = url.substr(url.lastIndexOf('/', url.lastIndexOf('/') - 1) + 1);
	//导航菜单展开
	$(".treeview").removeClass("active");
	$(".treeview-menu li").removeClass("active");
    $("a[href$='"+str+"']").parents("li").addClass("active");
    
    var nav = $("a[href$='"+str+"'] span").text();
    $("#navTitle").text(nav.length==0?"Welcome.":nav);

    var iframeBody = $("#contentFrame").contents().find("body");
	
}


var pasData = {
	password : "",
	newPassword : ""
};

function setPasData(){
	pasData.password = $("#password").val();
	pasData.newPassword = $("#newPassword").val();
}

function clearPasData(){
	pasData.password = $("#password").val("");
	pasData.newPassword = $("#newPassword").val("");
}

$("#btnPassword").click(function(){

	setPasData();
	
	if (validator()) {
		return;
	}
	var data = "password="+pasData.password+"&newPassword="+pasData.newPassword;
	
	$.ajax({
		type:"POST",
		url:"sys/user/password",
		dataType: "json",
		data: data,
		success:function(res){
			if (res.code === 0) {
				alert("修改成功");
				$('#modal-password').modal('hide');
				clearPasData();
			} else {
				alert(res.msg);
			}
		}
	});
});

//验证(demo)
function validator(){
	
	if ($("#password").val().length==0){
		alert("旧密码不能为空");
		return true;
	}
	if ($("#newPassword").val().length==0){
		alert("新密码不能为空");
		return true;
	}
	
}
