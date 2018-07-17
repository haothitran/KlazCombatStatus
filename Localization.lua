local addon, ns = ...
local L = {}
ns.L = L

--------------------------------------------------------------------------------
-- // LOCALIZATION
--------------------------------------------------------------------------------

setmetatable(L, { __index = function(t, k)
	local v = tostring(k)
	t[k] = v
	return v
end })

--------------------------------------------------------------------------------
-- // ENGLISH
--------------------------------------------------------------------------------

L.COMBAT_ENTER = '++ Combat'
L.COMBAT_LEAVE = '-- Combat'

local locale = GetLocale()
if locale == 'enUS' then return end

--------------------------------------------------------------------------------
-- // FRENCH
--------------------------------------------------------------------------------

if locale == 'frFR' then

L.COMBAT_ENTER = '++ Combat'
L.COMBAT_LEAVE = '-- Combat'

return end
