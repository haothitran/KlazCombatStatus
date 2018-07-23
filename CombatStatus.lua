local addon, ns = ...
local C = ns.C

--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local s = CreateFrame('ScrollingMessageFrame', 'KlazCombatStatus', UIParent)
s:SetPoint(unpack(C.CombatStatus.Position))
s:SetWidth(200)
s:SetHeight(C.CombatStatus.FontSize)
s:SetFont(C.CombatStatus.Font, C.CombatStatus.FontSize, C.CombatStatus.FontStyle)
s:SetShadowOffset(0, 0)
s:SetShadowColor(0, 0, 0, 0)
s:SetJustifyH(C.CombatStatus.Justify)
s:SetMaxLines(1)
s:SetTimeVisible(C.CombatStatus.VisibleTime)
s:SetFadeDuration(C.CombatStatus.FadeTime)

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_REGEN_ENABLED')
f:RegisterEvent('PLAYER_REGEN_DISABLED')
f:SetScript('OnEvent', function(self, event, subev, arg2, arg3)
  -- leaving combat
	if event == 'PLAYER_REGEN_ENABLED' then
		s:AddMessage('-- '..COMBAT, 0, 1, 0)
  -- entering combat
	elseif event == 'PLAYER_REGEN_DISABLED' then
		s:AddMessage('++ '..COMBAT, 1, 0, 0)
	end
end)
