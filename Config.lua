local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CONFIGURATION
--------------------------------------------------------------------------------

C.CombatStatus = {
  ['Position'] = {'CENTER', UIParent, 'CENTER', 0, -120},
  -- position = {point, relativeTo, relativePoint, xOffset, yOffset}
  ['Font'] = STANDARD_TEXT_FONT,  -- font family
  ['FontSize'] = 12,              -- font size
  ['FontStyle'] = 'THINOUTLINE',  -- font outline
  ['Justify'] = 'CENTER',         -- horizontal text alignment
  ['VisibleTime'] = 2,            -- how long indicator is visible
  ['FadeTime'] = .3,              -- how long it takes for indicator to fade
}
