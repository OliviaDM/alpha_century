import { Controller } from "stimulus";

export default class extends Controller {
  static targets =["dots", "more", "less"]

  initialize() {
  }

  readMore(e) {
    const dots = this.dotsTarget
    const more = this.moreTarget
    const less = this.lessTarget
    const myBtn = e.currentTarget

    console.log(less);

    if (dots.style.display === "none") {
      dots.style.display = "inline";
      myBtn.innerHTML = "Read more";
      less.style.display = "inline";
      more.style.display = "none";
    } else {
      dots.style.display = "none";
      myBtn.innerHTML = "Read less";
      less.style.display = "none"
      more.style.display = "inline";
    }
  }
}
