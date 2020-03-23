$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
                      <select class="listing-select-wrapper__box--select" id="child_category" name="category2">
                        <option value="選択してください" data-category="選択してください">選択してください</option>
                        ${insertHTML}
                      </select>
                      `;
    $('.category__inputbox').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `
                            <select class="listing-select-wrapper__box--select" id="grandchild_category" name="category3">
                              <option value="選択してください" data-category="選択してください">選択してください</option>
                              ${insertHTML}
                            </select>
                            `;
    $('.category__inputbox').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "選択してください"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: "/items/get_category_children",
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#child_category').remove(); //親が変更された時、子以下を削除
        $('#grandchild_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove(); //親カテゴリーが初期値になった時、子以下を削除
      $('#grandchild_category').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.category__inputbox').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "選択してください"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: "/items/get_category_grandchildren",
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild_category').remove(); //子が変更された時、孫以下を削除するする
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });
});