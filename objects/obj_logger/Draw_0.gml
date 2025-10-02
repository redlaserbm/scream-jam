/// @description Insert description here
// You can write your code in this editor

// Key for bringing up the logger
toggle_key = keyboard_check_pressed(ord("L"));

var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]);

var _up = mouse_wheel_up();
var _down = mouse_wheel_down();

var _aggregate_height = 0;

// Activate or deactivate the logger as deemed necessary if the toggle key is pressed.
if (toggle_key) {
	if (state.active) {
		scr_deactivate();	
	} else {
		scr_activate();
	}
};

if state.active {
	// Do not try to draw the logs unless the logger is active
	
	// We will compute the maximum nameplate width by considering the names of all speakers
	
	// I'll use this variable to automatically determine the y-coordinate of each textbox in the logger.
	var _textbox_y_offset = 480;
	
	for (var _i = array_length(text)-1; _i > -1; _i--) {
		
		var _str_height = string_height_ext(text[_i], line_sep, line_width);
		var _line_height = string_height_ext("foo", line_sep, line_width);
		var _textbox_height = _str_height + 2*text_border_y;
		
		// Draw the nameplate
		draw_sprite_ext(textbox_spr, textbox_img, 
		_textbox_x, 
		_textbox_y + _textbox_y_offset - _textbox_height  + scroll_offset, 
		min(nameplate_width, string_width(speaker[_i]) + 2*nameplate_border_x)/textbox_spr_w, 
		(_line_height + 2*text_border_y)/textbox_spr_h, 
		0, c_white, alpha
		);
		
		// Draw the text on the nameplate
		var _drawtext = speaker[_i];
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_ext(_textbox_x + nameplate_border_x, _textbox_y + _textbox_y_offset - _textbox_height + text_border_y + scroll_offset, _drawtext, line_sep, line_width);
		
		
		// Draw the textbox
		draw_sprite_ext(
		textbox_spr, textbox_img, 
		_textbox_x + textbox_x_offset, 
		_textbox_y + _textbox_y_offset - _textbox_height  + scroll_offset, 
		textbox_width/textbox_spr_w, 
		(_str_height + 2*text_border_y)/textbox_spr_h,
		0, c_white, alpha
		);
		
		_aggregate_height += _textbox_height;
		
		// Draw the text on the textbox
		var _drawtext = text[_i];
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_ext(_textbox_x + textbox_x_offset + text_border_x, _textbox_y + _textbox_y_offset - _textbox_height + text_border_y + scroll_offset, _drawtext, line_sep, line_width);
		
		// JAM NOTE: We will be phasing this out and replacing it with a nameplate to reduce workload
		// Determine the y offset for the *next* textbox.
		_textbox_y_offset -= _textbox_height;
	}
} else {
	scroll_offset = 0;	
}

if _up && (480 - _aggregate_height + scroll_offset <= 0) {
	scroll_offset += scroll_speed;	
} else if _down {
	scroll_offset -= scroll_speed;	
}

if scroll_offset < 0 {
	scroll_offset = 0;	
}