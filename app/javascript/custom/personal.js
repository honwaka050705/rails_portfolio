$(function(){
  $.ajax({
    type: 'GET',
    url: '/emperor',
    dataType: 'json'
  }).done(function(data) {
    $.each(data, function(index, val) {
      $("#emperor").append($('<option>').attr({ value: val.generation }).text(val.emperor_name))
    })
  })
});

$("#nippons_year").on("blur", function() {
  $("#chg_ad").val("");
  $.ajax({
    type: 'GET',
    url: '/to_ad',
    data: { emperor: $("#emperor").val(), nippons_year: $(this).val() },
    dataType: 'json'
  }).done(function(data) {
    $("#chg_ad").text(data.chg_ad + "年");
    console.log("chg_adのtext:");
    console.log($("#chg_ad").text());
  })
});