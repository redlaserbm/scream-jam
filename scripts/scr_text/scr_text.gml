// This file contains not only scr_text, the flagship script for
// generating text, but also a few other methods which can be run
// mid-conversation for convenience sake. 

// Scripts other than scr_text included on this page are intended to be
// used as arguments for _methods in scr_text

/// @function				scr_text(_sprite, _image, _text, _methods)
/// @param _sprite			The sprite to use
/// @param {index}	_image	The image to use for the given sprite. Set to 0 when _sprite == noone. 
/// @param {string} _text	The text to display.
/// @param _methods			An array for functions to run alongside the text.
/// @description			Populates obj_textbox with dialogue information.
function scr_text(_sprite = noone, _image = 0, _text = "", _methods = []){
	
	// Your standard textbox will have a *sprite*, an *image*, and *text* associated with it.
	// Sometimes, textboxes need to take additional actions such as displaying images or changing music
	// The _methods argument is designed to handle those additional actions
	
	text[page_number] = _text;
	portrait[page_number] = _sprite;
	image[page_number] = _image;
	
	methods[page_number] = _methods;
	
	page_number++;
}

/// @function		scr_draw_sprite(_spr, _img, _x, _y)
/// @param _spr		The sprite to use
/// @param _img		The image to use for the given sprite
/// @param _x		x-coordinate for the sprite
/// @param _y		y-coordinate for the sprite
/// @description	Helper method for scr_text for drawing accompanying sprites
function scr_draw_sprite(_spr, _img, _x, _y){
	scr_spr = _spr;
	scr_img = _img;
	scr_x = _x;
	scr_y = _y;
	var _method = function() {
		draw_sprite(scr_spr, scr_img, scr_x, scr_y);
	}
	return _method
};

/// @function		scr_force_go()
/// @description	Forces scr_text text to *not* wait for player input before advancing
function scr_force_go() {
	var _method = function() {
		force_go = true;	
	}
	return _method;
}

// NOTE: Do NOT use this to play looping music
/// @function		scr_play_sound(_sound)
/// @param _sound	The sound to play
/// @description	scr_text submethod for playing sounds
function scr_play_sound(_sound) {
	times_played = 0;
	e_sound = _sound;
	var	_method = function() {
		if times_played < 1 {
			audio_play_sound(e_sound, 1, false, global.settings.volume*global.settings.volume_sfx);	
			times_played += 1;
		}
	}
	return _method;
}