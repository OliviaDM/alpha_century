import { Controller } from "stimulus";

export default class extends Controller {
  static targets =["dots", "more"]

  initialize() {
    console.log("The read controller is now loaded!");
  }

  readMore(e) {
    const dots = this.dotsTarget
    const more = this.moreTarget
    const myBtn = e.currentTarget

    console.log(dots)
    console.log(more)
    console.log(myBtn)

    if (dots.style.display === "none") {
      dots.style.display = "inline";
      myBtn.innerHTML = "Read more";
      more.style.display = "none";
    } else {
      dots.style.display = "none";
      myBtn.innerHTML = "Read less";
      more.style.display = "inline";
      // card.style.width = 100%
    }

  }
}
