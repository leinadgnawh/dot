local hotkey = require "mjolnir.hotkey"
local grid = require "mjolnir.sd.grid"
local window = require "mjolnir.window"

grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 1

local function pushwindow(d)
  if window.focusedwindow() ~= nil then
    local x = 0
    if d == 'left' then x = 0
    elseif d == 'right' then x = grid.GRIDWIDTH-1
    end

    grid.adjust_focused_window(function(f)
      f.x = x
      f.y = 0
      f.w = grid.GRIDWIDTH/2
      f.h = grid.GRIDHEIGHT+1
    end)
  end
end

mash = {"cmd", "ctrl"}
hotkey.bind(mash, 'H', function() pushwindow('left') end)
hotkey.bind(mash, 'L', function() pushwindow('right') end)

