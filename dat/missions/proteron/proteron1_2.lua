include("fleethelper.lua")
include("numstring.lua")

lang = naev.lang()
if lang == "es" then
else -- default english
    title = {}
    text = {}
    osd_msg = {}
    misn_desc = {}
    
    reward = 50000
    
    title[1] = "Hiring to Carry Cargo"
    text[1] = [[You walk up to Black Haired Man, and as you approach, motions for you to sit. "'Ello %s! I am requiring you to carry a shipment of cargo to a planet. I was told to do this mission but my ship was disabled and I was forced to escape from them]]

    refusetitle = "Sorry, not today"
    refusetext = [[    "If you wish, I will try to find someone else"]]
    
    text[2] = [[[[The man calmly says under his breath to you; "Be ready for combat... Since I do not have my ship, I will not be helpful if and when you are attacked by the pirates]]]]

    title[3] = "Mission Success"
    text[3] = [[The goods are rushed off your ship by a group of men in strange Uniforms]] 
    
    -- Mission details
    misn_title = "Carry Cargo"
    misn_reward = "50000 credits"
    misn_desc[1] = "Baron Sauterfeldt has summoned you to his ship, which is in the %s system."
    misn_desc[2] = "Baron Sauterfeldt has tasked you with finding an ancient artefact, but he doesn't know exactly where to get it."
    
    -- NPC stuff
    npc_desc = "A Black Haired Man"
    bar_desc = "A Black Haired Man" 
    -- OSD stuff
    osd_msg[1] = "Fly to the Raelid System and land on Raelid Outpost"
    osd_msg[2] = "Land on the Planet"
end

function create ()
    -- Note: this mission makes no system claims.
    misn.setNPC(npc_desc, "neutral/thief1")
    misn.setDesc(bar_desc)
end

function accept()
    targetasset = planet.get("Raelid Outpost")
    targetsystem = system.get("Raelid")

    stage = 1    
    reward = (reward)
    
    if tk.yesno(title[1], text[1]:format)) then
        misn.accept()
        tk.msg(title[2], text[2]

        misn.setTitle(misn_title)
        misn.setReward(reward)
        misn.setDesc(misn_desc[1]:format(baronsys:name()))
        misn.osdCreate(misn_title, { osd[1]})
        marker = misn.markerAdd(targetsystem, "low")
        if freecargo < 10 then
        tk.msg(misn_title,notenoughcargo)
	    misn.finish(false)
	    else
	    Weapons = misn.cargoAdd("Weapons",3)
        
        hook.land("Land")
    else
        tk.msg(refusetitle, refusetext)
        abort()
    end
end

function land ()
    if planet.cur() == targetasset then
    tk.msg(title[3],text[3])
    player.pay (reward)
     

function abort()
    misn.finish(false)
end
