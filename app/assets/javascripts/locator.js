$(document).ready(function(){
  var view_location = {};
  $("#create-crag").on("click", postCrag);
})

var getData = function() {
  return {location: view_location.lat() + "," + view_location.lng(), description: $('#Description').val(), name: $('#Name').val(), directions: $('#Directions').val()}
}

function postCrag(){
  var description = $("Description").val();
  $.ajax({
    method: "POST",
    url: "/api/v1/crags",
    dataType: "JSON",
    data: {crag: getData()},
    success: $('.ajax-flash').html("<div class='alert alert-success'><h4>Successfully Created a New Crag!</h4></div>")
  })
}
