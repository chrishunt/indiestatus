var params = location.hash.slice(1).split("/"),
    url = "http://localhost:5000",
    email = params[0],
    ids = params[1].split(",");

function showError() {
  $(".alert").html(
    "Sorry. There was an error. Are your order numbers correct?"
  ).removeClass("hidden");
};

function showStatus(data) {
  $.each(data.orders, function(_, order) {
    $(".js-status-rows").append(
      [ '<div class="panel panel-default">',
          '<div class="panel-heading">',
            '<h3 class="panel-title">',
              '<code>',
                order.number,
              '</code>',
              order.progress + " " + order.message,
            '</h3>',
          '</div>',
          '<div class="panel-body">',
            order.description,
          '</div>',
        '</div>'
      ].join("")
    );
  });
};

$.get(
  [url, email, ids.join(",")].join("/")
).done(function(data) {
  $(".status").removeClass("hidden");
  showStatus(data);
}).fail(function() {
  showError();
}).always(function() {
  $(".spinner").addClass("hidden");
});
