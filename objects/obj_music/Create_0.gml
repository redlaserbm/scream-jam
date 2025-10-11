/// @description Insert description here
// You can write your code in this editor

init_setup = false;

bg_music = mus_china;
bg_music_new = mus_china; 

music_fade_time = 1;

transition_timer = 0;

change_music = function(_music, _fade_time = music_fade_time) {
	bg_music_new = _music;
	music_fade_time = _fade_time;
}