$(window).resize(function(){
		$("#menu_cont").css("height",(window.innerHeight-70+'px'));
		$("#page_m").css("height",(window.innerHeight-109+'px'));
if($(window).width()<1380&&$(window).width()>980){
	$('.main-content').css('width','82%');
}

if($(window).width()<980){
	$('.main-content').css('width','79%');
}
    
		
})

$(function(){
			   //alert($(window).width());
			   $("#menu_cont").css("width",$('.leftsidebar_box').width());
			   
			   //$(".menu-content").css("height",(window.innerHeight+'px'));
			   $("#menu_cont").css("height",(window.innerHeight-70+'px'));
			   $("#page_m").css("height",(window.innerHeight-109+'px'));
			   			   
			   $("#page_m").niceScroll({  
				   cursorcolor:"#5CACEE",
				   cursoropacitymax:1,
				   touchbehavior:false,
				   cursorborder:"10",
				   cursorwidth:"10px",
				   cursorborderradius:"10px"
               });
			   $("#menu_cont").niceScroll({  
				   cursorcolor:"#CC0071",
				   cursoropacitymax:1,
				   touchbehavior:false,
				   cursorborder:"0",
				   cursorwidth:"0px",
				   cursorborderradius:"0px"
               });
			   
$(".leftsidebar_box dt").css({"background-color":"#000"});
$(".leftsidebar_box dt img").attr("src",ctx+"/resources/static/images/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#000"})
		$(this).css({"background-color": "#317eb4"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src",ctx + "/resources/static/images/select_xl01.png");
		$(this).parent().find('img').attr("src",ctx + "/resources/static/images/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})			


if($(window).width()<1380&&$(window).width()>980){
	$('.main-content').css('width','82%');
}

if($(window).width()<980){
	$('.main-content').css('width','79%');
}
     

})