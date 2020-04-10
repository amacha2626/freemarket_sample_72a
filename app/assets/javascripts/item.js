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
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  $('#image-box').on('change', '.js-file', function(e){
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length-1]+1)
  });
  $('#image-box').on('click', '.js-remove', function(){
    $(this).parent().remove();
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
        url: 'category_children',
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
        url: 'category_grandchildren',
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