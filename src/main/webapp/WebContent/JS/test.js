function view(arg){
	$(".time1, .time2, .ad1, .ad2").css("display","none");
	if(arg=="0") {
		$(".time2, .ad2").css("display","block");
		viewcount = 1;
	}
}
var viewcount = 0;
var rtcarousel = setInterval(function(){ view(viewcount) },5000);

$("#best_search").mouseenter(function() {
	clearInterval(rtcarousel);
});

$("#best_search").mouseleave(function() {
	rtcarousel = setInterval(function(){ view(viewcount) },5000);
});
 