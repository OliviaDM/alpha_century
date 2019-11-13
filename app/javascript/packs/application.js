import "bootstrap";
import { draw_graph } from '../timeline_graph'

if (document.querySelector('#timeline')) {
  draw_graph();
}
