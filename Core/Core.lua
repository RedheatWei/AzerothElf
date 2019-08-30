--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-28
-- Time: 17:44
-- To change this template use File | Settings | File Templates.
--
local N, T = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AzerothElf")
local AzerothElf = LibStub("AceAddon-3.0"):NewAddon("AzerothElf", "AceConsole-3.0")
AzerothElfConfig = nil

local options = {
    name = L["AzerothElf"],
    handler = AzerothElf,
    type = 'group',
    args = {
        theme = {
            name = L["Theme"],
            desc = L["Select theme"],
            type = "select",
            style = "dropdown",
            values = { default = "default", x = "x", y = "y" },
            set = "SetSelectTheme",
            get = "GetSelectTheme"
        },
        bigBarrage = {
            name = L["Big barrage mode"],
            desc = L["Enables / disables big barrage mode"],
            type = "toggle",
            set = "SetToggleBigBarrage",
            get = "GetToggleBigBarrage"
        },
        enable = {
            name = L["Enable AzerothElf"],
            desc = L["Enables / disables AzerothElf"],
            width = "full",
            type = "toggle",
            set = "SetToggleEnable",
            get = "GetToggleEnable"
        },
    },
}

local defaults = {
    global = {
        themePrefix = "AEFTheme_",
        dropSode = { "LEFT", "RIGHT", "BOTTOM" }
    },
    profile = {
        enable = true,
        theme = 1,
        bigBarrage = false,
        animDuration = 14,
        aefConfig = nil
    },
}


function AzerothElf:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("AzerothElfVariables", defaults, true)
    LibStub("AceConfig-3.0"):RegisterOptionsTable("AzerothElf", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("AzerothElf", "AzerothElf")
    self:RegisterChatCommand("aef", "ChatCommand")
    local addons_count = GetNumAddOns()
    for i = 1, addons_count do
        local name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(i)
        if T["starts_with"](name, self.db.global.themePrefix) then
            options["args"]["theme"]["values"][name] = name
        end
    end
end

function AzerothElf:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("aef", "AzerothElf", input)
    end
end


local function RegisterEvents(aefConfig)
    if aefConfig ~= nil then
        for key, value in pairs(aefConfig.events) do
            LibStud("AceEvent-3.0"):RegisterEvent(value.event, T["eventHandler"], value)
        end
    end
end

local function UnRegisterEvents(aefConfig)
    if aefConfig ~= nil then
        for key, value in pairs(aefConfig.events) do
            LibStud("AceEvent-3.0"):UnregisterEvent(value.event)
        end
    end
end

function AzerothElf:SetToggleEnable(info, val)
    self.db.profile.enable = val
    if val then
        RegisterEvents(self.db.profile.aefConfig)
    else
        UnRegisterEvents(self.db.profile.aefConfig)
    end
end

function AzerothElf:GetToggleEnable(info, val)
    return self.db.profile.enable
end

function AzerothElf:SetSelectTheme(info, val)
    self.db.profile.theme = val
    for i = 1, #options["args"]["theme"] do
        if options["args"]["theme"][i] ~= self.db.profile.theme then
            DisableAddOn(options["args"]["theme"][i])
        end
    end
    LoadAddOn(self.db.profile.theme)
    self.db.profile.aefConfig = AzerothElfConfig
end

function AzerothElf:GetSelectTheme(info, val)
    return self.db.profile.theme
end

function AzerothElf:SetToggleBigBarrage(info, val)
    self.db.profile.bigBarrage = val
end

function AzerothElf:GetToggleBigBarrage(info, val)
    return self.db.profile.bigBarrage
end



--    frame:RegisterEvent(value.event)
--    frame:SetScript("OnEvent", function(self, event, ...)
--        eventHandler(value)
--    end)

--local SETTING = {
--    THEME_PREFIX = "AEFTheme_",
--    THEME_CURRENT = nil,
--    THEME_LIST = {},
--    ANIM_DURATION = 14,
--    DROP_SIDE = { "LEFT", "RIGHT", "BOTTOM" },
--    BIG_BARRAGE = false,
--    THEME_CONFIG = nil
--}
--
--local ANIM_DURATION,DROP_SIDE,BIG_BARRAGE = SETTING["ANIM_DURATION"],SETTING["DROP_SIDE"],SETTING["BIG_BARRAGE"]
--
--local function playAEFSound(soundFile)
--    PlaySoundFile(soundFile)
--end
--
--local function randItem(l)
--    return l[math.random(#l)]
--end
--
--local function tableHasKey(table, key)
--    return table[key] ~= nil
--end
--
--local function createAnimationFrame(texture_file, initial_delay_s, side)
--    local anim_frame = CreateFrame("Frame", "AzerothElf_Frame", UIParent)
--    local height = anim_frame:GetParent():GetHeight()
--    local h = height / 2
--    local w = height / 2
--    local offset_x = height / 2
--    local offset_y = 0
--    local anchor_point = ""
--
--    if side == "LEFT" then
--        anchor_point = "RIGHT"
--    elseif side == "BOTTOM" then
--        anchor_point = "TOP"
--        local width = anim_frame:GetParent():GetWidth()
--        w = width / 4
--        height = w
--        offset_x = 0
--        offset_y = height * 1.5
--    else
--        anchor_point = "LEFT"
--        offset_x = offset_x * -1
--    end
--    anim_frame:SetPoint(anchor_point, UIParent, side, 0, 0)
--    anim_frame:SetFrameStrata("BACKGROUND")
--
--    anim_frame:SetSize(w, h)
--    anim_frame:Hide()
--
--    local texture = anim_frame:CreateTexture()
--    texture:SetAllPoints()
--    texture:SetTexture(texture_file)
--
--    local group = texture:CreateAnimationGroup()
--
--    local initial_delay = group:CreateAnimation("Animation")
--    initial_delay:SetDuration(initial_delay_s)
--    initial_delay:SetOrder(0)
--
--    local translate = group:CreateAnimation("Translation")
--    translate:SetOffset(offset_x, offset_y)
--    translate:SetDuration(0.2)
--    translate:SetOrder(1)
--
--    local delay = group:CreateAnimation("Animation")
--    delay:SetDuration(ANIM_DURATION - initial_delay_s)
--    delay:SetOrder(1)
--
--    local translate_back = group:CreateAnimation("Translation")
--    translate_back:SetOffset(offset_x * -1, offset_y * -1)
--    translate_back:SetDuration(0.8)
--    translate_back:SetOrder(2)
--
--    anim_frame:SetScript("OnShow", function(self)
--        group:Play()
--    end)
--
--    group:SetScript("OnFinished", function(self)
--        anim_frame:Hide()
--    end)
--
--    return anim_frame
--end
--
--local function createTextScroll(font_size, direction, y_offset, text)
--    local textFrame = CreateFrame("Frame", "BearForceOne_Frame", UIParent)
--    local anchor_point = ""
--    local translation_offset = ""
--    if direction == "LEFT" then
--        anchor_point = "BOTTOMRIGHT"
--        translation_offset = textFrame:GetParent():GetWidth() * -2
--    else
--        anchor_point = "BOTTOMLEFT"
--        translation_offset = textFrame:GetParent():GetWidth() * 2
--    end
--    textFrame:ClearAllPoints()
--    textFrame:SetHeight(font_size)
--    textFrame:SetWidth(textFrame:GetParent():GetWidth() * 1)
--    textFrame:SetFrameStrata("BACKGROUND")
--    textFrame:Hide()
--    textFrame.text = textFrame:CreateFontString(nil, "HIGH", "PVPInfoTextFont")
--    textFrame.text:SetAllPoints()
--    textFrame:SetPoint(direction, UIParent, anchor_point, 0, y_offset)
--    textFrame.text:SetText(text)
--    textFrame.text:SetTextColor(math.random(), math.random(), math.random())
--    textFrame:SetAlpha(1)
--
--    local group = textFrame:CreateAnimationGroup()
--
--    local translate = group:CreateAnimation("Translation")
--    translate:SetOffset(translation_offset, 0)
--    translate:SetDuration(ANIM_DURATION)
--    translate:SetOrder(1)
--
--    textFrame:SetScript("OnShow", function(self)
--        group:Play()
--    end)
--
--    group:SetScript("OnFinished", function(self)
--        textFrame:Hide()
--    end)
--    return textFrame
--end
--
--local function eventHandler(events_conf)
--    if tableHasKey(events_conf, "sounds") then
--        local sounds = events_conf.sounds
--        playAEFSound(randItem(sounds))
--    end
--    if tableHasKey(events_conf, "img") then
--        local img = events_conf.img
--        local anim_frame = createAnimationFrame(randItem(img), math.random(), randItem(DROP_SIDE))
--        anim_frame:Show()
--    end
--    if tableHasKey(events_conf, "text") then
--        local text = events_conf.text
--        local textFrame = ""
--        if BIG_BARRAGE then
--            for i = 0, UIParent:GetWidth() do
--                if ((i % 35) == 0) then
--                    textFrame = createTextScroll(math.random(70,90),randItem(DROP_SIDE), i,string.rep(randItem(text),math.random(2,7)))
--                    textFrame:Show()
--                end
--            end
--        else
--            textFrame = createTextScroll(85, randItem(DROP_SIDE), UIParent:GetHeight() * 0.83, randItem(text))
--            textFrame:Show()
--        end
--    end
--end


--function AzerothElf:OnInitialize()
--    self.db = LibStub("AceDB-3.0"):New("AzerothElfVariables")
--    if SETTING["THEME_CURRENT"] == nil then
--        SETTING["THEME_CURRENT"] = "default"
--    end
--    self.db.char.THEME_CURRENT = SETTING["THEME_CURRENT"]
--    local addons_count = GetNumAddOns()
--    for i = 0, addons_count do
--        local name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(i)
--        if string.startsWith(name,SETTING["THEME_PREFIX"]) then
--            table.insert(SETTING["THEME_LIST"],name)
--        end
--    end
--    local frame = CreateFrame("Frame")
--end

--function AzerothElf:OnEnable()
--    for key, value in pairs(SETTING["THEME_CONFIG"].events) do
--        frame:RegisterEvent(value.event)
--        frame:SetScript("OnEvent", function(self, event, ...)
--            eventHandler(value)
--        end)
--    end
--end
--
--function AzerothElf:OnDisable()
--    frame:Hide()
--end

