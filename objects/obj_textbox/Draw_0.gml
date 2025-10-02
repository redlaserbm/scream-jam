/// @description Insert description here
// You can write your code in this editor

// Assign buttons for accepting and skipping dialogue
accept_key = mouse_check_button_pressed(mb_left) && state.active && timer > 2; // Only try to advance dialogue if we are in the game state.
skip_key = mouse_check_button_pressed(mb_right) && state.active && timer > 2;

// Position the textbox so we see it
var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]);

// Initial GUI setup
if !setup {
	setup = true;
	
	draw_set_font(global.main_font);
	draw_set_color(c_white);
	
	// When we set a point to draw text from, we will be setting the TOP-LEFT most point of that text
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for(var _p = 0; _p < page_number; _p++) {
		
		// Determine the length (in characters) of the text to be displayed for each page
		text_length[_p] = string_length(text[_p]);	
	}
	
	option_number = array_length(option);
	for(var _p = 0; _p < option_number; _p++) {
		// Determine the width of the textbox that will host the dialogue options
		if string_width(option[_p]) > option_width {
			option_width = string_width(option[_p]);
		}
	}
	
	// Don't forget to give the text some breathing room!
	option_width += 2.0*settings.option_border_x // + cursor_spacing + cursor_spr_w;
	
	// How high should the options textbox be?
	option_height = 2*settings.option_border_y + settings.line_sep*(option_number-1) + string_height(option[option_number-1]);
	
	// TODO: Introduce obj_logger
	if instance_number(obj_logger) > 0 {
		obj_logger.ind += 1;
		obj_logger.text[obj_logger.ind] = text[page];
		obj_logger.portrait[obj_logger.ind] = portrait[page];
	}
	
	show_debug_message("textbox[" + string(id) + "] text_id: " + state.text_id);
};

// There are certain scenarios in which I may want the textbox to exist but be inactive, such as
// looking at the logs while mid-conversation.
if state.active {
	
	// Display accompanying image with text (other than portrait) or more!
	for (var _i = 0; _i < array_length(methods[page]); _i++) {
		methods[page][_i]();	
	}
	
	// Typewriter effect
	if draw_char < text_length[page] {
		// TODO: Don't draw text while a transition between scenes is occuring...
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]); 
		if (draw_char % 2) == 0 {
			// audio_play_sound(snd_blip, 1, false,0.25*global.settings.volume*global.settings.volume_sfx);
		}
	}
	
	// What does this get used for?
	var _lay_id = layer_get_id("Background");
	var _back_id = layer_background_get_id(_lay_id);

	// CODE FOR DRAWING TEXT AND CHARACTER SPEAKING 
	if (true) {
		// General overview of procedure:
		// 1. DRAW THE PLAYER
		// 2. DRAW THE OPTIONS TEXTBOX (if necessary)
		// 3. DRAW THE NAMEPLATE
		// 4. DRAW THE REGULAR TEXTBOX
	
		// Values used for drawing the options textbox in the correct location
		var _xval = _textbox_x + settings.textbox_offset_x + settings.textbox_width - option_width;
		var _yval = _textbox_y + settings.textbox_offset_y - option_height;
	
		// Values used for drawing the portrait in the correct location in the presence of dialogue options
		var _portrait_x_target = 0.4*(room_width - _xval);
		var	_portrait_y_target = 0;
	
		// Draw the character that is speaking
	
		if portrait[page] != noone {
			draw_sprite_ext(portrait[page], image[page], 0,0, 1.0, 1.0, 0, c_white, 1);	
		}
	
		// Options
		var _display_options = (page == page_number - 1) && (draw_char >= text_length[page]) && option_link_id[0] != noone;
		if _display_options {
			var _return_val = scr_draw_options(_xval, _yval, option, accept_key);
			if (_return_val.option > -1) {option_pos = _return_val.option};
		}
	
		// Draw the nameplate and the name of the person speaking, provided that such a person exists
		var _drawtext = ds_map_find_value(global.speaker, portrait[page]);
		if !is_undefined(_drawtext) {
			
			// Draw the nameplate
			draw_sprite_ext(
			settings.textbox_spr, 0, 
			_textbox_x + settings.nameplate_offset_x, 
			_textbox_y + settings.nameplate_offset_y, 
			(string_width(_drawtext) + 2*settings.text_border_x)/settings.textbox_spr_w, 
			settings.nameplate_height/settings.textbox_spr_h, 
			0, c_white, settings.alpha
			);

			// Draw the name of the person speaking
			draw_text_ext(
			_textbox_x + settings.nameplate_offset_x + settings.text_border_x,
			_textbox_y + settings.nameplate_offset_y + settings.nameplate_border_y, 
			_drawtext, settings.line_sep, settings.line_width
			);
		}
		
		// Draw the textbox
		draw_sprite_ext(
		settings.textbox_spr, 0, 
		_textbox_x + settings.textbox_offset_x, 
		_textbox_y + settings.textbox_offset_y, 
		settings.textbox_width/settings.textbox_spr_w, 
		settings.textbox_height/settings.textbox_spr_h, 
		0, c_white, settings.alpha
		);

		// Draw the text on the textbox
		_drawtext = string_copy(text[page], 1, floor(draw_char));
		draw_set_color(global.main_font_color);
		draw_text_ext(
		_textbox_x + settings.textbox_offset_x + settings.text_border_x, 
		_textbox_y + settings.textbox_offset_y + settings.text_border_y, 
		_drawtext, settings.line_sep, settings.line_width);
	
		// CODE FOR PAGE FLIPPING

		// If options dialogue is NOT present, advance the dialogue upon clicking.
		// If options dialogue is present, advance the dialogue provided that we click on an option.
		// For presentation's sake, do not allow the player to advance dialogue while the game is transitioning from background to background.
		
		if (force_go && draw_char >= text_length[page]) || ((accept_key && !_display_options) || (accept_key && _display_options && option_pos > -1)) && timer > 2 {
			
			// Has all the text for the current page displayed yet?
			if draw_char < text_length[page] {
				// No. This skips the typing effect and writes out all the text immediately
				draw_char = text_length[page];
			}
			else {
				// Write out of the current page of text to the logger.
				if (page+1) < array_length(text) {
					obj_logger.ind += 1;
					obj_logger.text[obj_logger.ind] = text[page+1];
					obj_logger.portrait[obj_logger.ind] = portrait[page+1];
				}
				// audio_play_sound(snd_click, 1, false, 0.25);
			
				// Yes! Is there still more pages of text to display?
				if page < page_number - 1 {
					// Yes, there is!
					page++;
					force_go = false;
					draw_char = 0;
				} else {
					instance_destroy();

				}
			}
		}

		if skip_key {
			// Log any of the text that was skipped over. This will be helpful if for whatever reason the player accidentally skips over the text.
			while (page + 1) < array_length(text) {
				obj_logger.ind += 1;
				obj_logger.text[obj_logger.ind] = text[page+1];
				obj_logger.portrait[obj_logger.ind] = portrait[page+1];	
				page++;
			}
			
			// Are there dialogue options the player needs to choose from?
			if option_link_id[0] == noone {
				// No, there aren't, we can end the textbox dialogue right away
				instance_destroy();
			} else {
				// Yes, there are!
				// Immediately display the last page of text
				page = page_number - 1;
				draw_char = text_length[page];
			
			}
		}
	
		// ACCEPT CURSOR DISPLAY
		// When text is finished displaying for a text prompt, I'll display spr_cursor so that the player knows.
		if draw_char >= text_length[page] and (obj_game.timer % 30 < 10) {
			draw_sprite_ext(
			spr_cursor, 0, 
			_textbox_x + settings.textbox_offset_x + settings.textbox_width - 40, 
			_textbox_y + settings.textbox_offset_y + settings.textbox_height - 40, 
			1, 1, 0, c_white, settings.alpha
			);
		}
	};
};

// In practice, we *should* just be renaming all instances of *page* in the above code to
// state.page, since it's a state variable. However, this is more tedious to do than I would like
// so for now, have this shitty placeholder code.
state.page = page;






