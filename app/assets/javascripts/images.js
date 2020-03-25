
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
    console.log("fuckyousoon")
    console.log(fileIndex)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#buttons').append(buildFileField(fileIndex[0]));
      if (fileIndex[0] == 1 ) {
        $('#item_images_attributes_0_image').hide();
        $('#js-remove0').show();
        console.log("hello1")
      } else if (fileIndex[0] == 2 ) {
        $('#item_images_attributes_1_image').hide();
        $('#js-remove1').show();
        console.log("hello2")
      } else if (fileIndex[0] == 3 ){
        $('#item_images_attributes_2_image').hide();
        $('#js-remove2').show();
        console.log("hello3")
      } else if (fileIndex[0] == 4 ){
        $('#item_images_attributes_3_image').hide();
        $('#item_images_attributes_4_image').hide();
        // ↑追加ボタン削除
        $('#js-remove3').show();
        console.log("hello4")
      }
      fileIndex.shift();

      console.log(targetIndex);
      console.log("上がtargetIndex,下がfileIndex")
      console.log(fileIndex);
    }
  });

  $('#buttons').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if (fileIndex.length == 0) {
      fileIndex.push(4);
      $('#buttons').append(buildFileField(fileIndex[0]));
    } else if (fileIndex.length == 1) {
      fileIndex.pop();
      fileIndex.unshift(4);
      fileIndex.unshift(3);
    } else if (fileIndex.length == 2) {
      fileIndex.pop();
      fileIndex.pop();
      fileIndex.unshift(4);
      fileIndex.unshift(3);
      fileIndex.unshift(2);
      // $(this).hide();
      // $('#buttons').append(buildFileField(fileIndex[0]));
    } else if (fileIndex.length == 3) {
      fileIndex.pop();
      fileIndex.pop();
      fileIndex.pop();
      fileIndex.unshift(4);
      fileIndex.unshift(3);
      fileIndex.unshift(2);
      fileIndex.unshift(1);
    };

    console.log(targetIndex);
    console.log("上がtargetIndex,下がfileIndex")
    console.log(fileIndex);
  });
});