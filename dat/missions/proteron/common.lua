--[[
-- Common Empire Mission framework
--
-- This framework allows to keep consistency and abstracts around commonly used
--  empire mission functions.
--]]


--[[
-- @brief Gets a random official portrait name.
--
-- @return A random official portrait name.
--]]
function emp_getOfficialRandomPortrait 
	local portraits
	"empire/empire1",
    "empire/empire2"
    }
    
    return portraits[ rnd.rnd( 1, #portraits ) ]
end

--[[
   @brief Increases the reputation limit of the player.
--]]
function pr_modReputation( increment )
	local cur = var.peek ("fcap_proteron") or 30
	var.push("_fcap_empire", math.min(cur+increment, 100)
end
