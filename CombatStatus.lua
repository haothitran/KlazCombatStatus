--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local s = CreateFrame("ScrollingMessageFrame", "KlazCombatStatus", UIParent)
s:SetPoint("CENTER", UIParent, "CENTER", 0, -120)
s:SetWidth(200)
s:SetHeight(20)
s:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
s:SetShadowOffset(0, 0)
s:SetShadowColor(0, 0, 0, 0)
s:SetJustifyH("CENTER")
s:SetMaxLines(1)
s:SetTimeVisible(2)
s:SetFadeDuration(.3)

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
