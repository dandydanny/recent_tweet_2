$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $(".input_form").submit(function(event) {
    console.log('--------- click ------------- ');
    event.preventDefault();

    // show spinner
    $(".fa-spin").removeClass("hide");
    $('.input').attr('disabled', 'disabled');
    var username = $('input').val();
    console.log(username);

    // Do AJAX post stuff
    console.log('--------- AJAX post ------------- ');
    $.ajax({
      type: 'Post',
      url: '/ajax_post',
      data: {twitter_user: username}, // must match params[:twitter_user_name]
      success: function(response) {
        $(".fa-spin").addClass("hide");
        $('.input').removeAttr('disabled');
        $(".tweets").html(response);
        // refactor this to not do redirect
        // window.location.href = '/' + data;
      }
    });
  });
});
