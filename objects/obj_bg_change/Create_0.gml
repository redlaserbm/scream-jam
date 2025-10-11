/// @description Insert description here

// This object helps faciliate background transitions in the game
// The general framework that underlies this object is known to be suboptimal, but I want to start simple
// before refining the framework

event_inherited();
scr_activate();

// old_bg_spr = noone;

timer = 0;
fade_time = 120; // Time to transition (expressed as frames)