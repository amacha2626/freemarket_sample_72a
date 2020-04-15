$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index) => {
    const html =
      `<div data-index="${index}" class="js-file_group">
        <input class="js-file" type="file"
        name="item[item_images_attributes][${index}][image]"
        id="item_item_images_attributes_${index}_image"><br>
        <div class="js-remove">削除<div<
      </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file-group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();
  
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    console.log(targetIndex)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
      img.setAttribute('width', '100px');
      img.setAttribute('height', '100px');
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
  $('#image-box').on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="category" id="children_category" name="item[category_id]">
                        <option value="---" data-category="---" selected="selected">---</option>
                        ${insertHTML}
                      </select>`;
    $('.exhibition-container_registration-form_category').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="category" id="grandchildren_category" name="item[category_id]">
                              <option value="---" data-category="---" selected="selected">---</option>
                              ${insertHTML}
                            </select>`;
    $('.exhibition-container_registration-form_category').append(grandchildSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentId = document.getElementById('parent_category').value;
    if(parentId != "---"){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_category').remove();
        $('#grandchildren_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました')
      })
    }else{
      $('#children_category').remove();
      $('#grandchildren_category').remove();
    }
  });

  $('.exhibition-container_registration-form_category').on('change', '#children_category', function(){
    var childId = document.getElementById('children_category').value;
    if(childId != "---"){
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_category').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました')
      })
    }else{
      $('#grandchildren_category').remove();
    }
  });



});