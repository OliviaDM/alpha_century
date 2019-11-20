import { Controller } from "stimulus";
import $ from 'jquery'

export default class extends Controller {
  static targets =["dots", "more", "less", "buttons", "tags"]

  initialize() {
  }

  readMore(e) {
    const modal = document.querySelector('#fuckthisworld')

    const titley = e.currentTarget.dataset.title
    const modalyTitle = modal.querySelector('#exampleModalLabel')
    modalyTitle.innerText = titley

    const texty = e.currentTarget.dataset.content
    const modalyText = modal.querySelector('.modal-body')
    modalyText.innerText = texty


    const tagsy = this.hasTagsTarget
    if (tagsy) {
      modalyText.insertAdjacentElement('afterbegin', tagsy)
    }

    if (this.buttonsTarget.classList[0] !== "world-link") {
      const buttony = this.buttonsTarget.innerHTML
      const modalyButtons = modal.querySelector('.modal-footer')
      modalyButtons.innerHTML = buttony
    } else {
      const footer = modal.querySelector('.modal-footer')
      footer ? footer.remove() : null
    }
    $('#fuckthisworld').modal('show')
  }
}
