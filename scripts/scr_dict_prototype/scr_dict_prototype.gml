// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_prototype(_text_id){
	switch(_text_id){
		case("street"):
			scr_text(spr_temmie, 1, "I feel like...");
			scr_text(spr_temmie, 1, "Even though you're a full grown-ass adult, pushing 30 and everything.");
			scr_text(spr_temmie, 1, "I feel like you would get groomed on VRChat.");
			scr_text(spr_laser, 1, "(What a horrifying thing for her to say...)");
			scr_text(spr_laser, 1, "(How do I respond to something like that?)");
			scr_option("Cry like a bitch", "street_bitch");
			scr_option("Stand up to Temmie", "street_standup");
			break;
			
			case("street_bitch"):
				scr_text(spr_laser, 1, "(Okay temmie, cut it out I know for a *fact* you picked this option.)");
				break;
				
			case("street_standup"):
				scr_text(spr_laser, 1, "What the fuck..."); 
				break;
			
		case("shop"):
			scr_text(spr_laser,		1, "Huh, you're here too?");
			scr_text(spr_temmie,	1, "I'm everywhere, bro.");
			scr_text(spr_laser,		1, "You didn't happen to clone yourself, did you?");
			scr_text(spr_temmie,	1, "Uh...");
			scr_text(spr_laser,		1, "You definitely cloned yourself.");
			scr_text(spr_temmie,	1, "No.");
			scr_text(spr_laser,		1, "Yes you did.");
			scr_text(spr_temmie,	1, "Hoe.");
			scr_text(spr_laser,		1, "...");
			break;
	};
};