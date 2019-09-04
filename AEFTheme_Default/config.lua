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
            },
            description = "死亡"
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
            },
            description = "升级"
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
            },
            description = "杀死boss"
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
            },
            description = "获得成就"
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
                "有人侵入了炎魔之王的领地，跟着足迹，把他们揪出来，让他们受罚",
            },
            description = "进入新区域"
        },
        {
            event = "AUCTION_HOUSE_SHOW",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\妲己.ogg",
            },
            text = {
                "我的钱多的能买下整个藏宝海湾",
            },
            description = "打开拍卖行"
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
            },
            description = "进入战场"
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
            },
            description = "进入战斗"
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
            },
            description = "获得新坐骑"
        },
        {
            event = "QUEST_COMPLETE",
            sounds = {
                "Interface\\AddOns\\AEFTheme_Default\\sounds\\回答正确.ogg",
            },
            text = {
                "完成了这一个，还会有另一个",
            },
            description = "完成任务"
        },
        {
            event = "BANKFRAME_OPENED",
            description = "打开银行界面"
        },
        {
            event = "BARBER_SHOP_OPEN",
            description = "打开理发店界面"
        },
        {
            event = "CHAT_MSG_COMBAT_MISC_INFO",
            description = "耐久为0"
        },
        {
            event = "RAID_INSTANCE_WELCOME",
            description = "进入一个已经击杀boss的团队副本，并且选择接受进度"
        },
        {
            event = "CONFIRM_XP_LOSS",
            description = "虚弱复活"
        },
        {
            event = "DUEL_REQUESTED",
            description = "发出决斗请求"
        },
        {
            event = "GUILD_INVITE_CANCEL",
            description = "公会邀请被拒绝时触发"
        },
        {
            event = "GUILD_INVITE_REQUEST",
            description = "你被邀请加入公会时触发"
        },
        {
            event = "PLAYER_GUILD_UPDATE",
            description = "玩家被踢出、退出公会"
        },
        {
            event = "BIND_ENCHANT",
            description = "附魔装绑物品"
        },
        {
            event = "DELETE_ITEM_CONFIRM",
            description = "摧毁物品"
        },
        {
            event = "LFG_COMPLETION_REWARD",
            description = "随机本完成"
        },
        {
            event = "LFG_PROPOSAL_SHOW",
            description = "找到随机副本队伍"
        },
        {
            event = "CONFIRM_LOOT_ROLL",
            description = "需求 贪婪时"
        },
        {
            event = "PLAYER_CONTROL_LOST",
            description = "玩家失去控制，如恐惧、在飞行中"
        },
        {
            event = "UPDATE_PENDING_MAIL",
            description = "收到新邮件"
        },
        {
            event = "MERCHANT_SHOW",
            description = "打开交易窗口"
        },
        {
            event = "PARTY_INVITE_REQUEST",
            description = "收到队伍邀请"
        },
    }
}
