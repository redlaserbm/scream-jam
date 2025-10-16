/// @description Insert description here
// You can write your code in this editor

var _vol_music = global.volume.music;
var _vol_master = global.volume.master;

audio_stop_sound(state.bg_music);
if !is_undefined(state.bg_music_new) {
	state.bg_music = audio_play_sound(state.bg_music_new,0,true, _vol_music*_vol_master);
}