$ ->
  $("input[type=tel]").intlTelInput({
    formatOnInit: true,
    separateDialCode: true,
    preferredCountries: ['gb', 'za']
  })
