-- DigDug.lua
-- Written by KyrosKrane Sylvanblade (kyros@kyros.info)
-- Copyright (c) 2020 KyrosKrane Sylvanblade
-- Licensed under the MIT License, as per the included file.
-- Addon version: @project-version@

--#########################################
--# Description
--#########################################

-- This addon fixes the archaeology progress bar to correctly show nine segments when appropriate.

--#########################################
--# Main code
--#########################################

-- Grab the WoW-defined addon folder name and storage table for our addon
local addonName, DigDug = ...

--@end-alpha@
DigDug.DebugMode = true
--@end-alpha@

print("Hello world from >>" .. addonName .. "<<!")

local frame = _G["ArcheologyDigsiteProgressBar"]
local BarBorderAndOverlay = frame.BarBorderAndOverlay
local SixBarPath = BarBorderAndOverlay:GetTexture()
local NineBarPath = "Interface\\Addons\\DigDug\\ArcheologyToast9.blp"


local function SetNine()
	BarBorderAndOverlay:SetTexture(NineBarPath)
	BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)
end

local function SetSix()
	BarBorderAndOverlay:SetTexture(SixBarPath)
	BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)
end

local function Swap()
	local OldTexture = BarBorderAndOverlay:GetTexture()
	if OldTexture == SixBarPath then
		SetNine()
	else
		SetSix()
	end
end

--BarBorderAndOverlay:SetTexture(NineBarPath)
--BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)


-- Create a sample slash command to test the addon.
SLASH_TTT1 = "/ttt"
SlashCmdList.TTT = function (...) Swap(...) end
