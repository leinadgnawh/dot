local hotkey = require "mjolnir.hotkey"
local grid = require "mjolnir.sd.grid"
local window = require "mjolnir.window"

grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

local function push_window(d)
  if window.focusedwindow() ~= nil then
    local x = 0
    local y = 0
    local w = grid.GRIDWIDTH/2
    local h = grid.GRIDHEIGHT

    if d == 'left' then
      x = 0
    elseif d == 'down' then
      y = grid.GRIDHEIGHT/2
      w = grid.GRIDWIDTH
      h = grid.GRIDHEIGHT/2
    elseif d == 'up' then
      y = 0
      w = grid.GRIDWIDTH
      h = grid.GRIDHEIGHT/2
    elseif d == 'right' then
      x = grid.GRIDWIDTH-1
    end

    grid.adjust_focused_window(function(f)
      f.x = x
      f.y = y
      f.w = w
      f.h = h
    end)
  end
end

local function move_window(d)
  if window.focusedwindow() ~= nil then
    local y = 0
    local w = grid.GRIDWIDTH/2
    local h = grid.GRIDHEIGHT/2

    if d == 'down' then
      y = grid.GRIDHEIGHT/2
    elseif d == 'up' then
      y = 0
    end

    grid.adjust_focused_window(function(f)
      f.y = y
      f.w = w
      f.h = h
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
hotkey.bind(mash, 'J', function() push_window('down') end)
hotkey.bind(mash, 'K', function() push_window('up') end)
hotkey.bind(mash, 'L', function() push_window('right') end)

hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', grid.pushwindow_nextscreen)

mash = {"cmd", "ctrl", "shift"}

hotkey.bind(mash, 'J', function() size_window('min') end)
hotkey.bind(mash, 'K', function() size_window('max') end)

mash = {"ctrl", "shift"}
hotkey.bind(mash, 'J', function() move_window('down') end)
hotkey.bind(mash, 'K', function() move_window('up') end)
