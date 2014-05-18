include "fleethelper.lua"
include "numstring.lua"
include "proximity.lua"
lang = naev.lang()
else
	title{}
	text{}
	desc{}
	osd{}
	
	misn_title = "Attack"
	
	desc[1] = "Attack Empire"
	
	reward = 500000 --500k because harder msn
	
	title[1] = "Attack the Empire"
	text[1] = [[As you are readying to launch, a face appears on the screen. "It is Time! we must prepare for battle!"]]
	
	title[2] = "Call to War!"
	text[2] = [[All troops! Board your most powerful combat ship you have availible! We must go now for battle!]]
	
	title[3] = "Victory"
	text[3] = [[As the Empire is destroyed by the Proteron Forces, the Proteron general, Kan Orothier, reports that they are recieving distress calls to Zalek, Dvaered, Sirius, and Goddard]]
	
	title[4] = "Attack"
	osd[1] = "Attack the Empire"
	
function create()
	missys = system.get("Arcturus"), system.get("Gamma Polaris")
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
			empireB[#empireB]:setNodisable()
			empireB[#empireB]:setFaction( "Empire" )
			hook.pilot(fleetC[#fleetC], "death", "emp_dead")
		end
		empireC = addShips("Empire Lancelot", nil, empireCpos, 30)
		empireC = addShips("Empire Shark", nil, empireCpos, 40)
		empireC = addShips("Shroedinger", nil, empireCpos, 20)
		
		for _, j in ipairs(fleetA) do
				j:control()
				j:changeAI("idle")
				j:face(empireBpos)
				j:setVisable()
			
		for _, j in ipairs(empireB) do
                j:control()
                j:face(fleetApos)
                j:setVisible()
        
        for _, j in ipairs(empireC) do
				j:control()
				j:face(fleetApos)
				j:setVisable()
		end
		
		hook.timer(500, "proximity", {location = fleetEpos, radius = 800, funcname = "prestartBattle"})
		
            if last_sys ~= misn_target_sys2 then
            -- Jumped in through the wrong jump point
                alertEmpire()
                for _, j in ipairs(fleetC) do
                    j:control()
                    j:attack(player.pilot())
                end
            end
        elseif system.cur() == misn_target_sys1 or system.cur() == misn_target_sys2 then
            pilot.clear()
            pilot.toggleSpawn(false)
            misn.osdActive(1)
            misn_stage = 1
        else
            misn.osdActive(1)
            misn_stage = 1
        end
    end
end


function prestartBattle()
    fleetA[1]:broadcast(start_comm)
    hook.timer(6000, "startBattle")
    
function startBattle()
    misn.osdActive(2)
    alertEmpire()
    for _, j in ipairs(fleetE) do
        j:control(false)
    end
    player.pilot():setVisible()
end

function emp_dead()
	if deathsB = 1 then
	diff.apply("empire_dead")
	misn_stage = 2
	end
	

function proteronmessenger()
	if mesship:exists() then
	   mesship:broadcast("Proteron Army ready to move in! Prepare to return to base! Congratulations Team Alpha!")
	   hook.timer (20000, "proteronmessenger")
	end
end

function addProteron()
   mesship = pilot.add( "Proteron Derivitive")
   mesship:rename("Messenger")
   mesship:setFaction("Proteron")
   mesship:setFriendly()
   mesship:setVisplayer()
   mesship:setHilight()
   
   mesship:rmOutfit("all")
   mesship:addOutfit( "Engine Reroute", l )
   mesship:setFuel( true )
   
function land()
	if misn_stage == 2 and planet.cur() == misn_base then
	  
	   tk.msg( title[3], string.format(text[3], misn_base:name()) )
	   
	   faction.modPlayerSingle("Proteron",10)
	   player.pay (900000)
	   
	   misn.finish(true)
	end
end

function abort()
	faction.modPlayerSingle("Proteron",-5)
	misn.finish(false)
end
