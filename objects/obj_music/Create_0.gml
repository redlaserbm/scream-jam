/// @description Insert description here
// You can write your code in this editor

event_inherited();

init_setup = false;

// Try and get information from obj_game about what track to use
// If there is no such information avaiable, default to the title screen music
if (!variable_struct_exists(state, "bg_music")) {
	state.bg_music = audio_play_sound(mus_title, 1, true, global.volume.master*global.volume.music);
	state.bg_music_new = mus_title;
};

// In rare cases, the player may save the game during a time when obj_music is transitioning
// from one song to another. In this scenario, auto-switch to playing the new song on load
if (state.bg_music_new != asset_get_index(audio_get_name(state.bg_music))) {
	state.bg_music = state.bg_music = audio_play_sound(state.bg_music_new,0,true, global.volume.master*global.volume.music);
};

music_fade_time = 1;

change_music = function(_music, _fade_time = music_fade_time) {
	state.bg_music_new = _music;
	music_fade_time = _fade_time;
}