----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.myclass == "WARLOCK" then -- Change it to your class.
	-- do some config!
end

----------------------------------------------------------------------------
-- Per Character Name Config (overwrite general and class)
-- Name need to be case sensitive
----------------------------------------------------------------------------

if T.myname == "Zaythi" then -- Change it to your character name.
	C.unitframes.healcomm = true
	C.unitframes.aggro = true
	C.unitframes.raidunitdebuffwatch = true
	C.unitframes.showplayerinparty = true
end

if T.myname == "Gannaghli" then -- Change it to your character name.
	C.unitframes.healcomm = false
	C.unitframes.aggro = true
	C.unitframes.raidunitdebuffwatch = true
	C.unitframes.showplayerinparty = true
	C.actionbar.hideshapeshift = false
	C.actionbar.hotkey = true
end