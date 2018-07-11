$(function () {

    $("#loginBtn").click(function(){
    	
	    if(validator()){
	    	return;
	    }
    	
    	login();
    });

});



//新增或者修改用户
function login(){
	var url = "sys/login";
//	var loginInfo = getLoginInfo();
	
	var data = "userName="+$("#userName").val()+"&password="+$("#password").val()+"&rememberMe="+$('#rememberMe').prop('checked');
	
	$.ajax({
		type:"POST",
		url:url,
//		contentType : "application/json",
		dataType: "json",
		data: data/*JSON.stringify(loginInfo)*/,
		success: function(res) {
			
			console.log(res);
			
			if (res.code === 0) {
				
				showMsg("登录成功");

				setTimeout("javascript:location.href='sys/index'", 500);
				
			} else {
				showMsg(res.msg);
			}
		}
	});
}



//-----------------

function getLoginInfo(){
	
	var loginInfo = {};
	loginInfo.userName = $("#userName").val();
	loginInfo.password = $("#password").val();
	loginInfo.rememberMe = $('#rememberMe').prop('checked'); 
	return loginInfo;
}

//提示信息
function showMsg(tip){
	$("#errMsg").text(tip);
}

//判断为空
isBlank = function(obj){
    return(!obj || $.trim(obj) === "");
}

//验证(demo)
function validator(){
	if (isBlank($("#userName").val())){
		
		showMsg("用户名不能为空");
		return true;
	}
	
	if (isBlank($("#password").val())) {
		showMsg("密码不能为空");
		return true;
	}
	
}


