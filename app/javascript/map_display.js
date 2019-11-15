function map_display() {


  const dropdown = document.querySelector("#map-select");
  const maps_info = JSON.parse(document.querySelector('#map').dataset.hash);
  const map = document.querySelector('#map');

  let current_map = "-1";

  function find_map(id) {
    return maps_info.maps.find(e => e.id.toString() == id);
  }

  function change_map(id) {
    current_map = id;
    const new_map = find_map(id);

    const w = document.documentElement.clientWidth;
    map.innerHTML = `<img id="map-img" width="${w}" src="https://res.cloudinary.com/dhnkmpy8d/${new_map.photo}" style="position: relative;">`;

    const map_img = document.querySelector("#map-img");
    map_img.addEventListener("contextmenu", (event) => {
      // console.log(event);
      console.log("RIGHT CLICK");
      event.preventDefault();
      const h = document.getElementById("map-img").clientHeight;
      console.log(h);

      function draw_marker(x, y) {
        console.log("DRAWING");
        map.insertAdjacentHTML('beforeend', `<img class="marker nil" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Google_Maps_pin.svg/585px-Google_Maps_pin.svg.png" style="position: absolute; top: ${x - 35}px; left: ${y - 10}px;">`);
      };

      draw_marker(event.clientY, event.clientX);
    });
  };

  dropdown.addEventListener("click", (event) => {
    if (dropdown.value != "-1" && dropdown.value !=current_map ) {
      change_map(dropdown.value);
    }
  });





  let selected_id = "null";

  function card_on_click(card) {
    console.log("CLICK");
    card.classList.toggle('selected');
    if (selected_id == card.id) {
      selected_id = "null";
    } else if (selected_id != "null") {
      document.getElementById(selected_id).classList.toggle('selected');
      selected_id = card.id;
    } else {
      selected_id = card.id;
    };
  };


  let tags = [];
  const search_btn = document.querySelector('#tag-btn');

  function refresh_search_tags() {
    const search_tags = document.querySelectorAll('.select2-selection__choice');
    tags = [];
    search_tags.forEach((query) => {
      tags.push(query.getAttribute('title'));
    });
  }

  const cards = document.querySelectorAll('.card');
  cards.forEach( (card) => {
    card.addEventListener("click", (event) => {
      card_on_click(card);
    });
  });

  function refresh_cards() {
    cards.forEach((card) => {
      const card_tags = card.dataset.cardtags.split(',');
      tags.forEach( (tag) => {
        if (!card_tags.includes(tag)) {
          card.style.display = "none";
          return false;
        };
        card.style.display = "block";
        return true;
      });
    });
  };

  search_btn.addEventListener("click", (event) => {
    event.preventDefault();
    refresh_search_tags();
    refresh_cards();
  });


};

export { map_display };
