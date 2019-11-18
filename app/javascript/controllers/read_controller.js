import { Controller } from "stimulus";
import $ from 'jquery'

export default class extends Controller {
  static targets =["dots", "more"]

  initialize() {
  }

  readMore(e) {
    // const dots = this.dotsTarget
    // const more = this.moreTarget
    // const myBtn = e.currentTarget

    // if (dots.style.display === "none") {
    //   dots.style.display = "inline";
    //   myBtn.innerHTML = "Read more";
    //   more.style.display = "none";
    // } else {
    //   dots.style.display = "none";
    //   myBtn.innerHTML = "Read less";
    //   more.style.display = "inline";
    // }

    $('#modal').on('shown.bs.modal', function () {
      $('#myInput').trigger('focus')
    })
  }
}
