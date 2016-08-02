$(document).ready(function(){
  $("body").on("ajax:success", "#follow-button", function(){
    $(this).text('Unfollow This Site\'s Hives');
    $(this).attr('href', '/' + $(this).data("id") + '/unfollow_site');
    $(this).attr('id', 'unfollow-button');
  });

  $("body").on("ajax:success", "#unfollow-button", function(){
    $(this).text('Follow This Site\'s Hives');
    $(this).attr('href', '/' + $(this).data("id") + '/follow_site');
    $(this).attr('id', 'follow-button');
  });
});
