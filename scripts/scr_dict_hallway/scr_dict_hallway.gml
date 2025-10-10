// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_hallway(_text_id){
	
	switch(_text_id){
		case "epilogue_strangle":
			scr_text(spr_narrator, 1, "Some moments later...");
			scr_text(spr_laser, 1, "Okay, so... About the lifeless body I saw when I came to aga---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "Accident. He was like that when I got here. Must've been from his lunch.");
			scr_text(spr_laser, 1, "Mhmm.... Is that *really* what happened?");
			scr_text(spr_temmie, 1, "Of course!");
			scr_text(spr_laser, 1, "Somehow, I find it a bit difficult to trust you...");
			scr_text(spr_laser, 1, "Anyways! Remember that meme that I sent, where it's like, \"if your name starts with a T, you owe whoever sent you this cookies\"?");
			scr_text(spr_temmie, 1, "(Jesus christ I really don't wanna do this right now...)");
			scr_text(spr_laser, 1, "Can we get cookies? Except you have to pay, since your name starts with a T, like in the meme, y'kn---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "No.");
			scr_text(spr_laser, 1, "You're no fun.");
			scr_text(spr_temmie, 1, "Deal with it.");
			break;
			
		case "epilogue_threaten":
			scr_text(spr_narrator, 1, "Some moments later...");
			scr_text(spr_temmie, 1, "And that's why all you need to do sometimes is threaten people to get your way!");
			scr_text(spr_laser, 1, "Cool.");
			break;
			
		case "epilogue_standdown":
			scr_text(spr_narrator, 1, "Some moments later...");
			scr_text(spr_temmie, 1, "Damn, this coffee is really good.");
			break;
	}

}