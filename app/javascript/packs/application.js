import "bootstrap";

import { draw_graph } from '../timeline_graph'

if (document.querySelector('#timeline')) {
  drawgraph();
}

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

import { TxtType } from '../typewriter.js'
