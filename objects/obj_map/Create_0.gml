/// @description Insert description here

// The purpose of this object is to provide a means from travelling from location to location
// For now, we will make it so that the map is summoned by using the "M" key.

event_inherited();

// Similar to obj_textbox, obj_map also requires options and consequences for picking those options
// This is interesting, because we may be able to 

// Initialize list of locations that we can travel to
locations = [];
location_names = [];
ind = -1;

append_location = function(_room, _display_name) {
	ind++;
	locations[ind] = _room;
	location_names[ind] = _display_name;
};

// Map locations
append_location(rm_test_street, "Street");
append_location(rm_test_shop, "Shop");
append_location(rm_research, "University");

hover_pos = -1;
option_pos = -1;

accept_key = false;
toggle_key = false;

timer = 0;