$(document).ready(function() {
  $("test").text("jQuery稼働テスト(稼働中)");
});

$(function(){
  $('.box1').on('click',function(){
    $('.box1').addClass('box1-ext');
  });
  $('.box1').mouseout(function(){
    $('.box1').removeClass('box1-ext');
  });
});