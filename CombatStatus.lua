local addon, ns = ...
local C = ns.C

--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, addon)
	if addon ~= KlazCombatStatus then
		local function initDB(db, defaults)
			if type(db) ~= "table" then db = {} end
			if type(defaults) ~= "table" then return db end
			for k, v in pairs(defaults) do
				if type(v) == "table" then
					db[k] = initDB(db[k], v)
				elseif type(v) ~= type(db[k]) then
					db[k] = v
				end
			end
		return db
	end

		KlazCombatStatusDB = initDB(KlazCombatStatusDB, C.Position)
		C.UserPlaced = KlazCombatStatusDB
		self:UnregisterEvent("ADDON_LOADED")
	end
end)

--------------------------------------------------------------------------------
-- // ANCHOR FRAME
--------------------------------------------------------------------------------

local anchor = CreateFrame("Frame", "KlazCombatStatusAnchor", UIParent)
anchor:SetSize(C.Size.Width, C.Size.Height)
anchor:SetBackdrop({bgFile=[[Interface\MINIMAP\TooltipBackdrop-Background]]})
anchor:SetFrameStrata("HIGH")
anchor:SetMovable(true)
anchor:SetClampedToScreen(true)
anchor:EnableMouse(true)
anchor:SetUserPlaced(true)
anchor:RegisterForDrag("LeftButton")
anchor:RegisterEvent("PLAYER_LOGIN")
anchor:Hide()

anchor.text = anchor:CreateFontString(nil, "OVERLAY")
anchor.text:SetAllPoints(anchor)
anchor.text:SetFont(C.Font.Family, C.Font.Size, C.Font.Style)
anchor.text:SetShadowOffset(0, 0)
anchor.text:SetText("|cff1994ff+-+-+|r")

anchor:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_LOGIN" then
		self:ClearAllPoints()
		self:SetPoint(
		C.UserPlaced.Point,
		C.UserPlaced.RelativeTo,
		C.UserPlaced.RelativePoint,
		C.UserPlaced.XOffset,
		C.UserPlaced.YOffset)
	end
end)

anchor:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)

anchor:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	self:SetUserPlaced(false)

	point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint(1)
		if relativeTo then
			relativeTo = relativeTo:GetName();
		else
			relativeTo = self:GetParent():GetName();
		end

	C.UserPlaced.Point = point
	C.UserPlaced.RelativeTo = relativeTo
	C.UserPlaced.RelativePoint = relativePoint
	C.UserPlaced.XOffset = xOffset
	C.UserPlaced.YOffset = yOffset
end)

--------------------------------------------------------------------------------
-- // COMBAT STATUS
--------------------------------------------------------------------------------

local s = CreateFrame('ScrollingMessageFrame', 'KlazCombatStatus', UIParent)
s:SetPoint("CENTER", anchor, "CENTER", 0, 4)
s:SetSize(C.Size.Width, C.Size.Height)
s:SetFont(C.Font.Family, C.Font.Size, C.Font.Style)
s:SetShadowOffset(0, 0)
s:SetJustifyH('CENTER')
s:SetMaxLines(1)
s:SetTimeVisible(2)
s:SetFadeDuration(.3)

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_REGEN_ENABLED')
f:RegisterEvent('PLAYER_REGEN_DISABLED')
f:SetScript('OnEvent', function(self, event, subev, arg2, arg3)
  -- leaving combat
	if event == 'PLAYER_REGEN_ENABLED' then
		s:AddMessage('-----', 0, 1, 0)
  -- entering combat
	elseif event == 'PLAYER_REGEN_DISABLED' then
		s:AddMessage('+++++', 1, 0, 0)
	end
end)

--------------------------------------------------------------------------------
-- // SLASH COMMAND
--------------------------------------------------------------------------------

SlashCmdList.KLAZCOMBATSTATUS = function (msg, editbox)
	if (string.lower(msg) == "reset") then
		KlazCombatStatusDB = C.Position
		ReloadUI()
	elseif (string.lower(msg) == "unlock") then
		if not anchor:IsShown() then
      anchor:Show()
			print("|cff1994ffKlazCombatStatus|r |cff00ff00Unlocked.|r")
    end
	elseif (string.lower(msg) == "lock") then
		anchor:Hide()
		print("|cff1994ffKlazCombatStatus|r |cffff0000Locked.|r")
	else
		print("------------------------------------------")
		print("|cff1994ffKlazCombatStatus commands:|r")
		print("------------------------------------------")
		print("|cff1994ff/klazcombatstatus unlock|r Unlocks frame to be moved.")
		print("|cff1994ff/klazcombatstatus lock|r Locks frame in position.")
		print("|cff1994ff/klazcombatstatus reset|r Resets frame to default position.")
	end
end
SLASH_KLAZCOMBATSTATUS1 = '/klazcombatstatus'
SLASH_KLAZCOMBATSTATUS2 = '/kcombatstatus'
SLASH_KLAZCOMBATSTATUS3 = '/kcs'
