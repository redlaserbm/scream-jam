/// @description Variable initialization

event_inherited();
scr_activate();

depth = scr_front();

// Contains global settings for *all* textboxes in the game
settings = global.textbox; 

// SETTINGS THAT ARE PARTICULAR TO THIS TEXTBOX ONLY:

// Certain global variables may need to be overridden
// We setup that overwriting here
option_width = settings.option_width;
option_height = settings.option_height;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_img = 0;
textbox_img_speed = 6/60;

// the text
page = 0; // page as a state variable helps the textbox "remember" where it's at during save/load operations.
page_number = 0;

// LASER NOTE: When using scr_text, this line gets overwritten. It's just here so the compiler doesn't get mad at us.
text[0] = "text";
portrait[0] = spr_laser;
image[0] = 0;
methods[0] = []; // Useful for displaying images along with text in particular

bg[0] = noone;
sound[0] = noone;
is_visible[0] = true;

// When saving the game, we need to know the text_id that was used to create it so we can reconstruct the text upon loading the game again
text_id = "";

// Options
option[0] = "Yes";
option_link_id[0] = noone;

option_pos = -1;
// hover_pos = -1;
option_number = 0;

text_length[0] = string_length(text[0]);
draw_char = 0;

text_speed = 0.5;

// ADDITIONAL SETUP VARIABLES

setup = false;

accept_key = false;
skip_key = false;
up_down_input = false;

timer = 0;

// FORCE VARIABLES / END ACTIONS

// Array of method variables which prescribes actions to take upon deletion of the textbox
end_action[0] = function() {
};

// When loading a new save state, you should destroy the current textbox without running its end actions. 
// Set this variable to true whenever that's necessary
force_destroy = false;

// This property causes a textbox to NOT wait for the player before advancing dialogue.
// Useful for flavor dialogue scenarios
force_go = false;

// obj_interactable SPECIAL ACTIVATE AND SPECIAL DEACTIVATE logic
special_activate = function() {
	depth = scr_front();	
};