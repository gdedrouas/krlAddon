--Prevent honor bar appearing in pvp from moving action bars
    MainMenuBar:SetMovable(true); --Required for :SetUserPlaced()
    MainMenuBar:SetUserPlaced(true); --Set user-placed flag
--Dirty but it's called on all events... let's nuke it instead of catching everything
    MainMenuBar.SetPositionForStatusBars=function() end;
--Hide honor bar
    StatusTrackingBarManager:Hide()

-- Hide arena enemy frames
SetCVar('showArenaEnemyFrames', 0, 'SHOW_ARENA_ENEMY_FRAMES_TEXT')

-- Hide arena prep frames
-- Set up a dummy frame to listen for the event since the arena ui is not yet loaded
local farenaprep = CreateFrame('Frame')
farenaprep:SetScript('OnEvent', function(self, event,...)
    if event == 'ARENA_PREP_OPPONENT_SPECIALIZATIONS' then
      ArenaPrepFrames:Hide()
    end
end)
farenaprep:RegisterEvent('ARENA_PREP_OPPONENT_SPECIALIZATIONS')

local farenaprep_2 = CreateFrame('Frame')
farenaprep_2:SetScript('OnEvent', function(self, event,...)
    if event == 'ADDON_LOADED' and ... == 'Blizzard_ArenaUI' then
      ArenaPrepFrames.Show = function() end
    end
end)
farenaprep_2:RegisterEvent('ADDON_LOADED')

--Hide Covenant minimap button
local fcovbutton = CreateFrame('Frame')
fcovbutton:SetScript('OnEvent', function(self, event,...)
    if event == 'GARRISON_SHOW_LANDING_PAGE' then
      GarrisonLandingPageMinimapButton:Hide()
    end
end)
fcovbutton:RegisterEvent('GARRISON_SHOW_LANDING_PAGE')


-- Raise actionbar and multibarbottomleft a little
-- Scale the bars
--for i = 1, 12 do
--    _G["ActionButton"..i]:SetScale(1.04)
--end
--MultiBarBottomLeft:SetScale(1.04)
--MultiBarBottomRight:SetScale(1.04)
--wPetActionBarFrame:SetScale(1.04)
-- Move ActionBar
ActionButton1:ClearAllPoints()
ActionButton1:SetPoint("CENTER",-230,120)
ActionButton1.SetPoint = function() end
-- Move MultiBarBottomLeft
MultiBarBottomLeft:ClearAllPoints()
MultiBarBottomLeft:SetPoint("LEFT", ActionButton1, "LEFT", 0, 45)
MultiBarBottomLeft.SetPoint = function() end
-- Move MutltiBarBottomRight and make it one bar
MultiBarBottomRight:ClearAllPoints()
MultiBarBottomRight:SetPoint("LEFT", MultiBarBottomLeft, "LEFT", 0, 45)
MultiBarBottomRight.SetPoint = function() end
MultiBarBottomRightButton1:ClearAllPoints() 
MultiBarBottomRightButton1:SetPoint("LEFT", MultiBarBottomLeft, "LEFT", 0, 42)      
MultiBarBottomRightButton1.SetPoint = function() end
MultiBarBottomRightButton7:ClearAllPoints() 
MultiBarBottomRightButton7:SetPoint("LEFT", MultiBarBottomRightButton6, "LEFT", 42, 0)      
MultiBarBottomRightButton7.SetPoint = function() end    
-- Move StanceBar
StanceButton1:ClearAllPoints()
StanceButton1:SetPoint("LEFT", MultiBarBottomLeft, "LEFT", 0, 42)
StanceButton1.SetPoint = function() end
-- Move PetActionBar
PetActionBarFrame:ClearAllPoints()
PetActionBarFrame:SetPoint("CENTER", MultiBarBottomLeft, "CENTER", 30, 90)
PetActionBarFrame.SetPoint=function()end
-- Move PageButtons
ActionBarUpButton:ClearAllPoints()
ActionBarUpButton:SetPoint("CENTER",650,-15)
-- Hide Blizzard Art
MainMenuBarArtFrame.LeftEndCap:Hide()
MainMenuBarArtFrame.RightEndCap:Hide()
MainMenuBarArtFrameBackground:Hide()
MainMenuBarArtFrame.PageNumber:Hide()
StatusTrackingBarManager:Hide()