/// @function scr_option(_option, _link_id)
/// @param	{string}	_option
/// @param	{string}	_link_id
function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}