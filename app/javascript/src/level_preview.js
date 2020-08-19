$(document).on('turbolinks:load', function () {
  $('#levelBtn').on('click', function (e) {
    e.preventDefault();
    $(this).prop('disabled', false);
    if ($('#levelRange').find('.displayNone').length == 1) {
      // ボタンをグレーにする
      $('#levelBtn').removeClass('btn-primary');
      $('#levelBtn').addClass('btn-secondary');
      // 表示させて、rangeを起動させる
      $('#levelRange').children().removeClass('displayNone');
      $('#levelRange').find('input[type=range]').prop('disabled', false);
    } else {
      // ボタンをブルーにする
      $('#levelBtn').removeClass('btn-secondary');
      $('#levelBtn').addClass('btn-primary');
      // 非表示させて、rangeの起動を停止する
      $('#levelRange').children().addClass('displayNone');
      $('#levelRange').find('input[type=range]').prop('disabled', true);
    }
  })

  /* 変更中（ドラッグ中） */
  $('input[type=range]').on('input', function () {
    $('#score').html($(this).val());
  });
  
  /* 変更後 */
  $('input[type=range]').change(function () {
    $('#score').html($(this).val());
  });
})