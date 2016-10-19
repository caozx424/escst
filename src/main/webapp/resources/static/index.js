$(function(){
    $(".openMenu").click(function(){
        //菜单url
        var src = $(this).attr("name");
        //打开菜单跳转到哪个controller
        $("#mainFrame").attr("src",src);
    });
});