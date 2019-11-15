if (document.querySelector("#switch_button")){
  document.querySelector("#switch_button").addEventListener("click", (event) => {
        event.preventDefault()
        document.querySelector("#add-tag-form").classList.toggle('hide-div')
        document.querySelector("#button-search-new-tag").classList.toggle('hide-div')
        document.querySelector("#search-tag-form").classList.toggle('hide-div')
        document.querySelector("#button-add-new-tag").classList.toggle('hide-div')

    });

  //   document.querySelector("#button-search-new-tag").addEventListener("click", (event) => {
  //     event.preventDefault()
  //     document.querySelector("#add-tag-form").classList.toggle('hide-div')
  //     document.querySelector("#button-search-new-tag").classList.toggle('hide-div')
  //     document.querySelector("#search-tag-form").classList.remove('hide-div')
  //     document.querySelector("#button-add-new-tag").classList.remove('hide-div')

  // });
}
