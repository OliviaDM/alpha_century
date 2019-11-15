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
    map_img.addEventListener("click", (event) => {
      // console.log(event);
      const h = document.getElementById("map-img").clientHeight;
      // console.log(h);

      function draw_marker(x, y) {
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
};

export { map_display };
