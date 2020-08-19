$(document).on('turbolinks:load', function () {
  /* 変更中（ドラッグ中） */
  $('input[type=range]').on('input', function () {
    $('#score').html($(this).val());
  });
  
  /* 変更後 */
  $('input[type=range]').change(function () {
    $('#score').html($(this).val());
  });
})