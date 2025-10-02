/// @description game state initialization

depth = 2;
timer = 0;



game_loaded = false;

// State is a struct which encapsulates all info the game needs to know in order
// to save/load properly.

// Other objects will interact with obj_game.state by inserting other attributes into it
// but obj_game to start needs to know about its own flags...

// Question: If we load a save state, how does obj_game know to update these flags?
state = {
	flags : {}	
}
state.flags = {
	flag_1: false,
	flag_2: false,
	flag_3: false
}

// We will set up music logic later on in the game
// init_setup = false;
// instance_create_depth(0,0,0,obj_music);