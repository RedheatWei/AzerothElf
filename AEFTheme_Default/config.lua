--
-- Created by IntelliJ IDEA.
-- User: Redheat
-- Date: 2019-08-26
-- Time: 18:57
-- To change this template use File | Settings | File Templates.
--
AzerothElfConfig["AEFTheme_Default"] = {
    events = {
        {
            event = "PLAYER_DEAD",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\超级玛丽死亡.ogg",
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\周星驰大笑.ogg",
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\笑声.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "66666666",
                "gg",
                "game over "
            }
        },
        {
            event = "PLAYER_LEVEL_UP",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\大圣出场.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\羊驼.tga",
            },
            text = {
                "66666666",
            }
        },
--        {
--            event = "PLAYER_ENTERING_WORLD",
--            sounds = {
--                "Interface\\AddOns\\AEFTheme_Default\\sounds\\小霸王开始游戏.ogg",
--                "Interface\\AddOns\\AEFTheme_Default\\sounds\\新闻联播.ogg",
--            },
--            img = {
--                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
--            },
--            text = {
--                "66666666",
--                "xxxxxxxx",
--                "卧槽"
--            }
--        },
        {
            event = "BOSS_KILL",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\卡丁车胜利.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\羊驼.tga",
            },
            text = {
                "66666666",
                "卧槽",
                "黑手别摸"
            }
        },
        {
            event = "ACHIEVEMENT_EARNED",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\愤怒的小鸟通关.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "66666666",
            }
        },
        {
            event = "ZONE_CHANGED_NEW_AREA",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\超级玛丽开始.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "有人侵入了炎魔之王的领地，把他们揪出来，让他们受罚",
            }
        },
        {
            event = "AUCTION_HOUSE_SHOW",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\妲己.ogg",
            },
            text = {
                "我的钱多的能买下整个藏宝海湾",
            }
        },
        {
            event = "PLAYER_ENTERING_BATTLEGROUND",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\世界杯赛前.ogg",
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\坦克大战.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "新的一波送死开始了",
            }
        },
        {
            event = "PLAYER_ENTER_COMBAT",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\马里奥跳跃.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "快跑吧小姑娘，快跑",
            }
        },
        {
            event = "NEW_MOUNT_ADDED",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\筋斗云.ogg",
            },
            img = {
                "Interface\\AddOns\\AEFTheme_Default\\img\\哈士奇.tga",
            },
            text = {
                "快开车",
            }
        },
        {
            event = "QUEST_COMPLETE",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\回答正确.ogg",
            },
            text = {
                "完成了这一个，还会有另一个",
            }
        },
    }
}
