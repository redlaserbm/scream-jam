/// @description Insert description here
// This object displays quick notifications, which for this game will only apply during saving/loading

// WARNING: For brevity's sake, I've copy-pasted code from Kala is Killed for this object
// This code does not follow some of the updated coding practices adopted for obj_textbox

depth = scr_front();

var _struct = global.textbox; 

// Unlike in that tutorial, we need separate variables for the x and y borders
textbox_width = _struct.textbox_width;

text_border_x = _struct.text_border_x;
text_border_y = _struct.text_border_y;

line_width = textbox_width - text_border_x - text_border_y - 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = _struct.textbox_spr;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

// the text
page = 0;
page_number = 0;

if !variable_instance_exists(self, "display_text") {
	display_text = "sample text";
}

alarm[0] = 120;

alpha = _struct.alpha;

show_debug_message("GOT TO HERE");
show_debug_message(display_text);