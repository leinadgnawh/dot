local hotkey = require "mjolnir.hotkey"
local grid = require "mjolnir.sd.grid"

grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 1

local function pushwindow_left()
  grid.adjust_focused_window(function(f)
    f.x = 0
    f.y = 0
    f.w = grid.GRIDWIDTH/2
    f.h = grid.GRIDHEIGHT+1
  end)
end

local function pushwindow_right()
  grid.adjust_focused_window(function(f)
    f.x = grid.GRIDWIDTH-1
    f.y = 0
    f.w = grid.GRIDWIDTH/2
    f.h = grid.GRIDHEIGHT+1
  end)
end

mash = {"cmd", "ctrl"}
hotkey.bind(mash, 'H', pushwindow_left)
hotkey.bind(mash, 'L', pushwindow_right)

