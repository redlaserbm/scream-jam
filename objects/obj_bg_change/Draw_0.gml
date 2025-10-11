/// @description Insert description here
// You can write your code in this editor
timer += 1;
show_debug_message("obj_bg_change: Timer - " + string(timer));
draw_sprite_ext(old_bg_spr, 0, 0, 0, 1, 1, 0, c_white, max((fade_time - timer)/fade_time, 0));

if (timer >= fade_time) {
	instance_destroy();	
}