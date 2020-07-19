$(document).on('turbolinks:load', function () {
  function readURL(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();

      reader.onload = function (e) {
        $('#image_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_img").change(function () {
    $('#image_img_prev').removeClass('hidden');
    $('.image_present_img').remove();
    readURL(this);
  });
});