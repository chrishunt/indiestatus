var params = location.hash.slice(1).split("/"),
    email = params[0],
    ids = params[1];

function showError(message) {
  hideSpinner();
  $(".alert").html(message).removeClass("hidden");
}

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

  $(".status").removeClass("hidden");
}

function hideSpinner(){
  $(".spinner").addClass("hidden");
}

if (email && ids) {
  $.get(
    ["", email, ids].join("/")
  ).done(function(data) {
    showStatus(data);
  }).fail(function() {
    showError("There was an error. Are your order numbers correct?");
  }).always(function() {
    hideSpinner();
  });
} else {
  showError("Both an email address and order number are required.");
}
