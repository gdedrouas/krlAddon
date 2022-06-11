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
local f1 = CreateFrame('Frame')
f1:SetScript('OnEvent', function(self, event,...)
    if event == 'ARENA_PREP_OPPONENT_SPECIALIZATIONS' then
      ArenaPrepFrames:Hide()
    end
end)
f1:RegisterEvent('ARENA_PREP_OPPONENT_SPECIALIZATIONS')

--Hide Covenant minimap button
local f2 = CreateFrame('Frame')
f2:SetScript('OnEvent', function(self, event,...)
    if event == 'GARRISON_SHOW_LANDING_PAGE' then
      GarrisonLandingPageMinimapButton:Hide()
    end
end)
f2:RegisterEvent('GARRISON_SHOW_LANDING_PAGE')