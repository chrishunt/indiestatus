$(".spinner").addClass("hidden");
$(".status").removeClass("hidden");

$.post("https://209.235.214.90/setistatus/checkstatus.asp", function(data) {
  console.log(data);
});
