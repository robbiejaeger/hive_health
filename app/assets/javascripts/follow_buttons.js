$(document).ready(function(){
  $("#follow-button").on("ajax:success", function(){
    $(this).text('Unfollow This Site\'s Hives');
    $(this).attr('class', 'btn btn-primary')
    $(this).attr('href', '/' + $(this).data("id") + '/unfollow_site')
    $(this).attr('id', 'unfollow-button')
  });

  $("#unfollow-button").on("ajax:success", function(){
    $(this).text('Follow This Site\'s Hives');
    $(this).attr('class', 'btn btn-primary')
    $(this).attr('href', '/' + $(this).data("id") + '/follow_site')
    $(this).attr('id', 'follow-button')
  });
});
