/// @description Saving/Loading

timer += 1;

save_key = keyboard_check_pressed(ord("S"));
load_key = keyboard_check_pressed(ord("U"));

if (save_key) {
	scr_game_save();	
} else if (load_key) {
	scr_game_load();	
};

// DEV NOTE: This code may not follow best practices
