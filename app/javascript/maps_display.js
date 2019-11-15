function map_display() {

  let selected_id = "null";

  function card_on_click(card) {
    card.toggleClass('selected');
    if (selected_id == card.id) {
      selected_id = "null";
    } else if (selected_id != "null") {
      document.getElementById(selected_id).toggleClass('selected');
      selected_id = card.id;
    } else {
      selected_id = card.id;
    };
  };

};

export { map_display }
