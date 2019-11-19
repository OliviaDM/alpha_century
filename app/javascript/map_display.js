import $ from 'jquery'

function map_display() {


  const dropdown = document.querySelector("#map-select");
  const maps_info = JSON.parse(document.querySelector('#map').dataset.hash);
  const map = document.querySelector('#map');
  const obliterate_button = document.querySelector("#delete_marker");
  const token = $('meta[name=csrf-token]').attr('content');
  let h;
  let w = document.documentElement.clientWidth / 2

  let current_map = "-1";

  obliterate_button.addEventListener("click", (event) => {
    if (selected_id != "null") {
      if (document.querySelector(`#marker-${selected_id}`)) {
        document.querySelector(`#marker-${selected_id}`).remove()
        const fd = new FormData()
        const test = JSON.stringify({map_id: `${current_map}`, card_id: `${selected_id}`})
        fd.append('coordinates', test)
        let coordinate_object;

        fetch('/coordinates/destroy',
          { method: "POST",
            body: fd,
            headers: {
              'X-CSRF-Token': token
            },
            credentials: 'same-origin'
          }
        )
      }
    }
  });

  function find_map(id) {
    return maps_info.maps.find(e => e.id.toString() == id);
  }
  function marker_pop_up(id) {
      let e = document.getElementById(`parent-${id}`);
      e.onmouseover = function() {
      document.getElementById(`popup-${id}`).style.display = 'block';
      }
      e.onmouseout = function() {
      document.getElementById(`popup-${id}`).style.display = 'none';
      }
    }

  function change_map(id) {
    current_map = id;


    const new_map = find_map(id);

    w = document.documentElement.clientWidth / 2;
    map.innerHTML = `<img id="map-img" width="${w}" src="https://res.cloudinary.com/dhnkmpy8d/${new_map.photo}" style="position: relative;">`;

    const map_img = document.querySelector("#map-img");
    const map_x = map_img.offsetTop;
    const map_y = map_img.offsetLeft;

    map_img.addEventListener("contextmenu", (event) => {
      // console.log(event);

      console.log(event);
      event.preventDefault();
      h = document.getElementById("map-img").clientHeight;

      // const token = $('meta[name=csrf-token]').attr('content')
      //const card_id = document.querySelector(".selected")

      const fd = new FormData()
      const test = JSON.stringify({ long: `${event.offsetX * 1.0 / w }`, lat: `${event.offsetY * 1.0 / h}`, map_id: `${current_map}`, card_id: `${selected_id}`})
      fd.append('coordinates', test)
      let coordinate_object;

      fetch('/coordinates/create',
        { method: "POST",
          body: fd,
          headers: {
            'X-CSRF-Token': token
          },
          credentials: 'same-origin'
        })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        coordinate_object = data;
        if(selected_id != "null") {
          draw_marker(event.offsetY, event.offsetX);
          }
        });
        // .then(json => console.log(json));

      function draw_marker(x, y) {
        if(document.querySelector(`#marker-${selected_id}`)){
          document.querySelector(`#marker-${selected_id}`).remove()
        }
        const title = document.getElementById(`${selected_id}`).innerText;
        map.insertAdjacentHTML('beforeend', `<div id="parent-${selected_id}"><img id="marker-${selected_id}" class="marker nil" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Google_Maps_pin.svg/585px-Google_Maps_pin.svg.png" style="position: absolute; top: ${x + 40}px; left: ${y - 10}px;"><div id="popup-${selected_id}" style="background-color: white; display: none; position: absolute; top: ${x + 40}px; left: ${y + 10}px;">${title}</div></div>`);
        marker_pop_up(selected_id)
      };

      // draw_marker(event.clientY, event.clientX);
      // console.log(coordinate_object)
      // draw_marker(event.offsetY, event.offsetX, coordinate_object["id"]);
    });
    const card_id_array = []
    document.querySelectorAll(".card").forEach(element => card_id_array.push(element.id))
    map_img.addEventListener("load", e =>
      display_markers(card_id_array)
    )
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
    const array_of_id = [];
    cards.forEach((card) => {
      const card_tags = card.dataset.cardtags.split(',');
      tags.forEach( (tag) => {
        if (!card_tags.includes(tag)) {
          card.style.display = "none";
          return false;
        };
        card.style.display = "block";
        array_of_id.push(card.id)
        return true;
      });
    });
    display_markers(array_of_id)
  };

  search_btn.addEventListener("click", (event) => {
    event.preventDefault();
    refresh_search_tags();
    refresh_cards();
  });
  function display_markers(array) {
    document.querySelectorAll(".marker").forEach(element => element.remove())
    const fd = new FormData()
    let h = document.getElementById("map").clientHeight
    const test = JSON.stringify({map_id: `${current_map}`, card_ids: `${array}`})
    fd.append('coordinates', test)
    let coordinate_object;

    fetch('/coordinates/index',
      { method: "POST",
        body: fd,
        headers: {
          'X-CSRF-Token': token
        },
        credentials: 'same-origin'
      })
    .then(response => response.json())
    .then(data => {
      console.log(data)
      data.forEach((element) => {
        const title = document.getElementById(`${element.card_id}`).innerText;
        map.insertAdjacentHTML('beforeend', `<div id="parent-${element.card_id}"><img id="marker-${element.card_id}" class="marker nil" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Google_Maps_pin.svg/585px-Google_Maps_pin.svg.png" style="position: absolute; top: ${(parseFloat(element.lat) * h) + 40}px; left: ${(parseFloat(element.long) * w) - 10}px;"><div id="popup-${element.card_id}" style="background-color: white; display: none; position: absolute; top: ${(parseFloat(element.lat) * h) + 40}px; left: ${(parseFloat(element.long) * w) + 10}px;">${title}</div></div>`);
        marker_pop_up(element.card_id);
      });
      }
    );
  };
};

export { map_display };
