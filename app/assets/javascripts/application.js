// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle
//= require cocoon
//= require jquery.jscroll.min.js
//= require_tree .

// 固定ヘッダーを薄くする
$(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() > 0) {
      $('.navbar').css('opacity', 0.8);
    } else {
      $('.navbar').css('opacity', 1);
    }
  });
});

//about-pageスムーススクロール
$(function(){
    var headerHight = 186;
   // #で始まるアンカーをクリックした場合に処理
  $('a[href^="#link"]').click(function() {
      // スクロールの速度
    var speed = 700; // ミリ秒
    // アンカーの値取得
    var href= $(this).attr("href");
    // 移動先を取得
    var target = $(href == "#" || href == "" ? 'html' : href);
    // 移動先を数値で取得
    var position = target.offset().top-headerHight;
    // スムーススクロール
    $('body,html').animate({scrollTop:position}, speed, 'swing');
    return false;
  });
});

$(function() {
  $('.navbar')
    // マウスポインターが画像に乗った時の動作
    .mouseover(function(e) {
      $('.navbar').css('opacity', 1).fadeIn('slow');
    })
});

// 画像プレビュー機能のjs
$(function(){
    $fileField = $('#file')

    // 選択された画像を取得し表示
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#img_field");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "50%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
    $('#file.custom-file-input').on('change',function(){
        $(this).next('.custom-file-label').html($(this)[0].files[0].name);
      })
  });
