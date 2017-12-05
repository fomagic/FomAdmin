//iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height() + 120);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
}).resize();


//显示点击状态
function loadFrame(obj) {
	var url = obj.contentWindow.location.href;
	var index = url.lastIndexOf("\/");
	var str = url.substring(index + 1, url.length);
	//导航菜单展开
	$(".treeview").removeClass("active");
	$(".treeview-menu li").removeClass("active");
    $("a[href$='"+str+"']").parents("li").addClass("active");
    
    var nav = $("a[href$='"+str+"'] span").text();
    $("#navTitle").text(nav.length==0?"Welcome.":nav);
}

