--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-30
-- Time: 17:33
-- To change this template use File | Settings | File Templates.
--
local N,T = ...
local function starts_with(str, start)
    return str:sub(1, #start) == start
end
local function playAEFSound(soundFile)
    PlaySoundFile(soundFile)
end

local function randItem(item)
    return item[math.random(#item)]
end

local function tableHasKey(table, key)
    return table[key] ~= nil
end

local function createAnimationFrame(texture_file, initial_delay_s, side,anim_duration)
    local anim_frame = CreateFrame("Frame", "BearForceOne_Frame", UIParent)
    local height = anim_frame:GetParent():GetHeight()
    local h = height / 2
    local w = height / 2
    local offset_x = height / 2
    local offset_y = 0
    local anchor_point = ""

    if side == "LEFT" then
        anchor_point = "RIGHT"
    elseif side == "BOTTOM" then
        anchor_point = "TOP"
        local width = anim_frame:GetParent():GetWidth()
        w = width / 4
        height = w
        offset_x = 0
        offset_y = height * 1.5
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
    delay:SetDuration(anim_duration - initial_delay_s)
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

local function createTextScroll(font_size, direction, y_offset, text,anim_duration)
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
    translate:SetDuration(anim_duration)
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
    local drop_side = events_conf["dropSode"]
    local big_barrage = events_conf["bigBarrage"]
    local anim_duration = events_conf["animDuration"]
    if tableHasKey(events_conf, "sounds") then
        local sounds = events_conf.sounds
        playAEFSound(randItem(sounds))
    end
    if tableHasKey(events_conf, "img") then
        local img = events_conf.img
        local anim_frame = createAnimationFrame(randItem(img), math.random(), randItem(drop_side),anim_duration)
        anim_frame:Show()
    end
    if tableHasKey(events_conf, "text") then
        local text = events_conf.text
        local textFrame = ""
        if big_barrage then
            for i = 0, UIParent:GetWidth() do
                if ((i % 35) == 0) then
                    textFrame = createTextScroll(math.random(70,90),randItem(drop_side), i,string.rep(randItem(text),math.random(2,7)),anim_duration)
                    textFrame:Show()
                end
            end
        else
            textFrame = createTextScroll(85, randItem(drop_side), UIParent:GetHeight() * 0.83, randItem(text),anim_duration)
            textFrame:Show()
        end
    end
end
T["eventHandler"] = eventHandler
T["starts_with"] = starts_with
T["tableHasKey"] = tableHasKey