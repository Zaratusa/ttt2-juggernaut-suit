-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

-- TTT2 fixes "[T]obiti"
-- contact "https://steamcommunity.com/profiles/76561197989909602"

-- TTT2 fixes "V3kta"
-- contact "http://steamcommunity.com/profiles/76561198020955880"

CreateConVar("ttt_juggernautsuit_detective", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Detectives be able to buy the Juggernaut Suit?", 0, 1)
CreateConVar("ttt_juggernautsuit_traitor", 0, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Traitors be able to buy the Juggernaut Suit?", 0, 1)
local speed = CreateConVar("ttt_juggernautsuit_speed", 0.80, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "The speed multiplier for the Juggernaut Suit.")

ITEM_JUGGERNAUT_SUIT = "item_ttt_juggernaut_suit"

ITEM.EquipMenuData = {
	type = "item_passive",
	name = "juggernaut_suit_name",
	desc = "juggernaut_suit_desc",
}
ITEM.hud = Material("vgui/ttt/perks/item_juggernaut_suit_hud.png")
ITEM.material = "vgui/ttt/icon_juggernaut_suit"
ITEM.CanBuy = {}
ITEM.credits = 1

if (GetConVar("ttt_juggernautsuit_detective"):GetBool()) then
	table.insert(ITEM.CanBuy, ROLE_DETECTIVE)
end
if (GetConVar("ttt_juggernautsuit_traitor"):GetBool()) then
	table.insert(ITEM.CanBuy, ROLE_TRAITOR)
end

--[[Perk logic]]--
hook.Add("TTTPlayerSpeedModifier", "TTTJuggernautSuit", function(ply, _, _, speedMultiplierModifier)
	if (IsValid(ply) and ply:HasEquipmentItem(ITEM_JUGGERNAUT_SUIT)) then
		speedMultiplierModifier[1] = speedMultiplierModifier[1] * speed:GetFloat()
	end
end)
