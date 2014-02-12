$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('#adventure_form').submit(function(event) {
    console.log('--------- detected form submit ------------- ');
    event.preventDefault();

    // show spinner
    $(".spinner").removeClass("hide");
    var username = $('input').val();
    console.log(username);

    // Do AJAX post stuff
    $.ajax({
      type: 'Post',
      url: '/ajax_post',
      data: {twitter_user: username}, // must match params[:twitter_user_name]
      success: function(response) {
        $(".spinner").addClass("hide");
        $(".tweets").html(response);
        // refactor this to not do redirect
        // window.location.href = '/' + data;
      }
    });
  });
});
