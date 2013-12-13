//= require vendor/jquery
//= require foundation/index

$(document).ready(function(){
  var next_url = $('#continue').attr('href');

  $(document).keydown(function(e){
    if (e.keyCode == 37) { 
      history.go(-1);
      return false;
    } else if (next_url && e.keyCode == 39) {
      window.location.href = next_url;
      return false;
    }
  });
});