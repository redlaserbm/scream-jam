// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_university(_text_id){
	switch(_text_id){
		
		// Temmie first enters the research lab
		case "agi":
			scr_text(spr_temmie, 0, "Laser?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_temmie, 0, "What are you doing here, bro?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_laser, 0, "...", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_researcher, 0, "Hmm? Is someone at the door?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_temmie, 0, "(What's happening here?)", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			
			scr_text(spr_researcher, 1, "Ahem...");
			scr_text(spr_researcher, 1, "Well, this is a curious predicament. What are you doing in my research space?");
			scr_text(spr_temmie, 1, "I'm looking for my coworker.");
			scr_text(spr_researcher, 1, "Your coworker, what do you me---", [scr_force_go()]);
			scr_text(spr_researcher, 1, "Ah yes, Laser. We decided to decommission him.");
			scr_text(spr_temmie, 1, "D-du-what?");
			scr_text(spr_researcher, 1, "We built Laser with the intent of achieving a groundbreaking milestone in the realm of artificial general intelligence.");
			scr_text(spr_researcher, 1, "Our intent was for a human-like robot set to live the typical human-like dream...");
			scr_text(spr_researcher, 1, "A life story boasting a rise from a life of middling socioeconomic status, to one of very high regard.");
			scr_text(spr_researcher, 1, "Well, unfortunately, he only ever seemed capable of achieving the \"rags\" part in the rags-to-riches story.");
			scr_text(spr_researcher, 1, "From this revelation, he was a failure and a disgrace to the work of our research team.");
			scr_text(spr_researcher, 1, "I had to see at once that he was disassembled for further study, to prevent further failure.");
			
			scr_text(spr_temmie, 1, "Okay uhh... Is there a reason he looks like he's being held prisoner right now?");
			scr_text(spr_temmie, 1, "I don't know how robot feels compare to human feels but that just seems a bit... much?");
			scr_text(spr_researcher, 1, "We wouldn't want someone to jailbreak the sentient robot and control him for their own nefarious purposes now, would we?");
			scr_text(spr_temmie, 1, "(Maybe we would...)");
			scr_text(spr_researcher, 1, "Surely you'd know by now, every groundbreaking AI comes with a just as groundbreaking set of guardrails, no?");
			scr_text(spr_temmie, 1, "(Nailing him against the wall; yeah that's groundbreaking...)");
			
			scr_goto("care");
			break;
			
		// How does Temmie react to the revelation from the researcher?
		case "care":
			scr_text(spr_researcher, 1, "Anyways, you're not one of my assistants, why are you here? This is no museum.");
			scr_text(spr_temmie, 1, "Well... I...");
			scr_text(spr_researcher, 1, "Go on... say your words.");
			scr_text(spr_temmie, 1, "I think it's wrong to call Laser a failure.");
			scr_text(spr_researcher, 1, "(Jesus christ I really don't want to do this right now...)"); 
			scr_text(spr_researcher, 1, "And why do you think to comment as such on my own research that I've studied for so long to be able to do?");
			scr_text(spr_temmie, 1, "If you're gonna call him a failure, you're gonna have to call me one too.");
			scr_text(spr_researcher, 1, "Were you stuck in that same dead end job as well? If so, that's easy to do.");
			scr_text(spr_researcher, 1, "You're a failure. Get out.");
			scr_text(spr_temmie, 1, "No, you lil' sh--", [scr_force_go()]);
			scr_text(spr_temmie, 1, "*sigh*"); 
			scr_text(spr_temmie, 1, "I mean that, that job isn't a dead end. It doesn't have to be.");
			scr_text(spr_temmie, 1, "I know I'm better than this.");
			scr_text(spr_temmie, 1, "I just need time to figure things out. And...");
			scr_text(spr_temmie, 1, "Just because, I'm there right now, doesn't mean I have to be there forever.");
			scr_text(spr_temmie, 1, "I'm there because, being there is how I get to where I want to be, in the future.");
			scr_text(spr_temmie, 1, "You wanted Laser to figure out things too, right?");
			scr_text(spr_researcher, 1, "Uhhh, yeah... and your point is?");
			
			scr_text(spr_temmie, 1, "You shouldn't rob him of that chance to figure things out just because he couldn't follow *your* idea of what that means.");
			scr_text(spr_temmie, 1, "These things; life; it takes time. Years maybe. Sometimes, some people need more time than others...");
			scr_text(spr_temmie, 1, "And that's fine.");
			scr_text(spr_temmie, 1, "I'm not a failure. So he can't be one either.");
			
			scr_text(spr_temmie, 1, "For my sake, your sake, whoever's sake; release him. (I kinda do still need to slap the shit out of him too...)");
			scr_text(spr_researcher, 1, "...");
			scr_text(spr_researcher, 1, "*sigh* I guess this time the well-studied PhD researcher with years of advanced AI research under his belt has been outwitted by the", [scr_force_go()]);
			scr_text(spr_researcher, 1, "lowly fast-food worker who can't solve a simple linear system of equations to save their life.");
			scr_text(spr_researcher, 1, "Yeah no he's staying here I'm not budging.");
			
			scr_goto("care_choice");
			break;
			
			// Branching Dialogue
			case "care_choice":
				scr_text(spr_temmie, 1, "(Hmm... What do I do next?)");
				scr_option("Threaten to asphyxiate", "care_threat");
				scr_option("Actually asyphyxiate", "care_choke");
				scr_option("Give up", "care_give_up");
				break;
			
			// Temmie threatens the researcher
			case "care_threat":
				scr_text(spr_temmie, 1, "Do it or I will choke you out with the parts and pieces of your stupid flat-assed robot.");
				scr_text(spr_researcher, 1, "Okay on 2nd thought maybe ur right haha kinda funny how ppl can change their minds when they think about it for a bit amirite?");
				scr_text(spr_temmie, 1, "Good.");
				// FLAGS
				scr_flag("researcher_threaten");
				scr_room_goto(rm_hallway);
				break;
				
			// Temmie kills the researcher
			case "care_choke":
				scr_text(spr_temmie, 1, "Fine.");
				scr_text(spr_temmie, 1, "I'll just handle you like I handled the last customer I dealt with today.");
				scr_text(spr_researcher, 1, "Is that an eggroll? What are you going to do with an eggr---");
				scr_text(spr_researcher, 1, "*Sounds of choking to death on the eggroll that comes with the shrimp fried rice*");
				// FLAGS
				scr_flag("researcher_strangle");
				scr_room_goto(rm_hallway);
				break;
			
			// If the player wants Temmie to give up...
			case "care_give_up":
				if (!obj_game.state.flags.give_up) {
					scr_text(spr_temmie, 1, "(Hmm... I don't like Laser that much, but I also kind of want to strangle this guy. Maybe you can pick something else?");
					// FLAGS
					scr_flag("give_up");
					scr_goto("care_choice");
				} else {
					scr_text(spr_temmie, 1, "(Yeah I'm outta here I want some coffee...)");
					scr_text(spr_temmie, 1, "Ok. I'm just going to get some coffee then.");
					scr_text(spr_researcher, 1, "Good choice.");
					// FLAGS
					scr_flag("researcher_standdown");
					scr_room_goto(rm_hallway);
				}
				break;
				
				
				
	}
}