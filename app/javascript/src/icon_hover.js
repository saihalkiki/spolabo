$(document).on('turbolinks:load', function () {
  $('.Icons__post').hover(function(){
    $(this).css('border-color', '#0056b3')
  }, function(){
      $(this).css('border-color', 'black')
  })
})