/// @description Insert description here
// You can write your code in this editor

// Controls for toggling the map
toggle_key = keyboard_check_pressed(ord("M"));
accept_key = mouse_check_button_pressed(mb_left) && state.active && timer > 2;

if (toggle_key) {
	if (state.active) {
		scr_deactivate();
		option_pos = -1;
	} else {
		scr_activate();
	}
};

// Draw the map when it is active
if (state.active) {
	depth = scr_front();
	timer++;
	
	var _return_val = scr_draw_options(0,0,location_names, accept_key);
	if (_return_val.option > -1) {option_pos = _return_val.option};
	
	if (option_pos > -1) {
		var _target_room = locations[option_pos];
		// JAM NOTE: GPT has advised it may be a bad practice to use room_goto
		// in a Draw event. Consider reworking the code so this doesn't happen.
		if (room != _target_room) {
			scr_deactivate();
			room_goto(_target_room);
		};
	};
} else {
	timer = 0;	
};

if (instance_number(obj_map) > 1) {
	show_debug_message("Warning, more than one instance of obj_map detected!");
};