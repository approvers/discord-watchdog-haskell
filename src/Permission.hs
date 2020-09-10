module Permission
    ( PermissionFlag (..)
    ) where

data PermissionFlag =
    CreateInstantInvite |
    KickMembers |
    BanMembers |
    Administrator |
    ManageChannels |
    ManageGuild |
    AddReactions |
    ViewAuditLog |
    PrioritySpeaker |
    Stream |
    ViewChannel |
    SendMessages |
    SendTtsMessages |
    ManageMessages |
    EmbedLinks |
    AttachFiles |
    ReadMessageHistory |
    MentionEveryone |
    UseExternalEmojis |
    ViewGuildInsights |
    Connect |
    Speak |
    MuteMembers |
    DeafenMembers |
    MoveMembers |
    UseVad |
    ChangeNickname |
    ManageNicknames |
    ManageRoles |
    ManageWebhooks |
    ManageEmojis
    deriving (Show, Eq)
