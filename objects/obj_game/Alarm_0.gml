/// @description Inform that the game has loaded

// WARNING: We have not yet defined obj_message in this game...
// NOTE: obj_message should have code to auto set its depth
instance_create_depth(0,0,16000, obj_message,{display_text: "File loaded"});