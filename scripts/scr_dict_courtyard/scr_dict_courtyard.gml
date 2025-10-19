// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_courtyard(_text_id){
	switch(_text_id){
		case "flashback":
			scr_text(spr_narrator, 1, "(5 years ago, at the university...)");
			scr_text(spr_temmie, 1, "So, what is your major here?");
			scr_text(spr_laser, 1, "Me, major? I'm a robot; I don't need to study. I already know all the things you intend to study, before you study them.");
			scr_text(spr_temmie, 1, "Uh-huh...");
			scr_text(spr_temmie, 1, "But can you draw a hand with the right number of fingers?");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_laser, 1, "Uhhhh...");
			scr_text(spr_temmie, 1, "Why are you really here?");
			scr_text(spr_laser, 1, "I wanna know what it's like to be human. I want to do what humans do, feel what humans feel, and be the things humans be...");
			scr_text(spr_temmie, 1, "That sounds very... not like a human...");
			
			scr_text(spr_laser, 1, "Wait, does that mean I'm \"scaring the hoes\" away?");
			scr_text(spr_temmie, 1, "Uhh...............................................", [scr_force_go()]);
			scr_text(spr_laser, 1, "Like in human terms; someone was telling me this the other day and...");
			scr_text(spr_laser, 1, "I don't want to sound like I'm scaring *any* hoes away, or... anyone in general.");
			scr_text(spr_temmie, 1, "(What to say...)");
			scr_goto("flashback_listen");
			break;
			
		case "flashback_listen":
			scr_text(spr_temmie, 1, "Listen, people don't think about what they do the way you're overanalyzing everything.");
			scr_text(spr_temmie, 1, "They just do it.");
			scr_text(spr_temmie, 1, "So don't think too hard about what you say to me.");
			scr_text(spr_temmie, 1, "Just try and catch a vibe.");
			scr_text(spr_laser, 1, "Catch a vibe? What does that mean? Is that like when---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "Laser.");
			scr_text(spr_laser, 1, "Yes?");
			scr_text(spr_temmie, 1, "Don't think; just vibe.");
			scr_text(spr_laser, 1, "Huh... ok. (I still don't get it...)");
			scr_text(spr_temmie, 1, "(He'll get it sooner or later...)");
				
			scr_text(spr_laser, 1, "Well, if you don't think I'm acting human enough, you can always give feedback to my designer in the research lab.");
			scr_text(spr_temmie, 1, "Your designer?");
			scr_text(spr_laser, 1, "Why do you think you've found me at this university in particular?");
			scr_text(spr_laser, 1, "The research lab over in the engineering department is responsible for the totality of my construction, i.e. ...");
			scr_text(spr_laser, 1, "My exterior design; my interior design, the way I act, how I take in new information, and so forth.");
			scr_text(spr_laser, 1, "You should talk to them if you have any outstanding questions about me that need to be addressed.");
			scr_change_atmosphere(bg_kitchen);
			scr_goto("flashback_revelation");
			break;
			
		case "flashback_revelation":
			scr_text(spr_temmie, 1, "That's it! I'll pay a visit to the research lab. Maybe they'll know where he is...");
			scr_room_goto(rm_research);
			break;
	};
}