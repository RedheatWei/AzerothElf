--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-26
-- Time: 15:09
-- To change this template use File | Settings | File Templates.
--
local AEF_config = {
    name = "default",
    events = {
        [0] = {
            event = "AUCTION_HOUSE_CLOSED",
            sounds = {
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps1.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps2.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps3.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps4.ogg",
            },
            img = {
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\bottom.tga",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\robert.tga",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\yuri.tga",
            },
            text = {
                "66666666",
                "xxxxxxxx",
                "admin"
            }
        },
        [1] = {
            event = "AUCTION_HOUSE_SHOW",
            sounds = {
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps1.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps2.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps3.ogg",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\sounds\\dps4.ogg",
            },
            img = {
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\bottom.tga",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\robert.tga",
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\yuri.tga",
            },
            text = {
                "66666666",
                "xxxxxxxx",
                "admin"
            }
        },
    }
}
local ANIM_DURATION = 14
local frame = CreateFrame("Frame")
local AZEROTH_ELF_ADDON_PREFIX = "AEF"
local DROP_SIDE = { "LEFT", "RIGHT", "BOTTOM" }
local function playAEFSound(soundFile)
    PlaySoundFile(soundFile)
end

local function randItem(l)
    return l[math.random(#l)]
end

local function tableHasKey(table, key)
    return table[key] ~= nil
end

local function createAnimationFrame(texture_file, initial_delay_s, side)
    local anim_frame = CreateFrame("Frame", "AzerothElf_Frame", UIParent)
    local h = anim_frame:GetParent():GetHeight()
    local w = h / 2
    local offset_x = h / 2
    local offset_y = 0
    local anchor_point = ""

    if side == "LEFT" then
        anchor_point = "RIGHT"
    elseif side == "BOTTOM" then
        anchor_point = "TOP"
        w = anim_frame:GetParent():GetWidth()
        h = w / 4
        offset_x = 0
        offset_y = h
    else
        anchor_point = "LEFT"
        offset_x = offset_x * -1
    end
    anim_frame:SetPoint(anchor_point, UIParent, side, 0, 0)
    anim_frame:SetFrameStrata("BACKGROUND")

    anim_frame:SetSize(w, h)
    anim_frame:Hide()

    local texture = anim_frame:CreateTexture()
    texture:SetAllPoints()
    texture:SetTexture(texture_file)

    local group = texture:CreateAnimationGroup()

    local initial_delay = group:CreateAnimation("Animation")
    initial_delay:SetDuration(initial_delay_s)
    initial_delay:SetOrder(0)

    local translate = group:CreateAnimation("Translation")
    translate:SetOffset(offset_x, offset_y)
    translate:SetDuration(0.2)
    translate:SetOrder(1)

    local delay = group:CreateAnimation("Animation")
    delay:SetDuration(ANIM_DURATION - initial_delay_s)
    delay:SetOrder(1)

    local translate_back = group:CreateAnimation("Translation")
    translate_back:SetOffset(offset_x * -1, offset_y * -1)
    translate_back:SetDuration(0.8)
    translate_back:SetOrder(2)

    anim_frame:SetScript("OnShow", function(self)
        group:Play()
    end)

    group:SetScript("OnFinished", function(self)
        anim_frame:Hide()
    end)

    return anim_frame
end

local function createTextScroll(font_size, direction, y_offset, text)
    local textFrame = CreateFrame("Frame", "BearForceOne_Frame", UIParent)
    local anchor_point = ""
    local translation_offset = ""
    if direction == "LEFT" then
        anchor_point = "BOTTOMRIGHT"
        translation_offset = textFrame:GetParent():GetWidth() * -2
    else
        anchor_point = "BOTTOMLEFT"
        translation_offset = textFrame:GetParent():GetWidth() * 2
    end
    textFrame:ClearAllPoints()
    textFrame:SetHeight(font_size)
    textFrame:SetWidth(textFrame:GetParent():GetWidth() * 1)
    textFrame:SetFrameStrata("BACKGROUND")
    textFrame:Hide()
    textFrame.text = textFrame:CreateFontString(nil, "HIGH", "PVPInfoTextFont")
    textFrame.text:SetAllPoints()
    textFrame:SetPoint(direction, UIParent, anchor_point, 0, y_offset)
    textFrame.text:SetText(text)
    textFrame.text:SetTextColor(math.random(), math.random(), math.random())
    textFrame:SetAlpha(1)

    local group = textFrame:CreateAnimationGroup()

    local translate = group:CreateAnimation("Translation")
    translate:SetOffset(translation_offset, 0)
    translate:SetDuration(ANIM_DURATION)
    translate:SetOrder(1)

    textFrame:SetScript("OnShow", function(self)
        group:Play()
    end)

    group:SetScript("OnFinished", function(self)
        textFrame:Hide()
    end)
    return textFrame
end

local function eventHandler(events_conf)
    if tableHasKey(events_conf, "sounds") then
        local sounds = events_conf.sounds
        playAEFSound(randItem(sounds))
    end
    if tableHasKey(events_conf, "img") then
        local img = events_conf.img
        local anim_frame = createAnimationFrame(randItem(img), math.random(), randItem(DROP_SIDE))
        anim_frame:Show()
    end
    if tableHasKey(events_conf, "text") then
        local text = events_conf.text
        local textFrame = createTextScroll(85, randItem(DROP_SIDE), UIParent:GetHeight() * 0.618, randItem(text))
        textFrame:Show()
    end
end


for key, value in pairs(AEF_config.events) do
    frame:RegisterEvent(value.event)
    frame:SetScript("OnEvent", function(self, event, ...)
        eventHandler(value)
    end)
end