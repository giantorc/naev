include "numstring.lua"
lang = naev.lang
if lang = "es" then
else
	title{}
	text{}
	osd{}
	desc{}
	
	desc[1] = "Warn Empire"
	
	reward = "None"
	
	title[1] = "Ulsindaar"
	text[1] = [["Right. We need you to warn the Empire of the collective threat so that they will repel it and be unable to defend against our defenses."]]
	
	title[2] = "Mission Success"
	text[2] = "Good the Attack will begin shortly"	
end

function create()
	targetasset = planet.get("Omega Station")
	targetsystem = system.get("Fortitude")
	if system.cur == targetsystem then
		misn_finish(false)
	end
	
	misn.setReward(reward)
	misn.setDesc(desc)
	misn.setTitle(title)
	misn.setNPC("Ulsindaar", "neutral/thief1")
end

function accept()
	tk.msg(title[1], text[1])
	if not tk.msg(misn_title)
	misn.finish(false)
	end
	misn.setDesc(Desc)
	misn.accept()
	
function land()
	if planet.cur == targetasset
	player.pay(reward)
	faction.modPlayerSingle("proteron", 2)
	misn.finish(true)
	
function abort()
	misn.finish(false)
end
