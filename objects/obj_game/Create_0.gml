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
	flags : {}	,
	
	background_sprite: false // Tracks what sprite the current room is using for the background
	// We need this in order for visuals to appear accurate after saving/loading
};

state.flags = {
	street_convo: false, // Set to true when the street conversation is completed
	
	shop_convo_start: false, // Set to true when the dialogue for the shop convo is triggered
	shop_convo: false, // Set to true when the shop conversation is completed
	research_convo_start: false, // Set to true when the research conversation is started
	flag_3: false,
	
	give_up: false, // This flag is used to require the player to pick the same option *twice* to give up on recovering Laser
	
	researcher_threaten: false, // Set to true if Temmie threatens the researcher
	researcher_strangle: false, // Set to true if Temmie strangles the researcher
	researcher_standdown: false	// Set to true if Temmie gives up on saving Laser
};

// We will set up music logic later on in the game
// init_setup = false;
// instance_create_depth(0,0,0,obj_music);

save_key = false;
load_key = false;