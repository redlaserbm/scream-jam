// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_obj_init(){
	var _objects_to_load = [obj_logger, obj_itemizer, obj_map];
	for (var _i = 0; _i < array_length(_objects_to_load); _i++) {
		if instance_number(_objects_to_load[_i]) < 1 {
			instance_create_depth(0,0,-1,_objects_to_load[_i]);
		}
	}
}