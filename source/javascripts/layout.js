$(function() {
  var pgurl = window.location.href.substr(window.location.href
    .lastIndexOf("/"));
  $("nav ul li a").each(function(){
    url = $(this).attr("href").replace("/en", "");
    if(url == pgurl || url == '' )
      $(this).addClass("active");
  })
});