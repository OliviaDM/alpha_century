import "bootstrap";
import "./tag_click";
import $ from 'jquery';
import 'select2';


import { draw_graph } from '../timeline_graph'
import { map_display } from '../map_display'
import { photo_upload } from '../photo_upload'

if (document.querySelector('#timeline')) {
  draw_graph();
}

if (document.querySelector('#map-select')) {
  map_display();
}

if (document.querySelector('.trix-content')) {
  photo_upload();
}

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

if (document.querySelector("#search_bar")) {
  let cities = document.querySelector("#search_bar").getAttribute("data-tags")
  let parse_search_data = JSON.parse(cities).tag
  $(document).ready(function() {
      $('.js-example-basic-multiple').select2({data: parse_search_data});
  });
};


import { TxtType } from '../typewriter.js'



