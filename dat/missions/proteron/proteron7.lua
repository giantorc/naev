include "fleethelper.lua"
include "numstring.lua"
include "proximity.lua"
lang = naev.lang()
else
	title{}
	text{}
	desc{}
	osd{}
	
	desc[1] = "Attack Empire"
	
	reward = 500000 --500k because harder msn
	
	title[1] = "Attack the Empire"
	text[1] = [[As you are readying to launch, a face appears on the screen. "It is Time! we must prepare for battle!"]]
	
	title[2] = "Call to War!"
	text[2] = [[All troops! Board your most powerful combat ship you have availible! We must go now for battle!]]
	
	title[3] = "Victory"
	text[3] = [[As the Empire is destroyed by the Proteron Forces, the Proteron general, Kan Orothier, reports that they are recieving distress calls to Zalek, Dvaered, Sirius, and Goddard]]
	
	title[4] = "Gather the Fleet"
	osd[1] = "Gather the Fleet in the Goddard System"
	
	title[5] = "Attack Outer Defenses"
	osd[2] = "Attack the Empire Defenses in the Knave system"
	
function create()
	missys = {system.get("Knave"), system.get("Arcturus"), system.get("Gamma Polaris"), system.get("Draygar")}
		misn.finish()
	end
	
function accept()
	
	if not tk.yesno( title[1], text[2] ) then
		misn.finish()
	end
	
	misn.accept()
	
	misn_stage = 0
	misn_base, misn_base_sys, planet.get("Draygar")
	misn_target_sys1 = system.get("Arcturus")
	misn_final_sys = system.get("Gamma Polaris")
	misn_marker = misn.markerAdd( misn_target_sys1, "low" )
    misn_marker = misn.markerAdd( misn_final_sys, "high" )

	misn.setTitle(title)
	misn.setReward(reward)
	misn.setDesc( string.format(desc[1], misn_target_sys1:name() ))
	osd[1] = osd_msg[1]:format(misn_final_sys:name(), misn_target_sys2:name())
	end
   misn.osdCreate(title[4], osd[1])
   
   tk.msg( title[2], string.format( text[2],
		misn_target_sys1:name(), misn_final_sys:name() ) )
	
	hook.jumpout("jumpout")
	hook.enter("sysenter")
	hook.land("land")
end

function jumpout()
	last_sys = system.cur()
end

function sysenter()
	if misn_stage == 0 then
		if system.cur = misn_final_sys then
		pilot.toggleSpawn(false)
		
		fleetA = {}
		empireB = {}
		empireC = {}
		
		fleetA[#fleetA + 1] = pilot.add("Proteron Archimedes", nil, fleetApos)[1]
		fleetA[#fleetA + 1] = pilot.add("Proteron Archimedes", nil, fleetApos:pos() + vec2.new(-500, 200))[1]
		fleetA[#fleetA + 1] = pilot.add("Proteron Archimedes", nil, fleetApos:pos() + vec2.new(500, 200))[1]
		fleetA[#fleetA + 1] = pilot.add("Proteron Watson", nil, fleetApos:pos() + vec2.new(-200, 460))[1]
		for i 1, 10 do
			fleetA[#fleetA + 1] = pilot.add("Proteron Kahan"), nil, fleet[1]:pos() + vec2.new(-230, -275) + vec2.new(75*i - 260, -30*i + 105))[1]
		end
		for i 1, 20 do
			fleetA[#fleetA + 1] = pilot.add("Proteron Derivitive"), nil, fleet[1]:pos() + vec2.new(-200, -200) + vec2.new(50*i - 350, -20*i + 140))[1]
		end
		
		empireB[#empireB + 1] = pilot.add("Empire Peacemaker", nil, empireBpos)[1]
		
