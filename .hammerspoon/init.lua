local hotkey = require "hs.hotkey"
local grid = require "hs.grid"
local window = require "hs.window"
local screen = require "hs.screen"

grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

window.animationDuration = 0

local function push_window(d)
  local win = window.focusedWindow()
  if win ~= nil then
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

    grid.adjustWindow(function(f)
      f.x = x
      f.y = y
      f.w = w
      f.h = h
    end, win)
  end
end

local function move_window(dy,dx)
  local win = window.focusedWindow()
  if win ~= nil then
    local y = 0
    local w = grid.GRIDWIDTH/2
    local h = grid.GRIDHEIGHT/2

    if dy == 'down' then
      y = grid.GRIDHEIGHT/2
    elseif d == 'up' then
      y = 0
    end

    if dx == 'left' then
      x = 0
    elseif dx == 'right' then
      x = grid.GRIDWIDTH/2
    end

    grid.adjustWindow(function(f)
      f.x = x
      f.y = y
      f.w = w
      f.h = h
    end, win)
  end
end

local function size_window(d)
  local win = window.focusedWindow()
  if win ~= nil then
    if d == 'min' then win:minimize()
    elseif d == 'max' then grid.maximizeWindow()
    end
  end
end

local function next_screen()
  local win = window.focusedWindow()
  win:moveToScreen(win:screen():next())
end

mash = {"cmd", "ctrl"}

hotkey.bind(mash, 'J', function() push_window('left') end)
hotkey.bind(mash, 'K', function() push_window('down') end)
hotkey.bind(mash, 'I', function() push_window('up') end)
hotkey.bind(mash, 'L', function() push_window('right') end)

hotkey.bind(mash, 'N', function() next_screen() end)
hotkey.bind(mash, 'P', function() next_screen() end)

hotkey.bind(mash, 'M', function() size_window('min') end)
hotkey.bind(mash, 'O', function() size_window('max') end)

hotkey.bind(mash, 'U', function() move_window('up', 'left') end)
hotkey.bind(mash, 'O', function() move_window('up', 'right') end)
hotkey.bind(mash, 'H', function() move_window('down', 'left') end)
hotkey.bind(mash, ';', function() move_window('down', 'right') end)
