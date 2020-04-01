import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initSlot } from './init_slot';
import { initBookmark } from './init_bookmark';
import { changeLogoColor } from './navbar';
require("chartkick")
require("chart.js")

initMapbox();
initSlot();
initBookmark();
