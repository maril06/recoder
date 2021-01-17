$(document).ready(function(){
   $(".container").fadeIn(1000);
   $(".s2class").css({"color":"#white"});
   $(".s1class").css({"color":"#white"}); 
   $("#left").removeClass("left_hover");
   $("#right").addClass("right_hover");
   $(".searchPw").css({"display":"none"});
   $(".searchId").css({"display":""});
});
$("#right").click(function(){
   $("#left").removeClass("left_hover");
   $(".s2class").css({"color":"#white;"});
   $(".s1class").css({"color":"#748194"});
   $("#right").addClass("right_hover");
   $(".searchPw").css({"display":"none"});
   $(".searchId").css({"display":""});
     $(".pwSet").hide();
  /* $(".idSet").hide();*/
});
$("#left").click(function(){
   $(".s1class").css({"color":"#white"});
   $(".s2class").css({"color":"#748194"}); 
   $("#right").removeClass("right_hover");
   $("#left").addClass("left_hover");
   $(".searchId").css({"display":"none"});
   $(".searchPw").css({"display":""});
});

(function(){
   $(".pwSet").hide();
   $(".idSet").hide();
})();
/*
$("#nextPw").on("click", function(){
   $(".searchPw").hide();
   $(".pwSet").show();
})

$("#nextId").on("click", function(){
   $(".searchId").hide();
   $(".idSet").show();
})
*/
