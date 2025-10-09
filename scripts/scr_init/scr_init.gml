// This script defines all global variables the game needs to run properly

// ### SPEAKERS ###

// Puts the correct name to the correct speaker in dialogue
speaker = ds_map_create();
ds_map_add(speaker, spr_temmie, "Temmie");
ds_map_add(speaker, spr_laser, "Laser");
ds_map_add(speaker, spr_researcher, "Researcher");

// ### FONT ###

// What font will we use for drawing text? What color should that font be?
main_font = fnt_ocr;
main_font_color = make_color_rgb(255,255,255);

// ### TEXTBOX ###

// Defining constants
textbox = 
{
	textbox_width: 640,
	textbox_height: 112,
	
	textbox_offset_x: 0,
	textbox_offset_y: 368,
	
	text_border_x: 24,
	text_border_y: 21,
	
	option_border_x: 24,
	option_border_y: 18,
	
	option_width: 0,
	option_height: 80,
	
	highlight_border_x: 1,
	highlight_border_y: 1,
	
	nameplate_offset_x: 0,
	nameplate_offset_y: 0,
	
	nameplate_width: 384,
	nameplate_height: 48,
	
	nameplate_border_y: 14,
	
	line_sep: 24,
	
	alpha: 0.85,
	
	textbox_spr: spr_textbox,
	cursor_spr: spr_cursor,
	
	slider_width: 100,
	
	alpha: 0.85,
	
	font: main_font,
	font_color: main_font_color,
	
	// typewriter_sound: snd_click,
	// advance_sound: snd_click
	
};

// Defining dependent variables
textbox.line_width = textbox.textbox_width - textbox.text_border_x - textbox.text_border_y;
textbox.textbox_spr_w = sprite_get_width(textbox.textbox_spr);
textbox.textbox_spr_h = sprite_get_height(textbox.textbox_spr);

textbox.nameplate_offset_y = 480 - textbox.textbox_height - textbox.nameplate_height;

textbox.cursor_spr_w = sprite_get_width(textbox.cursor_spr);
textbox.cursor_spacing = 12; // Governs how much *horizontal* space to leave between the cursor and the text it's selecting.