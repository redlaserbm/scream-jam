/// @description Insert description here
// You can write your code in this editor

// JAM NOTE: In Kala was Killed, this object had functionality to also
// display "mini" sprites that associate each line of dialogue with a speaker
// We are going to phase this out for the upcoming jam to reduce workload

event_inherited();

ind = -1;
text[0] = "text";
speaker[0] = "Laser";

depth = scr_front();

// Note: To stay consistent with textbox, we should consider
// having these dimensions declared in obj_init

// DIMENSIONS

nameplate_border_x = 20;
nameplate_border_y = 25;
nameplate_width = 175;

// We want to contain text on the right side of the screen,
// And leave a little room on the left to indicate who is speaking.

nameplate_x_offset = 0;
textbox_x_offset = nameplate_x_offset + nameplate_width;

// Determines how wide we will draw log textboxes
textbox_width = 640 - textbox_x_offset;

// Indicates how much space to give between the text and the text border.
text_border_x = 15;
text_border_y = 12;

line_sep = 24; // Determines the vertical spacing between lines of text
line_width = textbox_width - 2*text_border_x; // How much space should we give a single line of text?

// Determines how much vertical space to give between each textbox that shows up in the log. 
textbox_y_spacing = 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = spr_textbox;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

alpha = 0.85;

scroll_offset = 0;
scroll_speed = 25;

// obj_interactable SPECIAL ACTIVATE AND SPECIAL DEACTIVATE logic
special_activate = function() {
	depth = scr_front();	
};


append_entry = function(_text, _speaker) {
	// _speaker actually represents the *sprite* of the person speaking
	ind++;
	text[ind] = _text;
	speaker[ind] = ds_map_find_value(global.speaker, _speaker);
};

toggle_key = false;