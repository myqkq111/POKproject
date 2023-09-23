$(document).ready(function() {
 popConfig();
});
function popConfig(){
 $("#pop_bt").click(layerOpen);
 $("#close").click(layerClose);
}
function layerOpen(){
 $("#pop").css("display","block");
 var tx = ($(window).width()-$("#pop .loginform").width())/2;
 var ty = ($(window).height()-$("#pop .loginform").height())/2;
 $("#pop .loginform").css({left:tx+"px",top:ty+"px"});
 $("body").css("overflow","hidden").append('<div id="mask"></div>');
 $('#mask').fadeIn(300);
}
function layerClose(){
 $("#pop").css("display","none");
 $("body").css("overflow","auto");
 $('#mask').fadeOut(300);
}


