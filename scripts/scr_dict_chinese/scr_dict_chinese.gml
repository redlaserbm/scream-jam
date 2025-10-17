// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_chinese(_text_id){
	switch(_text_id){
		case("chinese"):
			scr_flag("shop_convo_start", true);
			scr_text(spr_narrator, 0, "(Welcome to Laser is Lost! Do you need a tutorial on the controls for the game?)");
			scr_option("Yes", "tutorial"); 
			scr_option("No", "chinese_1");
			break;
			
			case "tutorial":
				scr_text(spr_narrator, 0, "(Navigating text is easy! Just left-click!)");
				scr_text(spr_narrator, 0, "(Left-clicking after all dialogue appears on screen advances to the next textbox.)");
				scr_text(spr_narrator, 0, "(Left-clicking while text is appearing on screen causes all text for the textbox to instantaneously appear.)");
				scr_text(spr_narrator, 0, "(You can skip large chunks of dialogue at once by using right-click.");
				scr_text(spr_narrator, 0, "(If you missed any dialogue, or want to go back to read through dialogue you've already seen, press L to bring up the log.");
				scr_text(spr_narrator, 0, "(Finally, if you need to save or load progress, you can use the S and U keys respectively.)");
				scr_text(spr_narrator, 0, "(That's it for this tutorial! Let's move on to the game now.)");
				scr_goto("chinese_1");
				break;
				
				
		case("chinese_1"):
			scr_text(spr_narrator, 0, "(You are Temmie. You and your coworker, Laser, are unfortunately stuck in a dead-end job at a Chinese take-out.)");
			scr_text(spr_temmie, 1, "(...)");
			scr_text(spr_laser, 1, "(...)");
			scr_text(spr_narrator, 1, "(But, things don't have to be all that bad! Try interacting with your fellow coworker! He seems open to conversation.)");
			scr_text(spr_laser, 1, "(...)");
			scr_text(spr_temmie, 1, "(Hmm... What to say, what to say?)");
			
			// OPTIONS
			scr_option("Say something nice about Laser", "chinese_nice");
			scr_option("Call him a bitch", "chinese_bitch");
			break;
			
			// BRANCHING DIALOGUE
			case "chinese_nice":
				scr_text(spr_temmie, 1, "(Ew no. I'm not doing that.)");
				scr_text(spr_narrator, 1, "(*sigh*)");
				scr_text(spr_narrator, 1, "(Well I can't say I didn't try...)");
				scr_text(spr_narrator, 1, "(I'm just going to say, my momma always told me if you don't have anything nice to say, don't say i---)", [scr_force_go()]);
				scr_goto("chinese_bitch");
				break;
				
			case "chinese_bitch":
				scr_text(spr_temmie, 1, "Bitch.");
				scr_text(spr_laser, 1, "...");
				scr_text(spr_laser, 1, "I *just* got here.");
				scr_text(spr_laser, 1, "I haven't even been formally introduced and you're *already* insulting me.");
				scr_text(spr_temmie, 1, "Okay, and?");
				scr_text(spr_temmie, 1, "Deal with it.");
				scr_text(spr_laser, 1, "*sigh* I'll be in the back frying the rice if you need me...");
				scr_text(spr_laser, 1, "Also, we have a customer waiting to place an order, can you tend to them?");
				scr_text(spr_temmie, 1, "Roger.");
				scr_goto("egg_roll");
				break;
				
		case "egg_roll":
			scr_text(spr_narrator, 0, "(While Laser is out frying rice for DoorDash orders, you tend to the customer at the front of the establishment...)");
			scr_text(spr_temmie, 1, "...Okay, so let me make sure I have this right.");
			scr_text(spr_temmie, 1, "You want the shrimp fried rice, no shrimp, extra veggies, double fried on the rice,");
			scr_text(spr_temmie, 1, "Yummy yummy sauce with double the yum and half the sauce, and a diet coke, not the coke zero sugar");
			scr_text(spr_temmie, 1, "with raw cane sugar added in?");
			scr_text(spr_customer, 1, "...Uhh, and an egg roll, I said I wanted an egg roll.");
			scr_text(spr_temmie, 1, "Sir, it comes with the egg roll.");
			scr_text(spr_customer, 1, "You didn't say that before.");
			scr_text(spr_temmie, 1, "It says it on the menu up top.");
			scr_text(spr_customer, 1, "Okay, but you didn't say it when you were repeating everything.");
			scr_text(spr_customer, 1, "How am I supposed to know that the order comes with the egg roll if you don't say it?");
			scr_text(spr_temmie, 1, "You know by looking at the menu.");
			scr_text(spr_customer, 1, "Well, I want an egg roll with my meal.");
			scr_text(spr_temmie, 1, "And you're gonna get one, if you confirm your order.");
			scr_text(spr_customer, 1, "Ok, well, now I'm not sure if I want the egg roll anymore or not.");
			scr_text(spr_temmie, 1, "It comes with the egg roll, whether you want it to or not...");
			scr_text(spr_customer, 1, "Ok, um, can I *not* have the egg roll with my meal then?");
			scr_text(spr_temmie, 1, "Can I strangle you until your body turns purple and your lifeless body collapses to the floor?");
			scr_text(spr_narrator, 0, "(Oh jeez, this is not gonna end well...)");
			scr_text(spr_customer, 1, "What the fuck did you just fucking say about me, you little bitch? I'll have you know I graduated top of my class in the Navy Seals, and---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "*Takes an egg roll and shoves it down the customer's throat.*");
			scr_text(spr_narrator, 1, "(The customer is now dead. Great job.)");
			scr_goto("temmie_is_curious");
			break;
			
		//case "choked_out":
		//	scr_text(spr_narrator, 0, "(The commotion draws Laser's attention, and he walks to you.)");
		//	scr_text(spr_laser, 1, "Hey uh, Temmie?");
		//	scr_text(spr_temmie, 1, "Hmm? Something the matter?");
		//	scr_text(spr_laser, 1, "Uhhh... Well... I just noticed there's yet another lifeless corpse on the ground with their trachea blockaded by an egg roll.");
		//	scr_text(spr_temmie, 1, "And?");
		//	scr_text(spr_laser, 1, "How are we gonna explain the third death by eggroll induced asphyxiation this month to the bossman?");
		//	scr_text(spr_temmie, 1, "Uhh... I dunno.");
		//	scr_text(spr_temmie, 1, "He just choked on the eggroll bro. On accident.");
		//	scr_text(spr_laser, 1, "Really...");
		//	scr_text(spr_temmie, 1, "Mhmm!");
		//	scr_text(spr_laser, 1, "(I'm not gonna lie, you scare the shit outta me sometimes...)");
		//	scr_text(spr_temmie, 1, "I can read the dialogue boxes too, y'know?");
		//	scr_text(spr_temmie, 1, "You're thoughts aren't safe.");
		//	scr_text(spr_laser, 1, "*Your");
		//	scr_text(spr_temmie, 1, "That doesn't make any---", [scr_force_go()]);
		//	scr_text(spr_laser, 1, "Laser 1, Temmie 0");
		//	scr_text(spr_temmie, 1, "(You're next...)");
		//	scr_text(spr_laser, 1, "Anyways...");
		//	scr_text(spr_laser, 1, "I'm gonna get back to frying rice, bug me if you need me.");
		//	scr_text(spr_temmie, 1, "K.");
		//	scr_goto("shrimp_fried_rice");
		//	break;
		
		case "temmie_is_curious":
			scr_text(spr_temmie, 1, "Hmm... It's been a bit since I've seen Laser. Maybe I should check up on him real quick?");
			scr_option("Yeah, sure.", "laser_checkup");
			scr_option("No, he's probably fine.", "laser_ignore");
			break;
			
			case "laser_ignore":
				scr_text(spr_narrator, 1, "(Listen, I know I gave you the choice to ignore him, but you should probably check up on him...");
				scr_text(spr_narrator, 1, "(I'm just saying...)");
				scr_goto("temmie_is_curious");
				break;
			
			case "laser_checkup":
				scr_text(spr_temmie, 1, "Yo, Laser. Where u at?");
				scr_text(spr_narrator, 1, "(No response.)");
				scr_text(spr_temmie, 1, "Hmm...");
				scr_text(spr_temmie, 1, "Laser?");
				scr_text(spr_narrator, 1, "(Still no response.)");
				scr_text(spr_temmie, 1, "(Hm... I shouldn't leave the register empty, but...)");
				scr_option("Keep calling out for Laser", "laser_checkup_persist");
				scr_option("Go to the kitchen area", "laser_checkup_move");
				break;
			
				case "laser_checkup_persist":
					scr_text(spr_temmie, 1, "Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser Laser", [scr_force_go()]);
					scr_text(spr_temmie, 1, "...");
					scr_text(spr_temmie, 1, "(I'm just gonna go back there...)");
					scr_goto("laser_checkup_move");
					break;
				
				case "laser_checkup_move":
					scr_text(spr_narrator, 1, "(You move to the kitchen...)");
					scr_change_atmosphere(bg_kitchen);
					scr_goto("laser_checkup_move_1");
					break;
					
				case "laser_checkup_move_1":
					scr_text(spr_narrator, 1, "(Laser isn't here...)");
					scr_text(spr_temmie, 1, "Okay... No Laser, but you are?");
					scr_text(spr_shrimp, 1, "(...)");
					scr_text(spr_temmie, 1, "And you've been frying this rice the whole time?")
					scr_text(spr_shrimp, 1, "(...)");
					scr_text(spr_temmie, 1, "Great.");
					scr_goto("shrimp_fried_rice");
					break;
			
		case "shrimp_fried_rice":
			scr_text(spr_temmie, 1, "Anyways, I guess I should try and figure out where Laser is...");
			scr_room_goto(rm_research);
			break;
			
	};
};