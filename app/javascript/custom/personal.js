$(function(){
  $(".emperor").
});

$(".nippons_year").on("blur", function() {
  $.ajax({
    type: 'GET',
    url: '/',
    data: { emperor: $(".emperor").val(), nippons_year: $(this).val() },
    dataType: 'json'
  }).done(function(data) {
    console.log(data);
    $(".chg_ad").text(data.chg_ad + "年");
  })
});