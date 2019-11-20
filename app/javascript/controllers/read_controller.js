import { Controller } from "stimulus";
import $ from 'jquery'

export default class extends Controller {
  static targets =["dots", "more", "less"]

  initialize() {
  }

  readMore(e) {

    const modal = document.querySelector('#fuckthisworld')
    console.log(modal)

    const texty = e.currentTarget.dataset.content
    console.log(texty)

    const titley = e.currentTarget.dataset.title
    console.log(titley)

    const modalyTitle = modal.querySelector('#exampleModalLabel')
    console.log(modalyTitle.innerText)

    modalyTitle.innerText = titley
    console.log(modalyTitle.innerText)

    const modalyText = modal.querySelector('.modal-body')
    console.log(modalyText.innerText)

    modalyText.innerText = texty
    console.log(modalyText.innerText)

    $('#fuckthisworld').modal('show')




  }
}
