/// @function		scr_front()
/// @description	Computes the maximum depth that an object can be placed at while still being in front of all of them
function scr_front(){

	dummy_return_val = -1;
	with(all) {
		if (id != other.id) {
			if (depth < other.dummy_return_val) {
				other.dummy_return_val = depth;	
			}
		}
	};
	return dummy_return_val - 1;
};