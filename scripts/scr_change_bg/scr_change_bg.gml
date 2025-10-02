// SCREAM JAM NOTE: We will probably phase this out and replace it with something else


// @param _spr
function scr_change_bg(_spr){
	var _lay_id = layer_get_id("Background");
	var _back_id = layer_background_get_id(_lay_id);
	layer_background_sprite(_back_id, _spr);
}