$(function(){
	var curr = 0;
	var	totalNum = $(".box01 img").length;
	$("#jsNav a.trigger").each(function(i){
		$(this).click(function(){
			curr = i;
			$("#js img").eq(i).fadeIn("fast").siblings("img").fadeOut("fast");
			$(this).addClass("imgSelected").siblings().removeClass("imgSelected");
		});
	});
	var timer = setInterval(function(){
		var go = (curr + 1) % totalNum;
		$("#jsNav a.trigger").eq(go).click();
	},3000);
	$("#js,#next,#prev").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
		var go = (curr + 1) % totalNum;
		$("#jsNav a.trigger").eq(go).click();
	},3000);
	});
	$("#next").click(function(){
		if(curr == totalNum-1){
			var go = 0;
		}else{
			var go = (curr + 1) % totalNum;
		}
		$("#jsNav a.trigger").eq(go).click();
	});
	$("#prev").click(function(){
		if(curr == 0){
			var go = totalNum-1;
		}else{
			var go = (curr - 1) % totalNum;
		}
		$("#jsNav a.trigger").eq(go).click();
	});
});