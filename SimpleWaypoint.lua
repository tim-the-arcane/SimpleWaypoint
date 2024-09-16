SLASH_SIMPLEWAYPOINT1 = "/way"
SLASH_SIMPLEWAYPOINT2 = "/waypoint"

-- Funktion zum Setzen des Wegpunkts
local function SetWaypoint(msg)
	local x, y = strsplit(" ", msg)
	x = tonumber(x)
	y = tonumber(y)

	if x and y then
		-- Setze den Wegpunkt auf der aktuellen Karte
		C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(C_Map.GetBestMapForUnit("player"), x / 100, y / 100))
		print("Wegpunkt gesetzt bei: " .. x .. ", " .. y)
		-- Öffne die Weltkarte
		C_SuperTrack.SetSuperTrackedUserWaypoint(true)
		WorldMapFrame:Show()
	else
		print("Bitte benutze das Format: /way x y (z.B. /way 45.3 67.8)")
	end
end

-- Registriere das Chat-Command
SlashCmdList["SIMPLEWAYPOINT"] = SetWaypoint
