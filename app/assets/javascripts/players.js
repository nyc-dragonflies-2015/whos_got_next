$(document).ready(function() {
  $(document).on('submit', '.status-button', function(e) {
    e.preventDefault();
    var joinButton = e.target

    $.ajax(joinButton.action, {
      method: 'PATCH',
      data: $(this).serialize()
    })
    .done(function(data) {
      gameDiv = $(joinButton).parent();
      gameDiv.replaceWith(data);
    })
    .fail(function() {
      alert("Failure!");
    });
  });
});
