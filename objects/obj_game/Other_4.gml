/// @description Room start trigger events

// Generally, the purpose of obj_game's Room Start, obj_game being the object that tracks the 
// game's state (through state.flags) is to:
// 1. Trigger contextual dialogue for certain (flag, room) combos
// 2. Ensure the game is reading dialogue from the correct dictionary.

// The code uses multiple dictionaries for cleanliness sake. 
// Go to Scripts/Dictionaries for more on this.

// Ensure game is reading dialogue from the correct dictionary
// The prototype can just have all text from the same dictionary,
// but we'll want to change this later...
switch (room) {
	case rm_test_shop:
		global.dictionary = scr_dict_prototype;
		break;
	case rm_test_street:
		global.dictionary = scr_dict_prototype;
		break;
}

// This object spawns multiple other important objects essential to the game.
// The reason for having separate objects over containing everything in obj_game is code cleanliness purposes

// Always trigger the street convo upon entering the street
if (room == rm_test_street) {
	if !(state.flags.street_convo) { scr_textbox_create("street") };
} else if (room == rm_test_shop) {
	if !(state.flags.shop_convo) { scr_textbox_create("shop") };	
}