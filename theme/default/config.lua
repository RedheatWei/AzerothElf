--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-26
-- Time: 18:57
-- To change this template use File | Settings | File Templates.
--
local addonName, addonTable = ...
addonTable.AEF_config = {
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
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\1.tga",
            },
            text = {
                "66666666",
                "xxxxxxxx",
                "卧槽"
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
                "Interface\\AddOns\\AzerothElf\\theme\\default\\img\\1.tga",
            },
            text = {
                "66666666",
                "xxxxxxxx",
                "卧槽"
            }
        },
    }
}