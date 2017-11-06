$(".wyphone").click(function(){
	$(".popover").show(300);
});
$(".close").click(function(){
	$(".popover").hide(300);
});

$(".img_list ul li").click(function() {
	$(".shower").show();
	var gallery = mui('.mui-slider');
	gallery.slider({
		interval: 0 //自动轮播周期，若为0则不自动播放，默认为0；
	});
});
$(".shower").click(function() {
	$(this).hide();
});

function inputNum() {
	var x = 3;
	var y = $(".img_list ul li").length;
	var z = $(".file");
	$(".Num").text(y);
	if(y >= x) {
		$(z).attr("disabled", "disabled");
		$(".backdrop").show();
	} else if(y < x) {
		$(z).removeattr("disabled");

	}
}
inputNum();