/// @description Room start trigger events

// Generally, the purpose of obj_game's Room Start, obj_game being the object that tracks the 
// game's state (through state.flags) is to:
// 1. Trigger contextual dialogue for certain (flag, room) combos
// 2. Ensure the game is reading dialogue from the correct dictionary.

// The code uses multiple dictionaries for cleanliness sake. 
// Go to Scripts/Dictionaries for more on this.

// Ensure game is reading dialogue from the correct dictionary
switch (room) {
	case rm_test_shop:
		global.dictionary = scr_dict_chinese;
		break;
	case rm_chinese:
		global.dictionary = scr_dict_chinese;
		break;
	case rm_research:
		global.dictionary = scr_dict_university;
		break;
	case rm_hallway:
		global.dictionary = scr_dict_hallway;
		break;
}

// This object spawns multiple other important objects essential to the game.
// The reason for having separate objects over containing everything in obj_game is code cleanliness purposes

// Always trigger the street convo upon entering the street
if (room == rm_chinese) {
	if !(state.flags.shop_convo_start) { scr_textbox_create("chinese") };
} else if (room == rm_test_shop) {
	if !(state.flags.shop_convo) { scr_textbox_create("shop") };	
} else if (room == rm_research) {
	if !(state.flags.research_convo_start) { 
		show_debug_message("obj_game: Triggered textbox agi");
		scr_textbox_create("agi") 
	};	
} else if (room == rm_hallway) {
	
	// The end conversation that triggers in the hallway depends on what Temmie did
	// to the researcher in the research lab.
	if (state.flags.researcher_threaten) {
		scr_textbox_create("epilogue_threaten");	
	} else if (state.flags.researcher_strangle) {
		scr_textbox_create("epilogue_strangle");	
	} else {
		scr_textbox_create("epilogue_standdown");	
	};
}

// Identify what the current room is using as a background sprite
var _layer_id = layer_get_id("Background");
var _background_id = layer_background_get_id(_layer_id);
	
// What is the current background sprite?
state.background_sprite = layer_background_get_sprite(_background_id);