import { Controller } from "stimulus";
import $ from 'jquery'

export default class extends Controller {
  static targets =["dots", "more", "less", "buttons", "tags"]

  initialize() {
  }

  readMore(e) {
    const modal = document.querySelector('#fuckthisworld')

    const titley = e.currentTarget.dataset.title
    const index = e.currentTarget.dataset.index
    let hiddenContents = document.querySelectorAll(".hidden-content")
    let hiddenContent;
    hiddenContents.forEach(entry => {
      if (entry.dataset.index === index){
        hiddenContent = entry
      }
    })

    const modalyTitle = modal.querySelector('#exampleModalLabel')
    modalyTitle.innerText = titley

    console.dir(hiddenContent)
    const texty = hiddenContent.innerHTML
    const modalyText = modal.querySelector('.modal-body')
    modalyText.innerHTML = texty

    if (this.hasTagsTarget) {
      const tagsy = this.tagsTarget
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
