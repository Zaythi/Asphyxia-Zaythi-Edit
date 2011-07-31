local addon, ns = ...
ns.config = {
    ---------------------------------------------------------------------------------
    -- use ["option"] = true/false, to set options.
    -- options
    -- blizz damage options.
        ["blizzheadnumbers"] = false, -- use blizzard damage/healing output (above mob/player head)
        ["damagestyle"]      = true,  -- change default damage/healing font above mobs/player heads. you need to restart WoW to see changes! has no effect if blizzheadnumbers = false

    -- xCT outgoing damage/healing options
        ["damage"]       = true,  -- show outgoing damage in it's own frame
        ["healing"]      = true,  -- show outgoing healing in it's own frame
        ["showhots"]     = true,  -- show periodic healing effects in xCT healing frame.
        ["damagecolor"]  = true,  -- display damage numbers depending on school of magic, see http://www.wowpedia.org/API_COMBAT_LOG_EVENT
        ["critprefix"]   = "|cffFF0000*|r", -- symbol that will be added before amount, if you deal critical strike/heal. leave "" for empty. default is red *
        ["critpostfix"]  = "|cffFF0000*|r", -- postfix symbol, "" for empty.
        ["icons"]        = true,  -- show outgoing damage icons
        ["iconsize"]     = 28,    -- icon size of spells in outgoing damage frame, also has effect on dmg font size if it's set to "auto"
        ["petdamage"]    = true,  -- show your pet damage.
        ["dotdamage"]    = true,  -- show damage from your dots. someone asked an option to disable lol.
        ["treshold"]     = 1,     -- minimum damage to show in outgoing damage frame
        ["healtreshold"] = 1,     -- minimum healing to show in incoming/outgoing healing messages.

    -- appearence
        ["font"]           = "Interface\\Addons\\xCT\\HOOGE.TTF", -- "Fonts\\ARIALN.ttf" is default WoW font.
        ["fontsize"]       = 12,
        ["fontstyle"]      = "OUTLINE",                           -- valid options are "OUTLINE", "MONOCHROME", "THICKOUTLINE", "OUTLINE,MONOCHROME", "THICKOUTLINE,MONOCHROME"
        ["damagefont"]     = "Interface\\Addons\\xCT\\HOOGE.TTF", -- "Fonts\\FRIZQT__.ttf" is default WoW damage font
        ["damagefontsize"] = "auto",                              -- size of xCT damage font. use "auto" to set it automatically depending on icon size, or use own value, 16 for example. if it's set to number value icons will change size.
        ["timevisible"]    = 3,                                   -- time (seconds) a single message will be visible. 3 is a good value.
        ["scrollable"]     = false,                               -- allows you to scroll frame lines with mousewheel.
        ["maxlines"]       = 64,                                  -- max lines to keep in scrollable mode. more lines=more memory. nom nom nom.

    -- justify messages in frames, valid values are "RIGHT" "LEFT" "CENTER"
        ["justify_1"] = "LEFT",     -- incoming damage justify
        ["justify_2"] = "RIGHT",    -- incoming healing justify
        ["justify_3"] = "CENTER",   -- various messages justify (mana, rage, auras, etc)
        ["justify_4"] = "RIGHT",    -- outgoing damage/healing justify

    -- class modules and goodies
        ["stopvespam"]       = false, -- automaticly turns off healing spam for priests in shadowform. HIDE THOSE GREEN NUMBERS PLX!
        ["dkrunes"]          = true,  -- show deatchknight rune recharge
        ["mergeaoespam"]     = true,  -- merges multiple aoe spam into single message, can be useful for dots too.
        ["mergeaoespamtime"] = 3,     -- time in seconds aoe spell will be merged into single message. minimum is 1.
        ["killingblow"]      = true,  -- tells you about your killingblows (works only with ["damage"] = true,)
        ["dispel"]           = true,  -- tells you about your dispels (works only with ["damage"] = true,)
        ["interrupt"]        = true,  -- tells you about your interrupts (works only with ["damage"] = true,)


    -- display looted items (set both to false to revert changes and go back to the original xCT)
        ["lootwindow"]      = true,   -- different loot window (if false, goes into general events window)
        ["lootitems"]       = true,   -- show all looted items
        ["lootmoney"]       = true,   -- Display looted money
        ["loottimevisible"] = 6,      -- the ammount of time in seconds your loot message is displayed (6 seems good, ["lootwindow"] needs to be true)  
        
    -- fine tune loot options
        ["loothideicons"]   = false,  -- show item icons when looted
        ["looticonsize"]    = 20,     -- Icon size of looted, crafted and quest items
        ["crafteditems"]    = true,   -- show crafted items ( nil = default, false = always hide, true = always show)
        ["questitems"]      = true,   -- show quest items ( nil = default, false = always hide, true = always show)
        ["itemsquality"]    = 3,      -- filter items shown by item quality: 0 = Poor, 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Epic, 5 = Legendary, 6 = Artifact, 7 = Heirloom
        ["itemstotal"]      = true,   -- show the total amount of items in bag ("[Epic Item Name]x1 (x23)")
        ["moneycolorblind"] = false,  -- shows letters G, S, and C instead of textures
        ["minmoney"]        = 0,      -- filter money received events, less than this amount (4G 32S 12C = 43212)

    -- Align Grid
        ["showgrid"] = true,         -- shows a grid when moving xCT windows around
}
