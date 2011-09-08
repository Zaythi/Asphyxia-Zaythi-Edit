﻿------------------------------------------------------------------------
-- Launch Tukui Script
------------------------------------------------------------------------
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local function chatsetup()
	-- setting chat frames if using Tukui chats.					
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	--FCF_OpenNewWindow(L.chat_general)
	--FCF_SetLocked(ChatFrame3, 1)
	--FCF_DockFrame(ChatFrame3)

	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)
	ChatFrame3:Show()

	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)
		
		-- set the size of chat frames
		frame:Size(T.InfoLeftRightWidth + 1, 111)
		
		-- tell wow that we are using new size
		SetChatWindowSavedDimensions(chatFrameId, T.Scale(T.InfoLeftRightWidth + 1), T.Scale(111))
		
		-- move general bottom left or Loot (if found) on right
		if i == 1 then
			frame:ClearAllPoints()
			frame:Point("BOTTOMLEFT", TukuiInfoLeft, "TOPLEFT", 0, 6)
		elseif i == 3 and chatName == LOOT then
			frame:ClearAllPoints()
			frame:Point("BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 6)
		end
				
		-- save new default position and dimension
		FCF_SavePositionAndDimensions(frame)
		
		-- set default tukui font size
		FCF_SetChatWindowFontSize(nil, frame, 12)
		
		-- rename windows general and combat log
		if i == 1 then 
			FCF_SetWindowName(frame, "General")
		elseif i == 2 then
			FCF_SetWindowName(frame, "Log")
		elseif i == 3 then 
			FCF_SetWindowName(frame, "Loot/Spam") 
		end
	end
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_trade) 		-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_defense) 	-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_recrutment) 	-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_lfg) 		-- erf, it seem we need to localize this now
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_INLINE_TOAST_ALERT")

	--[[
	-- Setup the whisper chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_RemoveChannel(ChatFrame3, L.chat_trade) 		-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame3, L.chat_general) 	-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame3, L.chat_defense) 	-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame3, L.chat_recrutment) 	-- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame3, L.chat_lfg) 		-- erf, it seem we need to localize this now
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
	]]
			
	-- Setup the right chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_GUILD_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
	ChatFrame_AddChannel(ChatFrame3, GENERAL)
	ChatFrame_AddChannel(ChatFrame3, L.chat_trade) 		-- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame3, L.chat_defense) 	-- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame3, L.chat_recrutment) -- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame3, L.chat_lfg) 		-- erf, it seem we need to localize this now
			
	-- enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(false, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
	
	-- Chat Colors
	ChangeChatColor("CHANNEL1", 255/255, 255/255, 192/255) -- General
	ChangeChatColor("CHANNEL2", 255/255, 255/255, 192/255) -- Trade
	ChangeChatColor("CHANNEL3", 255/255, 255/255, 192/255) -- Local Defense
	ChangeChatColor("CHANNEL4", 255/255, 255/255, 192/255) -- LFG
end

local function cvarsetup()
	SetCVar("buffDurations", 1)
	SetCVar("mapQuestDifficulty", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("screenshotQuality", 10)
	SetCVar("chatMouseScroll", 1)
	SetCVar("chatStyle", "im")
	SetCVar("chatBubbles", 1)	
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("ConversationMode", "inline")
	SetCVar("showTutorials", 0)
	SetCVar("showNewbieTips", 0)
	SetCVar("showGameTips", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("UberTooltips", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("showVKeyCastbar", 1)
	SetCVar("bloatthreat", 0)
	SetCVar("bloattest", 0)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowFriendlyPets", 0)
	SetCVar("nameplateShowFriendlyGuardians", 0)
	SetCVar("nameplateShowFriendlyTotems", 0)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowEnemyPets", 1)
	SetCVar("nameplateShowEnemyGuardians", 1)
	SetCVar("nameplateShowEnemyTotems", 1)	
	SetCVar("showArenaEnemyFrames", 0)
	SetCVar("lootUnderMouse", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("cameraDistanceMax", 50)
	SetCVar("cameraDistanceMaxFactor", 3.4)
end

local function positionsetup()
	-- reset saved variables on char
	TukuiDataPerChar = {}
	
	-- reset movable stuff into original position
	for i = 1, getn(T.MoverFrames) do
		if T.MoverFrames[i] then T.MoverFrames[i]:SetUserPlaced(false) end
	end
end

-- Version Frame
local v = CreateFrame("Button", "TukuiVersionFrame", UIParent)
v:SetSize(210, 34)
v:SetPoint("CENTER", UIParent, "CENTER", 0, 188)
v:SetTemplate("Transparent")
v:CreateShadow("Default")
v:FontString("Text", C.media.font, 12)
v.Text:SetPoint("CENTER")
v.Text:SetText("|cffFF6347AsphyxiaUI - version:|r 3.0  www.tukui.org")
v:SetScript("OnClick", function()
	v:Hide()
end)
v:Hide()

--Help Frame
local ahelp = CreateFrame("Button", "TukuiAsphyxiaHelpFrame", UIParent)
ahelp:SetSize(550, 335)
ahelp:SetPoint("CENTER")
ahelp:SetTemplate("Transparent")
ahelp:CreateShadow("Default")
ahelp:FontString("Text", C.media.font, 13)
ahelp.Text:SetPoint("CENTER")
ahelp.Text:SetText(L.core_uihelp20..L.core_uihelp21..L.core_uihelp22..L.core_uihelp23..L.core_uihelp24..L.core_uihelp25..L.core_uihelp26..L.core_uihelp27..L.core_uihelp28..L.core_uihelp29..L.core_uihelp30)
ahelp:SetScript("OnClick", function()
	ahelp:Hide()
end)
ahelp:Hide()

local f = CreateFrame("Frame", "AsphyxiaUIInstallFrame", UIParent)
f:SetSize(400, 400)
f:SetPoint("CENTER")
f:SetTemplate("Transparent")
f:CreateShadow("Default")
f:Hide()

local icon1 = CreateFrame("Frame", "AsphyxiaTest", f)
icon1:CreatePanel(nil, 58, 58, "BOTTOMRIGHT", f, "TOPRIGHT", 0, 3)
icon1:SetFrameStrata("HIGH")

icon1.bg = icon1:CreateTexture(nil, "ARTWORK")
icon1.bg:Point("TOPLEFT", 2, -2)
icon1.bg:Point("BOTTOMRIGHT", -2, 2)
icon1.bg:SetTexture([[Interface\AddOns\Tukui\medias\textures\asphyxia]])

local icon2 = CreateFrame("Frame", "AsphyxiaTest", f)
icon2:CreatePanel(nil, 58, 58, "BOTTOMLEFT", f, "TOPLEFT", 0, 3)
icon2:SetFrameStrata("HIGH")

icon2.bg = icon2:CreateTexture(nil, "ARTWORK")
icon2.bg:Point("TOPLEFT", 2, -2)
icon2.bg:Point("BOTTOMRIGHT", -2, 2)
icon2.bg:SetTexture([[Interface\AddOns\Tukui\medias\textures\asphyxia]])

local title = CreateFrame("Frame", "TukuiInstallTitle", f)
title:CreatePanel(nil, f:GetWidth() - 122, 30, "BOTTOM", f, "TOP", 0, 3)
title:SetFrameStrata("HIGH")

local name = title:CreateFontString(nil, "OVERLAY")
name:SetFont(C.media.font, 16)
name:SetPoint("CENTER", title, 0, 0)
name:SetText("|cff00AAFFAsphyxiaUI|r")

local sb = CreateFrame("StatusBar", nil, f)
sb:SetStatusBarTexture(C.media.normTex)
sb:SetPoint("BOTTOM", f, "BOTTOM", 0, 60)
sb:SetHeight(20)
sb:SetWidth(f:GetWidth()-44)
sb:SetFrameStrata("HIGH")
sb:SetFrameLevel(6)
sb:Hide()

local sbd = CreateFrame("Frame", nil, sb)
sbd:SetTemplate("Transparent")
sbd:SetPoint("TOPLEFT", sb, -2, 2)
sbd:SetPoint("BOTTOMRIGHT", sb, 2, -2)
sbd:SetFrameStrata("HIGH")
sbd:SetFrameLevel(5)

local header = f:CreateFontString(nil, "OVERLAY")
header:SetFont(C.media.font, 16, "THINOUTLINE")
header:SetPoint("TOP", f, "TOP", 0, -20)

local text1 = f:CreateFontString(nil, "OVERLAY")
text1:SetJustifyH("LEFT")
text1:SetFont(C.media.font, 12)
text1:SetWidth(f:GetWidth()-40)
text1:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -60)

local text2 = f:CreateFontString(nil, "OVERLAY")
text2:SetJustifyH("LEFT")
text2:SetFont(C.media.font, 12)
text2:SetWidth(f:GetWidth()-40)
text2:SetPoint("TOPLEFT", text1, "BOTTOMLEFT", 0, -20)

local text3 = f:CreateFontString(nil, "OVERLAY")
text3:SetJustifyH("LEFT")
text3:SetFont(C.media.font, 12)
text3:SetWidth(f:GetWidth()-40)
text3:SetPoint("TOPLEFT", text2, "BOTTOMLEFT", 0, -20)

local text4 = f:CreateFontString(nil, "OVERLAY")
text4:SetJustifyH("LEFT")
text4:SetFont(C.media.font, 12)
text4:SetWidth(f:GetWidth()-40)
text4:SetPoint("TOPLEFT", text3, "BOTTOMLEFT", 0, -20)

local credits = f:CreateFontString(nil, "OVERLAY")
credits:SetFont(C.media.font, 12, "THINOUTLINE")
credits:SetText("")
credits:SetPoint("BOTTOM", f, "BOTTOM", 0, 4)

local sbt = sb:CreateFontString(nil, "OVERLAY")
sbt:SetFont(C.media.font, 13, "THINOUTLINE")
sbt:SetPoint("CENTER", sb)

local option1 = CreateFrame("Button", "TukuiInstallOption1", f)
option1:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 20, 20)
option1:SetSize(128, 25)
option1:SetTemplate("Transparent")
option1:FontString("Text", C.media.font, 12)
option1.Text:SetPoint("CENTER")

local option2 = CreateFrame("Button", "TukuiInstallOption2", f)
option2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 20)
option2:SetSize(128, 25)
option2:SetTemplate("Transparent")
option2:FontString("Text", C.media.font, 12)
option2.Text:SetPoint("CENTER")

local close = CreateFrame("Button", "TukuiInstallCloseButton", f, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
close:SetScript("OnClick", function()
	f:Hide()
end)

local step4 = function()
	TukuiDataPerChar.install = true
	sb:SetValue(4)
	PlaySoundFile("Sound\\interface\\LevelUp.wav")
	header:SetText(L.install_header_11)
	text1:SetText(L.install_step_4_line_1)
	text2:SetText(L.install_step_4_line_2)
	text3:SetText(L.install_step_4_line_3)
	text4:SetText(L.install_step_4_line_4)
	sbt:SetText("4/4")
	option1:Hide()
	option2.Text:SetText(L.install_button_finish)
	option2:SetScript("OnClick", function()
		ReloadUI()
	end)
end

local step3 = function()
	if not option2:IsShown() then option2:Show() end	
	sb:SetValue(3)
	header:SetText(L.install_header_10)
	text1:SetText(L.install_step_3_line_1)
	text2:SetText(L.install_step_3_line_2)
	text3:SetText(L.install_step_3_line_3)
	text4:SetText(L.install_step_3_line_4)
	sbt:SetText("3/4")
	option1:SetScript("OnClick", step4)
	option2:SetScript("OnClick", function()
		positionsetup()
		step4()
	end)
end

local step2 = function()
	sb:SetValue(2)
	header:SetText(L.install_header_9)
	sbt:SetText("2/4")
	if IsAddOnLoaded("Prat") or IsAddOnLoaded("Chatter") then 
		text1:SetText(L.install_step_2_line_0)
		text2:SetText("")
		text3:SetText("")
		text4:SetText("")
		option2:Hide()
	else
		text1:SetText(L.install_step_2_line_1)
		text2:SetText(L.install_step_2_line_2)
		text3:SetText(L.install_step_2_line_3)
		text4:SetText(L.install_step_2_line_4)
		option2:SetScript("OnClick", function()
			chatsetup()
			step3()
		end)
	end	
	option1:SetScript("OnClick", step3)
end

local step1 = function()
	close:Hide()
	sb:SetMinMaxValues(0, 4)
	sb:Show()
	sb:SetValue(1)
	sb:SetStatusBarColor(0.26, 1, 0.22)
	header:SetText(L.install_header_8)
	text1:SetText(L.install_step_1_line_1)
	text2:SetText(L.install_step_1_line_2)
	text3:SetText(L.install_step_1_line_3)
	text4:SetText(L.install_step_1_line_4)
	sbt:SetText("1/4")

	option1:Show()

	option1.Text:SetText(L.install_button_skip)
	option2.Text:SetText(L.install_button_continue)

	option1:SetScript("OnClick", step2)
	option2:SetScript("OnClick", function()
		cvarsetup()
		step2()
	end)
	
	-- this is really essential, whatever if skipped or not
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)
end

local tut6 = function()
	sb:SetValue(6)
	header:SetText(L.install_header_7)
	text1:SetText(L.tutorial_step_6_line_1)
	text2:SetText(L.tutorial_step_6_line_2)
	text3:SetText(L.tutorial_step_6_line_3)
	text4:SetText(L.tutorial_step_6_line_4)

	sbt:SetText("6/6")

	option1:Show()

	option1.Text:SetText(L.install_button_close)
	option2.Text:SetText(L.install_button_install)

	option1:SetScript("OnClick", function()
		f:Hide()
	end)
	option2:SetScript("OnClick", step1)
end

local tut5 = function()
	sb:SetValue(5)
	header:SetText(L.install_header_6)
	text1:SetText(L.tutorial_step_5_line_1)
	text2:SetText(L.tutorial_step_5_line_2)
	text3:SetText(L.tutorial_step_5_line_3)
	text4:SetText(L.tutorial_step_5_line_4)

	sbt:SetText("5/6")

	option2:SetScript("OnClick", tut6)
end

local tut4 = function()
	sb:SetValue(4)
	header:SetText(L.install_header_5)
	text1:SetText(L.tutorial_step_4_line_1)
	text2:SetText(L.tutorial_step_4_line_2)
	text3:SetText(L.tutorial_step_4_line_3)
	text4:SetText(L.tutorial_step_4_line_4)

	sbt:SetText("4/6")

	option2:SetScript("OnClick", tut5)
end

local tut3 = function()
	sb:SetValue(3)
	header:SetText(L.install_header_4)
	text1:SetText(L.tutorial_step_3_line_1)
	text2:SetText(L.tutorial_step_3_line_2)
	text3:SetText(L.tutorial_step_3_line_3)
	text4:SetText(L.tutorial_step_3_line_4)

	sbt:SetText("3/6")

	option2:SetScript("OnClick", tut4)
end

local tut2 = function()
	sb:SetValue(2)
	header:SetText(L.install_header_3)
	text1:SetText(L.tutorial_step_2_line_1)
	text2:SetText(L.tutorial_step_2_line_2)
	text3:SetText(L.tutorial_step_2_line_3)
	text4:SetText(L.tutorial_step_2_line_4)

	sbt:SetText("2/6")

	option2:SetScript("OnClick", tut3)
end

local tut1 = function()
	sb:SetMinMaxValues(0, 6)
	sb:Show()
	close:Show()
	sb:SetValue(1)
	sb:SetStatusBarColor(0, 0.76, 1)
	header:SetText(L.install_header_2)
	text1:SetText(L.tutorial_step_1_line_1)
	text2:SetText(L.tutorial_step_1_line_2)
	text3:SetText(L.tutorial_step_1_line_3)
	text4:SetText(L.tutorial_step_1_line_4)
	sbt:SetText("1/6")
	option1:Hide()
	option2.Text:SetText(L.install_button_next)
	option2:SetScript("OnClick", tut2)
end

local function DisableTukui()
	DisableAddOn("Tukui")
	ReloadUI()
end

-- this install Tukui with default settings.
local function install()
	f:Show()
	sb:Hide()
	option1:Show()
	option2:Show()
	close:Show()
	header:SetText(L.install_header_1)
	text1:SetText(L.install_init_line_1)
	text2:SetText(L.install_init_line_2)
	text3:SetText(L.install_init_line_3)
	text4:SetText(L.install_init_line_4)

	option1.Text:SetText(L.install_button_tutorial)
	option2.Text:SetText(L.install_button_install)

	option1:SetScript("OnClick", tut1)
	option2:SetScript("OnClick", step1)			
end

------------------------------------------------------------------------
--	Popups
------------------------------------------------------------------------

StaticPopupDialogs["TUKUIDISABLE_UI"] = {
	text = L.popup_disableui,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = DisableTukui,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["TUKUIDISABLE_RAID"] = {
	text = L.popup_2raidactive,
	button1 = "DPS - TANK",
	button2 = "HEAL",
	OnAccept = function() DisableAddOn("Tukui_Raid_Healing") EnableAddOn("Tukui_Raid") ReloadUI() end,
	OnCancel = function() EnableAddOn("Tukui_Raid_Healing") DisableAddOn("Tukui_Raid") ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3
}

StaticPopupDialogs["TUKUIDISBAND_RAID"] = {
	text = L.disband,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if InCombatLockdown() then return end -- Prevent user error in combat
		
		SendChatMessage(ERR_GROUP_DISBANDED, "RAID" or "PARTY")
		if UnitInRaid("player") then
			for i = 1, GetNumRaidMembers() do
				local name, _, _, _, _, _, _, online = GetRaidRosterInfo(i)
				if online and name ~= T.myname then
					UninviteUnit(name)
				end
			end
		else
			for i = MAX_PARTY_MEMBERS, 1, -1 do
				if GetPartyMember(i) then
					UninviteUnit(UnitName("party"..i))
				end
			end
		end
		LeaveParty()	
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

------------------------------------------------------------------------
--	On login function, look for some infos!
------------------------------------------------------------------------

local TukuiOnLogon = CreateFrame("Frame")
TukuiOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
TukuiOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	-- create empty saved vars if they doesn't exist.
	if (TukuiData == nil) then TukuiData = {} end
	if (TukuiDataPerChar == nil) then TukuiDataPerChar = {} end

	if T.getscreenwidth < 1200 then
			SetCVar("useUiScale", 0)
			StaticPopup_Show("TUKUIDISABLE_UI")
	else
		-- install default if we never ran Tukui on this character.
		if not TukuiDataPerChar.install then			
			install()
		end
	end
	
	if (IsAddOnLoaded("Tukui_Raid") and IsAddOnLoaded("Tukui_Raid_Healing")) then
		StaticPopup_Show("TUKUIDISABLE_RAID")
	end
	
	local playerName = UnitName("player")
	print("Whats up, |cff00AAFF"..playerName.."!|r Thank you for using |cffFF6347AsphyxiaUI|r |cff00AAFF(A heavily modified version of Tukui).")
	print("For detailed Information |cff00FFFFvisit www.tukui.org or https://github.com/Asphyxia")
end)

SLASH_TUTORIAL1 = "/uihelp"
SLASH_TUTORIAL2 = "/tutorial"
SlashCmdList.TUTORIAL = function() f:Show() tut1() end

SLASH_VERSION1 = "/version"
SlashCmdList.VERSION = function() if v:IsShown() then v:Hide() else v:Show() end end

SLASH_CONFIGURE1 = "/install"
SlashCmdList.CONFIGURE = install

SLASH_RESETUI1 = "/resetui"
SlashCmdList.RESETUI = function() f:Show() step1() end

SLASH_AHELP1 = "/ahelp"
SlashCmdList.AHELP = function() if ahelp:IsShown() then ahelp:Hide() else ahelp:Show() end end

--[[local r, g, b = unpack(C["media"].datacolor)
T.datacolor = ("|cff%.2x%.2x%.2x"):format(r * 255, g * 255, b * 255)--]]