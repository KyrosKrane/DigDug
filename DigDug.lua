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
--# Global Variables
--#########################################

-- Grab the WoW-defined addon folder name and storage table for our addon
local addonName, DigDug = ...

-- Set the current version so we can display it.
DigDug.Version = "@project-version@"

-- Create the frame to hold our event catcher, and the list of events.
DigDug.Frame, DigDug.Events = CreateFrame("Frame"), {}

-- Upvalues
local DebugPrint = DigDug.Utilities.DebugPrint
local pairs = pairs

--@alpha@
DigDug.DebugMode = true
--@end-alpha@


--#########################################
--# Main code
--#########################################

local frame = _G["ArcheologyDigsiteProgressBar"]
local BarBorderAndOverlay = frame.BarBorderAndOverlay
local SixFindPath = BarBorderAndOverlay:GetTexture()
local NineFindPath = "Interface\\Addons\\DigDug\\ArcheologyToast9.blp"


-- This function forces the archaeology dig site progress bar to have nine segments
function DigDug:SetNine()
	BarBorderAndOverlay:SetTexture(NineFindPath)
	BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)
end -- SetNine()


-- This function forces the archaeology dig site progress bar to have six segments
function DigDug:SetSix()
	BarBorderAndOverlay:SetTexture(SixFindPath)
	BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)
end -- SetSix()


-- This function swaps the progress bar display. Intended for debugging only.
local function Swap()
	local OldTexture = BarBorderAndOverlay:GetTexture()
	if OldTexture == SixFindPath then
		DigDug:SetNine()
	else
		DigDug:SetSix()
	end
end -- Swap()


--#########################################
--# Implement the event handlers
--#########################################

-- On-load handler for addon initialization.
function DigDug.Events:PLAYER_LOGIN(...)
	DebugPrint("In PLAYER_LOGIN")
	DebugPrint(DigDug.USER_ADDON_NAME .. " " .. DigDug.Version .. " " .. "loaded.")
end -- APR.Events:PLAYER_LOGIN()


-- Triggered when the user starts a survery
function DigDug.Events:ARCHAEOLOGY_SURVEY_CAST(numFindsCompleted, totalFinds, researchBranchID, successfulFind)
	DebugPrint("In ARCHAEOLOGY_SURVEY_CAST, totalFinds is " .. totalFinds)
	if 9 == totalFinds then
		DigDug:SetNine()
	else
		DigDug:SetSix()
	end
end -- DigDug.Events:ARCHAEOLOGY_SURVEY_CAST()


--#########################################
--# Register the events we use
--#########################################

-- Create the event handler function.
DigDug.Frame:SetScript("OnEvent", function(self, event, ...)
	DigDug.Events[event](self, ...) -- call one of the functions defined by the modules or above
end)

-- Register all events for which handlers have been defined
for k, v in pairs(DigDug.Events) do
	DebugPrint("Registering event " .. k)
	DigDug.Frame:RegisterEvent(k)
end


--#########################################
--# For testing only
--#########################################

-- Create a sample slash command to test the addon.
SLASH_DIGDIGSWAPBAR1 = "/DigDugSwapBar"
SlashCmdList.DIGDIGSWAPBAR = function (...) Swap(...) end
