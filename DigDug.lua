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
--# Description
--#########################################

-- Grab the WoW-defined addon folder name and storage table for our addon
local addonName, DigDug = ...

--@end-alpha@
DigDug.DebugMode = true
--@end-alpha@

print("Hello world from >>" .. addonName .. "<<!")

local frame = _G["ArcheologyDigsiteProgressBar"]
local BarBorderAndOverlay = frame.BarBorderAndOverlay

local NineBarPath = "Interface\\Addons\\DigDug\\ArcheologyToast9.blp"

if frame then
	print("dumping Frame")
	DigDug.Utilities.DumpTable(frame)
else
	print("Frame is not valid")
end

if BarBorderAndOverlay then
	print("dumping BarBorderAndOverlay")
	DigDug.Utilities.DumpTable(BarBorderAndOverlay)
else
	print("BarBorderAndOverlay is not valid")
end


BarBorderAndOverlay:SetTexture(NineBarPath)
BarBorderAndOverlay:SetTexCoord(0.00390625, 0.76953125, 0.08984375, 0.15625000)
