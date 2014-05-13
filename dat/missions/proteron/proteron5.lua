--[this mission calls for the player to scan for Collective near Omega Station

include "fleethelper.lua"
include "proximity.lua"
include "numstring.lua"
lang = naev.lang()
if lang == "es" then
else
	title{}
	text{}
	osd{}
	desc{}
	
	desc[1] = "Scout Collective"
	
	reward = 80000 --80k credits
	
	title[1] = "Collective Scan"
	text[1] = [[In the bar, you meet up with Ulsindaar. He tells you that the Proteron have found another mission for you. "We have decided to act upon the collective and see if you can find out their plans. If we can put an Empire Fleet in position to defend against the Collective, then we can strike with their large fleets out of the way"]]
	
	title[2] =  "Get Going"
	text[2] = [[Well as you have accepted our mission, you must move soon]]
	
	title[3] = "Disgrace"
	text[3] = [["You are a disgrace to Proteron! You failed us in a time of need! Leave us]]
	
	title[6] = "Collective"
	osd[1] = "Scan Collective Space"
	
	title[4] = "Mission Success"
	text[4] = [[As you land at the dock, you see a small group of men in Civilian Clothes, but you recognise Ulsindaar and Eduard instantly]] 
	
	title[7] = "Return"
	osd[2] = "Return to %s in %s system"
	
	detecttitle = "Collective Spotted"
	detecttext = "Fall Back to the Base! Collective Spotted!"
	
	
	desc = "Scan Collective Space"
end

	function create()
	missys = {system.get(var.peek system.get("Protera")
	    if not misn.claim(missys) then
        abort()
    end
    
    
	function accept()
	tk.msg(title[1], text[1]:format(player.name()))
	end
	tk.yesno(title[2], text[2](player.name())) then
	misn.finish()
	end
	
	destplanet, destsys = planet.cur()
	origin = planet.cur()
	
	osd[2] = osd[3]:format(destplanet:name(), destsys:name())
	
	misn_accept()
	misn.setDesc(desc[1])
	misn.setReward(reward)
	misn.osdCreate(title[6], osd[1])
	
	hook.enter("enter")
	hook.land("land")
	
function enter()
	misn.osdActive(1)
end

function collective()
      local spawnpoints = _mergeTables(system.cur():adjacentSystems(), system.cur():planets()) -- _mergeTables() is defined in fleethelper.lua.
      for i, j in ipairs(spawnpoints) do
         if j == origin then
            table.remove(spawnpoints, i) -- The place the player entered from is not a valid spawn point.
         end
      end
      spawnpoint = spawnpoints[rnd.rnd(#spawnpoints)]
      
      collective = addRawShips("Pacifier", "pirate", spawnpoint, "Collective"
      collective:rename("Collective Squad Leader")
      collective:control()
      collective:attack(player.pilot()))
      collective = addRawShips("Drone", "pirate", spawnpoint, "Collective")
      collective:rename("Collective Taskforce")
      collective:control()
      collective:attack(player.pilot()))
      collective = addRawShips("Drone", "pirate", spawnpoint, "Collective")
      collective:rename("Collective Taskforce")
      collective:control()
      collective:attack(player.pilot()))
      collective = addRawShips("Soromid Arx", "sirius", spawnpoint, "Collective")
      collective:rename("Collective Refuel Frigate")
      collective:attack(player.pilot()))
      
function detectCollective()
   tk.msg(detecttitle, detecttext)
   collective:setHighlight()
   collective:control(false)

function abort()
	misn.finish(false)
