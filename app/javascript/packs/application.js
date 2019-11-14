import "bootstrap";
import "./tag_click";

import { draw_graph } from '../timeline_graph'
import { map_display } from '../map_display'

if (document.querySelector('#timeline')) {
  draw_graph();
}

if (document.querySelector('#map-select')) {
  map_display();
}

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));


import { TxtType } from '../typewriter.js'


