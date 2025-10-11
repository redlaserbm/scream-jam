// These scripts contain END ACTIONS
// When a textbox is finished running and has end actions associated with it...
// It will run those end actions before destroying itself! 

// SCREAM JAM NOTE: It is possible a number of these functions may not get utilized
// in this jam. I think the following scripts are definitely important, however:
// scr_goto
// scr_room_goto
// scr_flag

function scr_add_items(_items = [], _context = obj_inventory, _instant = false) {
	// For each item in _items, make sure the item doesn't already exist in the inventory
	if _instant {
		for (var _i = 0; _i < array_length(_items); _i++) {
			var _already_exists = false;
			for (var _j = 0; _j < array_length(_context.state.inventory); _j++) {
				if _context.state.inventory[_j] == _items[_i] {
					_already_exists = true;
					break;
				}
			}
			if !_already_exists {
				array_push(_context.state.inventory, _items[_i]);
			}
		}
	} else {
		context = _context;
		items = _items;
		var _method = function() {
			for (var _i = 0; _i < array_length(items); _i++) {
				var _already_exists = false;
				for (var _j = 0; _j < array_length(context.state.inventory); _j++) {
					if context.state.inventory[_j] == items[_i] {
						_already_exists = true;
						break;
					}
				}
				if !_already_exists {
					array_push(context.state.inventory, items[_i]);
				}
			}
			
			var _message = "Obtained ";
			for (var _i = 0; _i < array_length(items); _i++) {
				_message = _message + items[_i];
				if (_i < array_length(items) - 1) {
					_message = _message + ", "
				}
			}
			instance_create_depth(0,0,depth, obj_message, {display_text: _message});
		}
		array_push(end_action, _method);	
	}
}

function scr_remove_items(_items = [], _context = obj_inventory, _instant = false) {
	var _i = 0;
	var _inv = _context.state.inventory;
	
	e_inv = _inv;
	e_items = _items;
	e_context = _context;
	
	var _method = function () {
		var _i = 0;
		while _i < array_length(e_inv) {
			// Check whether the given item is an item that belongs to the list of items to remove
			// If it does, then remove it
			var _j = 0;
			var _inc_ind_i = true;
			while _j < array_length(e_items) {
				if e_inv[_i] == e_items[_j] {
					array_delete(e_inv, _i, 1);
					array_delete(e_items, _j, 1);
					if _i == e_context.click_pos {
						e_context.click_pos = -1;	
					} else if _i < e_context.click_pos {
						e_context.click_pos -= 1;
					}
					_inc_ind_i = false;
					break;
				}
				_j++;
			}
			if _inc_ind_i {
				_i = _i + 1;	
			}
		}	
	}

	if _instant {
		_method();
	} else {
		array_push(obj_textbox.end_action, _method);
	}	
}

function scr_goto(_name, _dictionary = global.dictionary){
	// This script is useful if there's multiple lines of dialogue that need to lead into the same text at the end 
	goto_string = _name;
	var _method = function() { 
		scr_textbox_create(goto_string);
	};
	array_push(end_action, _method);
}

function scr_room_goto(_name, _instant = false){
	room_name = _name;
	
	if _instant {
		instance_create_depth(0,0,depth-1,obj_transition, {target_room: room_name})
	} else {
		var _method = function() {
			if room_exists(room_name) {
				instance_create_depth(0,0,depth-1,obj_transition, {target_room: room_name})
			}
		}
		array_push(end_action, _method);
	}
}

function scr_flag(_name, _instant = false, _value = true){
	
	hash = variable_get_hash(_name);
	value = _value;
	
	if _instant {
		struct_set_from_hash(obj_game.state.flags, hash, value);
	} else {
		var _method = function() {
			struct_set_from_hash(obj_game.state.flags, hash, value);
		}
		array_push(end_action, _method);
	}
}

function scr_remove_from_room(_room, _item){
	// Removes item _item from being shown in room _room
	// Some items may need to persist after being removed from the room
	
	e_room = _room;
	e_item = _item;
	var _method = function() {
		with obj_itemizer {
			var _current_item_pool = ds_map_find_value(room_items, other.e_room);
			for (var _i = 0; _i < array_length(_current_item_pool); _i++) {
				if _current_item_pool[_i] == other.e_item {
					array_delete(_current_item_pool, _i, 1);	
				}
			}
		}
		
		for (var _i = instance_number(other.e_item) - 1; _i > -1; _i--) {
			var _item = instance_find(other.e_item,_i);
			if object_get_name(_item.object_index) != object_get_name(itm_news) {
				instance_destroy(instance_find(other.e_item,_i));
			}
		}
	}
	array_push(end_action, _method);
}

function scr_atmosphere(_bg = ds_map_find_value(global.room_bg, room), _snd = ds_map_find_value(global.room_music, room)) {
	end_snd = _snd;
	end_bg = _bg;
	var _method = function() {
		with (obj_game) {
			bg_new = end_bg;
			bg_music_new = end_snd;
		}
	}
};

function scr_change_atmosphere(_bg) {
	e_bg = _bg;
	// First, get the background ID
	var _method = function() {
		show_debug_message("scr_change_atmosphere: Firing!")
		var _layer_id = layer_get_id("Background");
		var _background_id = layer_background_get_id(_layer_id);
	
		// What is the current background sprite?
		var _background_sprite = layer_background_get_sprite(_background_id);
		
		show_debug_message("scr_change_atmosphere: Old bg sprite - " + string(_background_sprite));
		show_debug_message("scr_change_atmosphere: New bg sprite - " + string(e_bg));
	
		// Instantly change the background, but add a fade to disguise this *instantaneous* nature of the change
		instance_create_depth(0,0,0, obj_bg_change, {old_bg_spr: _background_sprite});
		layer_background_sprite(_background_id, e_bg);
		
		// Make sure obj_game knows this change occurred for proper saving/loading
		obj_game.state.background_sprite = e_bg;
	};
	array_push(end_action, _method);
		
};

function scr_open_inventory(_context = noone) {
	// Opens the inventory
	// If _context is specified as anything other than noone
	
	// This is admittedly awfully written code...
	e_context = _context;
	
	var _method = function() {
		var _e_context = e_context;
		with (obj_inventory) {
			if _e_context != noone {
				state.detective = _e_context;
			}
			scr_activate();	
		}
		instance_destroy();
	}
	array_push(end_action, _method);
		
}

function scr_map_poll(_context = false) {
	// This function is *specifically* designed for the interaction with the crime scene map
	// that occurs during Leif's interrogation. I will generalize it later if it needs to be generalized
	e_context = _context;
	var _method = function() {
		itm_map.state.context_check = e_context;
		scr_activate(itm_map);	
	}
	array_push(end_action, _method);
}

function scr_change_music(_music, _fade_time = obj_music.music_fade_time) {
	e_music = _music;
	var _method = function () {
		obj_music.bg_music_new = e_music;	
	}
	array_push(end_action, _method);
}