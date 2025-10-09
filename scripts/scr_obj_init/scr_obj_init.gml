// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_obj_init(){
	var _objects = [obj_game, obj_logger, obj_itemizer, obj_map, obj_load];

	for (var _i = 0; _i < array_length(_objects); _i++) {
		if (instance_number(_objects[_i]) < 1) {
			instance_create_depth(0,0,0, _objects[_i]);
		};
	};
	instance_destroy();
};