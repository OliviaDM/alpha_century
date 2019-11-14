import "bootstrap";
import "./tag_click";
import $ from 'jquery';
import 'select2';


import { draw_graph } from '../timeline_graph'

if (document.querySelector('#timeline')) {
  draw_graph();
}

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));


let cities = document.querySelector("#search_bar").getAttribute("data-tags")
let parse_search_data = JSON.parse(cities).tag

$(document).ready(function() {
    $('.js-example-basic-multiple').select2({data: parse_search_data});
});

