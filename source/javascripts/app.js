//= require vendor/jquery
//= require foundation/index

$(document).ready(function(){
  var next_url = $('#continue').attr('href');

  init_navigation_keys();
  init_os_selector();
  init_header_shadow();
});

var body = $('body');

// The header should drop shadow if the page is scrolled down.
function init_header_shadow() {
  $(window).scroll(function(){ 
    if (window.scrollY > 0) {
      body.addClass('scrolled');
    } else {
      body.removeClass('scrolled');
    }
  });
}

function init_navigation_keys() {  
  $(document).keydown(function(e){
    if (e.keyCode == 37) { 
      history.go(-1);
      return false;
    } else if (next_url && e.keyCode == 39) {
      window.location.href = next_url;
      return false;
    }
  });
}

function init_os_selector() {
  $('#os-selector select').change(function(){
    var os = $(this).val();
    $('body').removeClass('os-nix').removeClass('os-windows').removeClass('os-osx').addClass('os-' + os);
    document.cookie = "os=" + os;
  });

  var os = cookies()['os'];
  if (typeof os == "undefined") {
    os = 'windows';
  }
  $('body').addClass('os-' + os);
  $('#os-selector select').val(os);
}

function cookies() {
  var cookie = document.cookie.split('; '),
      cookies = {};

  for (var i = 0; i < cookie.length; i++) {
    var cook = cookie[i].split('=');
    cookies[cook[0]] = cook[1];
  }

  return cookies;
}