
$(function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[itemimages_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    <div class="js-remove" id="js-remove${index}">削除</div>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4];
  lastIndex = $('.js-file_group:last').data('index');

  // 既に使われているindexを除外
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#buttons').on('change', '.js-file', function(e) {
    
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#buttons').append(buildFileField(fileIndex[0]));
      
      
      if (fileIndex[0] == 1 ) {
        $('#item_images_attributes_0_image').hide();
        $('#js-remove0').show();
      } else if (fileIndex[0] == 2 ) {
        $('#item_images_attributes_1_image').hide();
        $('#js-remove1').show();
      } else if (fileIndex[0] == 3 ){
        $('#item_images_attributes_2_image').hide();
        $('#js-remove2').show();
      } else if (fileIndex[0] == 4 ){
        $('#item_images_attributes_3_image').hide();
        $('#item_images_attributes_4_image').hide();
        $('#js-remove3').show();
      }
      
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#buttons').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    console.log(this);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#buttons').append(buildFileField(fileIndex[0]));
  });
});