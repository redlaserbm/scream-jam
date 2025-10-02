/// @function scr_draw_options(_xval, _yval, _options, _alignment);
/// @param {real}	_xval		The x-coordinate to place the options menu at.
/// @param {real}	_yval		The y-coordinate to place the options menu at.
/// @param {array}	_options	An array of strings denoting possible choices to pick from.
/// @param {bool}	_accept_key For checking whether the player pressed the accept key or not.
/// @param {string} _alignment	Determines how to place the options panel given _xval, _yval
/// @param {struct} _settings	Struct containing parameters that determine how the script will format the options menu.
/// @description Draws a list of options on screen for the player to choose from.
/// We recommend that the object that calls this script has state variables "options" and "hover_pos".
/// However, the script uses local variables "_options" and a return value "_hover_pos" to allow for flexibility where needed.
/// @return  {struct}  Contains information on which option is hovered and which one is picked, if applicable
function scr_draw_options(_xval, _yval, _options, _accept_key, _alignment = "top_left", _settings = global.textbox) {
	// JAM note: I'm going to simplify the code for now by removing slider support.
	// We can reintroduce it later by revisiting the code for "Kala was Killed".

	// Set the font
	draw_set_font(_settings.font);
	
	// ### COMPUTE DIMENSIONS OF OPTIONS MENU 
	
	// How *wide* should the options dialogue be?
	var _max_width = 0;
	for (var _i = 0; _i < array_length(_options); _i++) {
		var _w = string_width(_options[_i]);
		if _w > _max_width {
			_max_width = _w;	
		}
	}
	var _option_width = _max_width + 2*_settings.option_border_x;
	
	// How *high* should the options dialogue be?
	var _option_height = 2*_settings.option_border_y
	_option_height = _option_height + _settings.line_sep*(array_length(_options)-1)
	_option_height = _option_height + string_height(_options[array_length(_options)-1]);
	
	// ### MODIFY COORDINATES BASED ON ALIGNMENT
	
	switch (_alignment) {
		case "top_left":
			break;
		case "bottom_left":
			_yval = _yval - _option_height;
			break;
		case "top_right":
			_xval = _xval - _option_width;
			break;
		case "bottom_right":
			_yval = _yval - _option_height;
			_xval = _xval - _option_width;
			break;
	}
	
	// Draw the back of the textbox
	draw_sprite_ext
	(
		_settings.textbox_spr, 
		0, _xval, _yval, 
		_option_width/_settings.textbox_spr_w, 
		_option_height/_settings.textbox_spr_h, 
		0, c_white, _settings.alpha
	);
	
	// ### DRAW OPTIONS & COMPUTE HOVERED/PICKED OPTION
	
	var _mx = mouse_x;
	var _my = mouse_y;
	var _nudge = 0;
	
	var _hover_pos = -1; // For computing which option the player is hovering over
	var _option_pos = -1; // For computing which option the player has selected (i.e. when _accept_key is true)
	
	// Draw each option available to the player. 
	for (var _i = 0; _i < array_length(_options); _i++) {
		
		var _x1 = _xval + _settings.option_border_x;
		var _y1 =  _yval + _settings.option_border_y + _nudge;
		// If that option is currently being hovered over by the mouse, *highlight* that option...
		if point_in_rectangle(_mx, _my, _x1, _y1, _x1 + string_width(_options[_i]), _y1 + string_height(_options[_i])) {
			_hover_pos = _i;
			draw_sprite_stretched
			(
				spr_black,
				0,
				_x1 - _settings.highlight_border_x, 
				_y1 - _settings.highlight_border_y,
				string_width(_options[_i]) + 2*_settings.highlight_border_x, //width
				string_height(_options[_i]) + 2*_settings.highlight_border_y //height
			);
			// If that option is activing being selected by the player, indicate as such in the return values.
			if _accept_key {
				// audio_play_sound(snd_click, 1, false, global.settings.volume*global.settings.volume_sfx);
				_option_pos = _i;
			}
		}
		
		// We need to change the text color of the highlighted option (if it exists) so the text is visible
		var _drawoption = _options[_i];
		var _color = make_color_rgb(255,255,255);
		if (_i == _hover_pos) {
			draw_text_colour(_x1, _y1, _drawoption, _color, _color, _color, _color, 255);
		} else {
			draw_text_ext(_x1, _y1, _drawoption, _settings.line_sep, 640);
		}
		
		_nudge += _settings.line_sep;
	}
	
	return {
		hover: _hover_pos,
		option: _option_pos
	};
};