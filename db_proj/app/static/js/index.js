$(".tabs a").on("click", function(){
  var id = $(this).attr("id");
  if(id == 2){
    $("#register").css("display","block");
    $("#login").css("display","none");
  }
  else{
    $("#register").css("display","none");
    $("#forgetP").css("display","none");
    $("#login").css("display","block");
  }
});
$(".reset").on("click", function(){
  $("#login").css("display","block");
  $("#forgetP").css("display","none");
});
$(".forget-password").on("click", function(){
    $("#register").css("display","none");
    $("#login").css("display","none");
    $("#forgetP").css("display","block");
})
function animationHover(element, animation){
  element = $(element);
  element.hover(
    function() {
      element.addClass('animated ' + animation);
      //wait for animation to finish before removing classes
      window.setTimeout( function(){
          element.removeClass('animated ' + animation);
      }, 2000);
    }
  );
};
animationHover("input[type=button]", "shake");