import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initSlot } from './init_slot';
import { initBooking } from './init_booking';
import { initBookmark } from './init_bookmark';

initMapbox();
initSlot();
initBooking();
initBookmark();
