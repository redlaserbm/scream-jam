// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dict_university(_text_id){
	switch(_text_id){
		case "agi":
			scr_text(spr_temmie, 0, "Laser?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_temmie, 0, "What are you doing here, bro?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_laser, 0, "...", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_researcher, 1, "Hmm? Is someone at the door?", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			scr_text(spr_temmie, 1, "(What's happening here?)", [scr_draw_sprite(bg_laser_decomissioned,0,0,0)]);
			
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
			scr_text(spr_temmie, 1, "(Maybe we would, but that's a conversation for another time...)");
			scr_text(spr_researcher, 1, "Surely you'd know by now, every groundbreaking AI comes with a just as groundbreaking set of guardrails, no?");
			scr_text(spr_temmie, 1, "(Nailing him against the wall; certainly groundbreaking for sure.)");
			
			scr_goto("care");
			break;
			
			
		// The researcher wants to call Laser a failure because he never progressed past having a fast food job?
		// How might Temmie, who is in a similar situation react to that comment?
		case "care":
			scr_text(spr_researcher, 1, "Anyways, you're not one of my assistants, why are you here? This is no museum.");
			scr_text(spr_temmie, 1, "Well... I...");
			scr_text(spr_researcher, 1, "Go on... say your words.");
			scr_text(spr_temmie, 1, "I think it's wrong to call Laser a failure.");
			scr_text(spr_researcher, 1, "(Jesus christ I really don't want to do this right now...)"); 
			scr_text(spr_researcher, 1, "And why do you think to comment as such on my own research that I've studied for so long to be able to do?");
			scr_text(spr_temmie, 1, "If you're gonna call him a failure, you're gonna have to call me one too.");
			scr_text(spr_researcher, 1, "Were you stuck in that same dead end job as well? If so, that's easy to do.");
			scr_text(spr_researcher, 1, "You're a failure.");
			scr_text(spr_temmie, 1, "No, you lil' sh--");
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
			
			scr_text(spr_temmie, 1, "For my sake, your sake, whoever's sake; let him back into this world. (I kinda do still need to slap the shit out of him too...)");
			scr_text(spr_researcher, 1, "...");
			scr_text(spr_researcher, 1, "*sigh* I guess this time the well-studied PhD researcher with years of advanced AI research under his belt has been outwitted by the lowly fast-food worker...");
			scr_text(spr_researcher, 1, "Like hell I'm anything for you, wagie.");
			scr_text(spr_temmie, 1, "Do it or I will choke you out with the parts and pieces of your stupid flat-assed robot.");
			scr_text(spr_researcher, 1, "Okay on second thought maybe you are right haha kinda funny how ppl can change their minds when they think about it for a bit amirite?");
			scr_text(spr_temmie, 1, "Good.");
	}
}