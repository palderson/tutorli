window.Enrolment = class Enrolment
  setupForm: ->
    console.log "setupForm"
    $('#new_enrolment').submit =>
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        @processCard()
        false
      else
        true

  processCard: ->
    console.log "processCard"
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()

    console.log card

    Stripe.createToken(card, @handleStripeResponse)

  handleStripeResponse: (status, response) ->
    console.log status
    console.log response
    if status == 200
      $('#enrolment_stripe_card_token').val(response.id)
      $('#new_enrolment')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)


$ ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  enrolment = new window.Enrolment()
  enrolment.setupForm()
