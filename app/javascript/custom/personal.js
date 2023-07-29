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
  if ($(this).val() == "") return 
  $("#chg_ad").text("");
  $.ajax({
    type: 'GET',
    url: '/to_ad',
    data: { emperor: $("#emperor").val(), nippons_year: $(this).val() },
    dataType: 'json'
  }).done(function(data) {
    $("#chg_ad").text(data.chg_ad + "年");
  })
});

$("#input_ad").on("blur", function() {
  if ($(this).val() == "") return
  // $("#chg_nippon_years").text("");
  $.ajax({
    type: 'GET',
    url: '/to_nippons_year',
    data: { ad: $(this).val() },
    dataType: 'json'
  }).done(function(data) {
    $.each(data, function(index, val) {
      console.log(val.nippons_year);
      console.log($("#chg_nippon_years").text());
      $("#chg_nippon_years").text(val.nippons_year);
    })
  })
});