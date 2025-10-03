/// @description Saving/Loading
// You can write your code in this editor
timer += 1;

save_key = keyboard_check_pressed(ord("S"));
load_key = keyboard_check_pressed(ord("U"));

if (save_key) {
	scr_game_save();	
} else if (load_key) {
	scr_game_load();	
};
