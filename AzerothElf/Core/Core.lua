--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-28
-- Time: 17:44
-- To change this template use File | Settings | File Templates.
--
local N, T = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AzerothElf")
local AzerothElf = LibStub("AceAddon-3.0"):NewAddon("AzerothElf", "AceConsole-3.0", "AceEvent-3.0")
local defaults = {
    global = {
        themePrefix = "AEFTheme_",
        dropSode = { "LEFT", "RIGHT", "BOTTOM" },
        themeList = {}
    },
    profile = {
        enable = true,
        theme = "AEFTheme_Default",
        bigBarrage = false,
        animDuration = 14,
        aefConfig = nil
    },
}

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
            values = {},
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


--初始化
function AzerothElf:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("AzerothElfVariables", defaults, true)
    local addons_count = GetNumAddOns()
    for i = 1, addons_count do
        local name, _, _, _, _, _, _ = GetAddOnInfo(i)
        if T["starts_with"](name, self.db.global.themePrefix) then
            self.db.global.themeList[name] = name
        end
    end
    options["args"]["theme"]["values"] = self.db.global.themeList
    LibStub("AceConfig-3.0"):RegisterOptionsTable("AzerothElf", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("AzerothElf", "AzerothElf")
    self:RegisterChatCommand("aef", "ChatCommand")
--    self:ReConfigHandler()
end

--控制台命令
function AzerothElf:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("aef", "AzerothElf", input)
    end
end

function AzerothElf:SetToggleEnable(_, val)
    self.db.profile.enable = val
    self:ReConfigHandler()
end

function AzerothElf:GetToggleEnable(_)
    return self.db.profile.enable
end

function AzerothElf:SetSelectTheme(_, val)
    self.db.profile.theme = val
    self.db.profile.aefConfig = AzerothElfConfig
    self:ReConfigHandler()
end

function AzerothElf:GetSelectTheme(_)
    return self.db.profile.theme
end

function AzerothElf:SetToggleBigBarrage(_, val)
    self.db.profile.bigBarrage = val
    self:ReConfigHandler()
end

function AzerothElf:GetToggleBigBarrage(_)
    return self.db.profile.bigBarrage
end

function AzerothElf:RegisterEvents()
    local aefConfig = self.db.profile.aefConfig
    if aefConfig ~= nil then
        for _, value in pairs(aefConfig.events) do
            value["dropSode"], value["bigBarrage"], value["animDuration"] = self.db.global.dropSode, self.db.profile.bigBarrage, self.db.profile.animDuration
            self:RegisterEvent(value.event, T["eventHandler"], value)
        end
    end
end

function AzerothElf:UnRegisterEvents()
    local aefConfig = self.db.profile.aefConfig
    if aefConfig ~= nil then
        for _, value in pairs(aefConfig.events) do
            self:UnregisterEvent(value.event)
        end
    end
end

function AzerothElf:ReConfigHandler()
    self:UnRegisterEvents()
    for key, _ in pairs(self.db.global.themeList) do
        DisableAddOn(key)
        self.db.profile.aefConfig = nil
    end
    if self.db.profile.enable then
        print(self.db.profile.theme)
        local a,b = LoadAddOn(self.db.profile.theme)
        print(a,b)
        self.db.profile.aefConfig = AzerothElfConfig
        self:RegisterEvents()
    end
    print(AzerothElfConfig)
    print(3)
end

function AzerothElf:OnEnable()
    self:ReConfigHandler()
end