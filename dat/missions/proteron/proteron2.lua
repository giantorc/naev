   include "numstring.lua"

   lang = naev.lang()
   if lang == es then
      -- not translated atm
    else -- default english
      -- Mission details
    bar_desc = "The Black Haired Man"
    misn_title = "Warrior Test"
    misn_reward = "None"
    misn_desc = {}
    misn_desc[1] = "Fight off the initiates to claim a spot in the Proteron Army"
    misn_desc[2] = "Defeat the Initiates"
    misn_desc[3] = "Return to %s in the %s system"
    --text items for story
    title = {}
    title[1] = "The Black Haired Man"
    title[2] = "Victory"
	text = {}
	text[1] = [[As you step into the bar, you spot the same Black Haired Man sitting in a corner. He waves you over. 
	"Greetings again, %s. I believe it's time to tell you why I hired you for the job"
	"You see, the faction that I am fighting for has decided that you may be worthy for our attention, and possibly to join us as brothers on the battlefield." Accept]]
	text[2] = [[The Black Haired Man smiles and continues, "We are the Proteron House, originnaly created by the Empire in case of their government ever collapsing, but when the incedent occured, we were cut off from the rest of the galaxy. The Empire ignored our distress signals and declared Project Proteron a failure." He Grimaces. "They declared us dead, and ended Project Proteron. But we were not out yet. We rebuilt the fleets that once protected our homeland, and have new technology that easily outmatches theirs! Their replacement for us, House Zalek is overly violent and is a danger our people and all of the other houses. To join us, you will have to fly to the %s system and defeat the other initiates. Do not fear to destroy their ships. They have Escape Pods, so they do not die if you were to destroy their ships]]
	text[3] = [[As you land on the dock your fellow initiates congratulate you on defeating them, but the pilot of their starship is very reluctant. After the celebrations, you are waved over to a table where several Proteron Officials are sitting, and the black haired man, Eduard Protea says: "Right. We have decided that, as a recruit from Empire space, we have decided that you should begin your informantion gathering missions in Dvaered space. Go and find patrol missions with the new access codes we are giving you and give us any information you gather there. Agent Ulsindaar here will tell you when it is time to report back]]
	msg = {}
	msg_intitiateinbound = "Initiates Inbound!"
	msg_defeatfoes = "You have defeated the initiates! Return to %s system!"
	
	osd_msg = {}
	osd_msg[1] = "Fly to %s System"
	osd_msg[2] = "Destroy the Intitiate"
	
end

include "dat/missions/Proteron/Common.lua"

function create ()
	misn_nearby = system.get ("Myad")
	misn_target = system.get ("Tormulex")
	misn_base,misn_base_sys = planet.get ("Dvaer Prime")
	
	missys =  {misn_target}
	if not misn.claim missys then
	end
	
	misn.setNPC( "Black Haired Man", "neutral/unique/drunkard"
	misn.setDesc( bar_desc )
end

	function accept()

	--accept mission
	misn.accept()
	
	misn stage 0
	misn_marker = misn.markerAdd( misn_target, "low" )
	
	--mission details
	misn.setTitle(misn_title)
	misn.setReward( misn_reward )
	misn.setDesc( string.format(misn_desc[1],misn_nearby:name()))
	
	--mission desc and  mini-briefing
	tk.msg( title[2], string.format( text[2], misn_base_sys:name()
	tk.msg( title[2], string.format( text[2], misn_nearby_sys:name()
		misn_target:name(), misn_base:name(), misn_base_sys:name() ))
	
	   osd_msg[1] = osd_msg[1]:format(misn_target:name())
   osd_msg[3] = osd_msg[3]:format(misn_base:name(), misn_base_sys:name())
   misn.osdCreate(misn_title, osd_msg)
   hook.enter("enter")
   hook.land("land")
end

function enter()
	sys = system.cur()
	
	   if sys == misn_target and misn_stage == 0 then
      pilot.clear()
      pilot.toggleSpawn(false)
      misn.osdActive(2)
      hook.timer(500, "proximity", {location = vec2.new(8000, -20000), radius = 5000, funcname = "spotdrone"}) 
   elseif misn_stage == 0 then
      misn.osdActive(1)
   end
end

function create()
	p = pilot.add("Proteron Kahan", "Initiate", vec2.new(8000, -20000))[1]
	p:control()
	p:setHilight(true)
	idle()
	
	hook.pilot( p, "death", "kill")
	hook.pilot( p, "idle", "idle")
	
	--update mission
	misn.osdActive(2)
	player.msg(msg_intitiateinbound)
	misn.setDesc( string.format(misn_desc[2])
	misn_stage = 1
	misn_marketMove( misn_marker, misn_marker_sys)
end

function land()
	pnt = planet.cur
	if misn.stage == 1 and pnt == misn_base then
		tk.msg( title[2], string.format(text[3], misn_target:name()
		faction.modPlayerSingle("Proteron", 5)
		misn_finish(true)
