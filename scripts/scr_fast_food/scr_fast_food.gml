// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fast_food(){
	switch(text_id) {
		case "egg_roll":
			scr_text(spr_temmie, 1, "Okay, so let me make sure I have this right.");
			scr_text(spr_temmie, 1, "You want the shrimp fried rice, no shrimp, extra veggies, double fried on the rice,");
			scr_text(spr_temmie, 1, "Yummy yummy sauce not on the side but mixed in with the rice, and a diet soda, no sweetener");
			scr_text(spr_temmie, 1, "with raw cane sugar?");
			scr_text(spr_customer, 1, "...Uhh, and an eggroll, I said I wanted an eggroll.");
			scr_text(spr_temmie, 1, "Sir, it comes with the eggroll.");
			scr_text(spr_customer, 1, "You didn't say that before.");
			scr_text(spr_temmie, 1, "It says it on the menu up top.");
			scr_text(spr_customer, 1, "Okay, but you didn't say it when you were repeating everything.");
			scr_text(spr_customer, 1, "How am I supposed to know that the order comes with the eggroll if you don't say it?");
			scr_text(spr_temmie, 1, "You know by looking at the menu.");
			scr_text(spr_customer, 1, "Well, I want an eggroll with my meal.");
			scr_text(spr_temmie, 1, "And you're gonna get one, if you confirm your order.");
			scr_text(spr_customer, 1, "Can I get an eggroll with the meal?");
			scr_text(spr_temmie, 1, "Can I strangle you until your body turns purple and your lifeless body collapses to the floor?");
			scr_text(spr_laser, 1, "(Well, this one's not gonna end well...)");
			scr_text(spr_customer, 1, "What did you just say to me? I'll have you know tha--");
			scr_text(spr_temmie, 1, "*Takes an eggroll and shoves it down the customer's throat.*");
			scr_goto("choked_out");
			break;
			
		case "choked_out":
			scr_text(spr_laser, 1, "Hey uh, Temmie?");
			scr_text(spr_temmie, 1, "Hmm? Something the matter?");
			scr_text(spr_laser, 1, "I know the customer *kinda* had it coming, but how are we gonna explain the third death by eggroll induced asphyxiation this month to the bossman?");
			scr_text(spr_temmie, 1, "Uhh... I dunno.");
			scr_text(spr_temmie, 1, "He just choked on the eggroll bro. On accident.");
			scr_text(spr_laser, 1, "Really...");
			scr_text(spr_temmie, 1, "Mhmm!");
			scr_text(spr_laser, 1, "(I'm not gonna lie, you scare the shit outta me sometimes...)");
			scr_text(spr_temmie, 1, "I can read the dialogue boxes too, y'know?");
			scr_text(spr_temmie, 1, "You're thoughts aren't safe.");
			scr_text(spr_laser, 1, "*Your");
			scr_text(spr_temmie, 1, "That doesn't make any---");
			scr_text(spr_laser, 1, "Laser 1, Temmie 0");
			scr_text(spr_temmie, 1, "(You're next...)");
			scr_text(spr_laser, 1, "Anyways...");
			scr_text(spr_laser, 1, "I haven't felt the sun since this shift started, I'll be outside for a few minutes, talk to me if you need me.");
			scr_text(spr_temmie, 1, "Okay dum dum.");
			break;
			
		case "laser_is_missing":
			scr_text(spr_temmie, 1, "Huh, I guess he really did go missing...");
			break;
	}
}