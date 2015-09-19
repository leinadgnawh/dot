local hotkey = require "mjolnir.hotkey"
local grid = require "mjolnir.sd.grid"
local window = require "mjolnir.window"

grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 1

local function push_window(d)
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

local function size_window(d)
  local win = window.focusedwindow()
  if win ~= nil then
    if d == 'min' then win:minimize()
    elseif d == 'max' then grid.maximize_window()
    end
  end
end

mash = {"cmd", "ctrl"}

hotkey.bind(mash, 'H', function() push_window('left') end)
hotkey.bind(mash, 'J', function() size_window('min') end)
hotkey.bind(mash, 'K', function() size_window('max') end)
hotkey.bind(mash, 'L', function() push_window('right') end)

hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', grid.pushwindow_nextscreen)
