require("hs.ipc")
require("hs.eventtap")
require("hs.notify")



-- Load wormhole module from wormhole repo
package.path = package.path .. ";/Users/catherine/src/3p/wormhole/hammerspoon/?.lua"
local wormhole = require("wormhole")

-- Terminal toggle
local function terminal()
    local app = hs.application.find("alacritty")
    if app then
        if app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("/Applications/Alacritty.app")
    end
end

-- Cursor toggle
local function cursor()
    local app = hs.application.find("Cursor")
    if app then
        if app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("/Applications/Cursor.app")
    end
end

-- Project hotkey mappings (personal config)
local keymap = {
    [1] = "art",
}

-- Keybindings
wormhole.bindKeys(keymap)
hs.hotkey.bind({}, "f16", terminal)
hs.hotkey.bind({}, "f17", cursor)
hs.hotkey.bind({ "cmd", "alt" }, "r", function()
    hs.reload()
end)
hs.alert.show("♻️", 0.5)
