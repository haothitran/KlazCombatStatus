local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CONFIG
--------------------------------------------------------------------------------

C.Font = {
  ["Family"] = STANDARD_TEXT_FONT,  -- font family
  ["Size"] = 16,                    -- font size
  ["Style"] = "OUTLINE",            -- font outline
}

C.Size = {
  ["Width"] = 80,                   -- frame width
  ["Height"] = 24,                  -- frame height
}

C.Position = {
	["Point"] = "CENTER",             -- attachment point to parent
	["RelativeTo"] = "UIParent",      -- parent frame
	["RelativePoint"] = "CENTER",     -- parent attachment point
	["XOffset"] = 0,                  -- horizontal offset from parent point
	["YOffset"] = -110,               -- vertical offset from parent point
}
