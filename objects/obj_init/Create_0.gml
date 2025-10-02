/// @description Insert description here
// Creates all persistent objects responsible for tracking the state of the game
// Then, destroys itself;

objects = [obj_game, obj_logger, obj_itemizer, obj_map];

for (var _i = 0; _i < array_length(objects); _i++) {
	if (instance_number(objects[_i]) < 1) {
		instance_create_depth(0,0,0, objects[_i]);
	};
};

instance_destroy();
