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
    map.innerHTML = `<img height="300" width="400" src="https://res.cloudinary.com/dhnkmpy8d/${new_map.photo}">`;
  };

  dropdown.addEventListener("click", (event) => {
    console.log(typeof(dropdown.value));
    if (dropdown.value != "-1" && dropdown.value !=current_map ) {
      change_map(dropdown.value);
    }
  });
};

export { map_display };
