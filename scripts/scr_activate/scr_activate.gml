/// @function	scr_activate(_instance, _memorize);
/// @param	{index}		_instance	The instance of obj_interactable to activate
/// @param	{bool}		_memorize	Determines whether to record which obj was previously active
/// @description					Activates an object within the activeSys code base. See nt_interactable for more information .
function scr_activate(_instance = self, _memorize = true){
	
	// SCREAM JAM NOTE: In Kala was Killed, we *always* chose to memorize the previous object
	// To check whether we needed to access it after deactivating the currently active object
	// For now, we will continue to adopt this practice
	
	var _previous_active = noone;
	
	// Make all interactables inactive
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		var _interactable = instance_find(obj_interactable,_i);
		
		// NOTE: Our current infrastracture does NOT support multiple items being active at once
		
		if variable_instance_exists(_interactable, "state") && variable_struct_exists(_interactable.state, "active") && _interactable.state.active {
			_previous_active = _interactable;
			show_debug_message("scr_activate: Deactivating " + object_get_name(_interactable.object_index) + "[" + string(real(_interactable)) + "]");
			_interactable.state.active = false;
		}
	}
	
	// Make the target interactable active
	if instance_exists(_instance) {
		
		//show_debug_message("Trying to activate:");
		//show_debug_message(_instance);
		
		// Make the instance active
		_instance.state.active = true;
		
		// Memorize the previous active instance
		with (_instance) {
			if struct_exists(state, "previous_active") && _memorize {
				state.previous_active = _previous_active;
				if _previous_active != noone {
					_previous_active.state.standby = true;
				}
			}
		}
		
		// If there are any special instructions this specific instance needs to follow when activated...
		_instance.special_activate();
	
		show_debug_message("scr_activate: New active item " + object_get_name(_instance.object_index) + "[" + string(real(_instance)) + "]");
		if _previous_active != noone {
			show_debug_message("scr_activate: This item memorized: " + object_get_name(_previous_active.object_index) +  "[" + string(real(_previous_active)) + "]");
		}
	} else {
		show_debug_message("scr_activate: Tried to activate [" + string(real(_instance)) + "] but failed!");
	}
	// show_debug_message(obj_game.state.previous_active_item);
}