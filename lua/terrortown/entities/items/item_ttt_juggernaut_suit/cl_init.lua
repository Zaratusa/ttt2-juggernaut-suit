-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

LANG.AddToLanguage("english", "juggernaut_suit_name", "Juggernaut Suit")
LANG.AddToLanguage("english", "juggernaut_suit_desc", "Reduces explosion damage by 80%,\nbut you get a maximum of 50 damage,\nit further reduces all elemental damage\nand your movement speed.")

LANG.AddToLanguage("Русский", "juggernaut_suit_name", "Костюм Джаггернаута")
LANG.AddToLanguage("Русский", "juggernaut_suit_desc", "Уменьшает урон от взрыва на 80%,\nно вы получаете максимум 50 урона,\nэто дополнительно снижает весь элементальный урон\nи вашу скорость передвижения.")

hook.Add("TTT2ScoreboardAddPlayerRow", "TTTJuggernautSuit", function(ply)
	local ID64 = ply:SteamID64()

	if (ID64 == "76561198032479768" or ID64 == "76561198114511249" or ID64 == "76561197989909602" or ID64 == "76561198020955880") then
		AddTTT2AddonDev(ID64)
	end
end)
