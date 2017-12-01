//iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height() + 120);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
}).resize();


//显示点击状态
function changeClick(obj) {
	var url = $(obj).attr("href");

	//导航菜单展开
    $(".treeview-menu li").removeClass("active");
    $("a[href='"+url+"']").parents("li").addClass("active");
}