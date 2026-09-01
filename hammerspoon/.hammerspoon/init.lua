local hyper = {"ctrl", "alt", "cmd"}

local function currentWindow()
    return hs.window.focusedWindow()
end

local function moveWindow(x, y, w, h)
    local win = currentWindow()
    if not win then
        return
    end

    local screen = win:screen()
    local frame = screen:frame()

    win:setFrame({
        x = frame.x + frame.w * x,
        y = frame.y + frame.h * y,
        w = frame.w * w,
        h = frame.h * h
    })
end

hs.hotkey.bind(hyper, "left", function()
    moveWindow(0, 0, 0.5, 1)
end)

hs.hotkey.bind(hyper, "right", function()
    moveWindow(0.5, 0, 0.5, 1)
end)

hs.hotkey.bind(hyper, "1", function()
    moveWindow(0, 0, 0.6, 1)
end)

hs.hotkey.bind(hyper, "2", function()
    moveWindow(0.6, 0, 0.4, 1)
end)

hs.hotkey.bind(hyper, "up", function()
    local win = currentWindow()
    if win then
        win:maximize()
    end
end)

hs.hotkey.bind(hyper, "c", function()
    hs.application.launchOrFocus("ChatGPT")
end)

hs.hotkey.bind(hyper, "g", function()
    hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(hyper, "v", function()
    hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "b", function()
    hs.application.launchOrFocus("Google Chrome")
end)

hs.alert.show("Hammerspoon loaded")