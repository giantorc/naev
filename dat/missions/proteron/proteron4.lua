include "numstring.lua"

	lang = naev.lang
	else

	bar_desc = "Agent Ulsindaar"
	misn_title = "Report Back"
	misn_reward = "None"
	misn_desc = {}
	misn_desc[1] = "Report to Proteron"
	title = {}
	title[1] = "Ulsindaar"
	title[2] = "Reporting Back"
	text = {}
	text[1] = [[You see Ulsindaar speaking to an Empire Soldier at a table. They are talking about "The Collective" a group of robotic drones that have intercepted several Empire brigades travelling to various systems. Ulsindaar winks at you, and you realize that this is the kind of information you should report]]
	text[2] = [[You step up to Ulsindaar and he orders you to follow him, and you both travel to your ship]]
	text[3] = [[As you land, Ulsindaar tells you that they are meeting in a new building, Old Colony Outfitters, an abandoned equipment shop. You tell them about the government the Collective, who are threatinging the Empire Shipping crews.]]
	ulsindaarname = "Ulsindaar"
	ulsindaardesc = "A Proteron Agent"
	
	misn_desc = "Report Collective to Proteron"
	misn_reward = "A break from spy work and 40,000 credits"
end

function create()

	misn.setNpc(ulsindaarname, "dat/gfx/portraits/neutral/unique/flintley"
	misn.setDesc(ulsindaardesc)
end

function accept()
	if var.peek("Proteron4") then 
      tk.msg(title1, text1r:format(player.name()))
      tk.msg(title1, text2:format(player.name(), player.name()))
    else
	end
	tk.msg(title2, text3:format(planet.cur():name()))
	destplanet, destsys = planet.cur()
	origin = planet.cur()
	
	misn.accept()
	misn.setDesc(misn_desc)
	misn.setReward(misn_reward)
	
function land()
	origin = planet.cur()
	if planet.cur() == destplanet
	   tk.msg(title2, text3:format(player.name()))
	   player.pay(40000)
	   misn.finish(true)
	end
end

function abort()
	misn.finish(false)
end
