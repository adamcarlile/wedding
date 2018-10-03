$(document).ready(function() {
  $('div.mobile-nav a').click(function(e) {
    e.preventDefault()
    $('div.menu').show()
    $(this).hide()
  })

})