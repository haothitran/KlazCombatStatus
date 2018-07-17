local addon, ns = ...
local C = ns.C
local L = ns.L

--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local s = CreateFrame('ScrollingMessageFrame', 'KlazCombatStatus', UIParent)
s:SetPoint(unpack(C.Combat.Position))
s:SetWidth(200)
s:SetHeight(C.Combat.FontSize)
s:SetFont(C.Combat.Font, C.Combat.FontSize, C.Combat.FontStyle)
s:SetShadowOffset(0, 0)
s:SetShadowColor(0, 0, 0, 0)
s:SetJustifyH(C.Combat.Justify)
s:SetMaxLines(1)
s:SetTimeVisible(C.Combat.VisibleTime)
s:SetFadeDuration(C.Combat.FadeTime)

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_REGEN_ENABLED')
f:RegisterEvent('PLAYER_REGEN_DISABLED')
f:SetScript('OnEvent', function(self, event, subev, arg2, arg3)
  -- leaving combat
	if event == 'PLAYER_REGEN_ENABLED' then
		s:AddMessage(L.COMBAT_LEAVE, 0, 1, 0)
  -- entering combat
	elseif event == 'PLAYER_REGEN_DISABLED' then
		s:AddMessage(L.COMBAT_ENTER, 1, 0, 0)
	end
end)
