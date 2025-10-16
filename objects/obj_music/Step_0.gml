/// @description Insert description here
// You can write your code in this editor

var _vol_master = global.volume.master;
var _vol_music = global.volume.music;

if alarm[0] == -1 {
	if state.bg_music_new != asset_get_index(audio_get_name(state.bg_music)) {
		audio_sound_gain(state.bg_music, 0, 1000*music_fade_time*_vol_music*_vol_master);
		alarm[0] = music_fade_time*60;
	} else {
		audio_sound_gain(state.bg_music, _vol_master*_vol_music, 0);
	};
};

state.standby = false;
state.active = false;