/// @description Insert description here
// You can write your code in this editor

var _start_key = keyboard_check_pressed(vk_enter);

if (_start_key) {
	instance_create_depth(0,0,depth-1,obj_transition, {target_room: rm_chinese});
};