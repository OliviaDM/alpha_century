import { Controller } from "stimulus";
import $ from 'jquery'

export default class extends Controller {
  static targets =["dots", "more", "less"]

  initialize() {
  }

  readMore(e) {


    $('#exampleModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var recipient = button.data('content') // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this)
      modal.find('.modal-title').text('New message to ' + recipient)
      modal.find('.modal-body input').val(recipient)
      recipient.innerText = modal.find('.modal-body input').val(recipient)

    })

  }
}
