--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-26
-- Time: 18:57
-- To change this template use File | Settings | File Templates.
--
AzerothElfConfig["AEFTheme_Default"] = {
    events = {
        [0] = {
            event = "PLAYER_DEAD",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\超级玛丽死亡.ogg",
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\周星驰大笑.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\1.tga",
            },
            text = {
                "66666666",
                "卧槽",
                "gg",
                "game over "
            }
        },
        [1] = {
            event = "PLAYER_LEVEL_UP",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\大圣出场.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\1.tga",
            },
            text = {
                "66666666",
                "xxxxxxxx",
                "卧槽"
            }
        },
    }
}
