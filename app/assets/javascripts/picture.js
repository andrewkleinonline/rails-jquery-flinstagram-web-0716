// Add your JavaScript here

$(function(){
  addLikeEventHandler()
})

function addLikeEventHandler(){
  $('a.like_link').on('ajax:complete', function(e, request, status){
    var response = request.responseJSON;
    //console.log("success!")
    $('[picture_id=' + response.picture_id + '] span').attr('class', response.heart_class)
    //debugger;
    $('[picture_id=' + response.picture_id + ']').parent().parent().children()[1].innerHTML = response.likes_message
  })

}
