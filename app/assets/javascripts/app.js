$(document).ready(function() {
  $("test").text("jQuery稼働テスト(稼働中)");
});

$(function(){
  $('.box1').on('click', function(){
    $(this).slideUp();
  });
});

$(function(){
  $('button').on('click', function(){
    $('ul').children().css('color', 'red');
  });
});

$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});