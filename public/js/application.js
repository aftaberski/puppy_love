$(document).ready(function() {

  function shakeForm(form) {
   var l = 20;
   for( var i = 0; i < 10; i++ )
     $( form ).animate( { 'margin-left': "+=" + ( l = -l ) + 'px' }, 50);
  }


// UPDATE THIS WITH SINGLE ARTICLE INFO
  $('#content').on("click", 'a.single-article-ajax', function(event){
    event.preventDefault();
    var $target = $(event.currentTarget)

    $.ajax({
      type: "GET",
      url: $target.attr('href'),
      success: function(response){
        $('#content').empty();
        $('#content').append(response);
      },
      error: function(response){
        console.log("ERRRRORRRRR!")
      }
    });
  });

  $('.welcome-login').on("click", function(event){
    event.preventDefault();
    $('#signup_form').hide();
    $('#login_form').show();
  });

  $('.login-ajax').on("submit", function(event){
    event.preventDefault();
    var $target = $(event.target)

    $.ajax({
      type: $target.attr("method"),
      url: $target.attr("action"),
      data: $target.serialize(),
      success: function(response){
        $('#content').empty();
        $('#content').append(response);

      },
      error: function(response){
        shakeForm("#login_form");
        errorMod.show("Username or Password is Incorrect");
      }
    });
  });

   $('.welcome-signup').on("click", function(event){
    event.preventDefault();
    $('#login_form').hide();
    $('#signup_form').show();
  });

   $('.signup-ajax').on("submit", function(event){
    event.preventDefault();
    var $target = $(event.target)

    $.ajax({
      type: $target.attr("method"),
      url: $target.attr("action"),
      data: $target.serialize(),
      success: function(response){
        $('#content').empty();
        $('#content').append(response);
      },
      error: function(response){
        shakeForm("#signup_form");
      }
    });
  });

   $('a#show-articles-btn').on("click", function(event){
    event.preventDefault();
    var $target = $(event.currentTarget)
    $.ajax({
      type: "GET",
      url: $target.attr('href'),
      success: function(response){
        console.log("DONE!")
        $('#content').empty();
        $('#content').append(response);
      }
    });
  });

   $('.add-new-puppy-btn').on("click", function(event){
    event.preventDefault();
    console.log("doing it!")
    $('#new_article_form').toggle();
  });

  $('a img.heart').on("click", function(event){
    event.preventDefault();
    var $target = $(event.target)

    $.ajax({
      type: $target.data("method"),
      url: $target.data("action"),
      data: $target.data(),
      success: function(response){
        $('#' + $target.data('article_id')).empty();
        $('#' + $target.data('article_id')).append(response);
      }
    });
  });

});
