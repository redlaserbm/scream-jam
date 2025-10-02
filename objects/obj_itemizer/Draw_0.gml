/// @description Insert description here
// You can write your code in this editor

// This code runs when:
// 1. We enter a room
// 2. We load a save file

// INITIAL ROOM SETUP
if !room_setup {
	room_setup = true;
	
	// Destroy any previous created items (from the previous room)
	active_items = [];
	for (var _i = 0; _i < array_length(created_items); _i++) {
		with (created_items[_i]) {
			instance_destroy();
		}
	}
	
	// What items are intended to be present in the room?
	active_items = ds_map_find_value(room_items, room);

	// TODO: For each item in the item list, determine whether or not that item *should* be in the room rn 
	// by checking against global flags.
	
	// For each item in the list, create that item!
	created_items = [];
	for (var _i = 0; _i < array_length(active_items); _i++) {
		created_items[_i] = instance_create_depth(0,0,0,active_items[_i]);	
	}
}

// For each item, identify a bounding box that, if clicked, leads to an interaction with the item.
// TODO: It would be nice if the bounding box was more complex than just a rectangle.


// Determine whether it should be possible to create intereactions with interactables
// Set to false if we are already interacting with an object of some kind
var _can_explore = true;
for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
	var _interactable = instance_find(obj_interactable, _i);
	if _interactable.state.active {
		fudge_factor = 0;
		_can_explore = false;
		break;
	}
}
fudge_factor += 1;

// For each item that exists in the room, check whether or not our mouse is hovering over that object
// If our mouse is hovering over the object, show the bounding box to the player
var _old_ind = highlighted_ind;
if fudge_factor >= 3 {
	var _mx = mouse_x;
	var _my = mouse_y;
	var _left_click = mouse_check_button_pressed(mb_left);
	
	highlighted_ind = -1;
	for (var _i = 0; _i < array_length(active_items); _i++){
		// The extra logic at the end handles an edge case where we may be hovering over two items at once.
		// The code prioritizes the object we were already hovering over in this case.
		if collision_point(_mx, _my, active_items[_i], true, true) && ((_old_ind == -1) || (_old_ind == _i)) {
			highlighted_ind = _i;
		}
	}
	
	// TODO: Some items should NOT be highlighted when we put our mouse over them (like when interacting with Kala's computer)
	// We need to take note of this.
	if highlighted_ind >= 0 {
		draw_sprite_ext
		(
			object_get_sprite(active_items[highlighted_ind]),
			active_items[highlighted_ind].image_index,
			active_items[highlighted_ind].x, active_items[highlighted_ind].y,
			1, //width
			1, //height
			0,
			make_color_rgb(275,26,66),
			0.5
		);
		if _left_click {
			audio_play_sound(snd_click, 1, false, 0.25);
			with (active_items[highlighted_ind]) {
				scr_activate();	
			}
		}
	}
}