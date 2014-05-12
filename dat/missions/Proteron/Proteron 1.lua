include "numstring.lua"

lang = naev.lang()
	--not translated atm
else --default english
	--Mission Details
	bar_desc = "You see a Black-Haired man who seems to be looking at you"
	misn_title = "Cargo Courier"
	misn_reward = "%s credits"
	misn_desc = {}
	misn_desc[1] = "Carry Cargo to %s System"
	--fancy text messages
	osd = {}
	osd[1] = "Carry Cargo"
	notenoughcargo = [[You state that, as you do not have enough cargo space abord your ship, you cannot take the mission]]
	title = {}
	title[1] = Hiring Escort
	title[2] = Mission Sucess
	title[3] = Mission Failure
	text = {}
	text[1] = [[You walk up to Black Haired Man, and as you approach, motions for you to sit. "'Ello %s! I am requiring you to carry a shipment of cargo to a planet. I was told to do this mission but my ship was disabled and I was forced to escape]]
	text[2] = [[The man calmly says under his breath to you; "Be ready for combat... Since I do not have my ship, I will not be helpful if and when you are attacked by the pirates]]
	msg = {}
	msg[3] = "You step out of your airlock and see the trader standing near your ship. He hands you a credit chip and stides away"
end
	
include "dat/missions/Proteron/Common.lua"

function create()
	reward = 50000
	startworld = planet.cur()
	targetasset = planet.get("Raelid Outpost")
	targetsystem = system.get("Raelid")
	if system.cur() == targetsystem then
		misn_finish(false)
	end
	
	misn.setReward(reward)
	misn.setTitle(misn_title)
	misn.setNPC(npc_name, "neutral/thief2")
	misn.setDesc(bar_desc)
end
	
function accept()
	tk.msg(misn_title, text[1])
	if not tk.msg(misn_title)
	misn.finish(false)
	end
	tk.msg(misn_title,text[2]
	misn.setDesc(misn_desc)
	misn.accept()
	misn.markerAdd(targetsystem,"plot")
	misn.osdCreate(misn_title,osd)
	misn.osdActive(1)
	freecargo = pilot.cargoFree(pilot.player())
	if freecargo < 10 then
	tk.msg(misn_title,notenoughcargo)
	misn.finish(false)
	end
	Weapons = misn.cargoAdd("Weapons",10)
	hook.land("land")
end

function land()
	if planet.cur() == targetasset then
	tk.msg(misn_title,msg[3])
	player.pay(reward)
	misn.cargoRm(Weapons)
	faction.modPlayer("Proteron",2)
	var.push("proteron_misn_tracker",1)
	misn_finish(true)
	end
end

function abort()
	misn.finish(false)
end
	
