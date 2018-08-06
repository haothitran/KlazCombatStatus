--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local position = {"CENTER", UIParent, "CENTER", 0, -120}
local font = STANDARD_TEXT_FONT   -- font family
local fontSize = 12               -- font size
local fontStyle = "OUTLINE"       -- font style
local textAlign = "CENTER"        -- text justification
local visibletime = 2             -- how long indicator is visible
local fadeTime = .3								-- how long it takes for indicator to fade

--------------------------------------------------------------------------------
-- // STATUS FRAME
--------------------------------------------------------------------------------

local s = CreateFrame("ScrollingMessageFrame", "KlazCombatStatus", UIParent)
s:SetPoint(unpack(position))
s:SetWidth(200)
s:SetHeight(fontSize)
s:SetFont(font, fontSize, fontStyle)
s:SetShadowOffset(0, 0)
s:SetShadowColor(0, 0, 0, 0)
s:SetJustifyH(textAlign)
s:SetMaxLines(1)
s:SetTimeVisible(visibletime)
s:SetFadeDuration(fadeTime)

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:SetScript("OnEvent", function(self, event, subev, arg2, arg3)
  -- leaving combat
	if event == "PLAYER_REGEN_ENABLED" then
		s:AddMessage("-----", 0, 1, 0)
  -- entering combat
	elseif event == "PLAYER_REGEN_DISABLED" then
		s:AddMessage("+++++", 1, 0, 0)
	end
end)
