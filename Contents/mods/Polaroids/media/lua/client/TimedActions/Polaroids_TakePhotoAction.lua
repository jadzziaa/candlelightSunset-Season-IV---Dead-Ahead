require "TimedActions/ISBaseTimedAction"

Polaroids = Polaroids or {}

local TakePhotoAction = ISBaseTimedAction:derive("TakePhotoAction")
TakePhotoAction.RenderTickCount = 0
Polaroids.TakePhotoAction = TakePhotoAction

function TakePhotoAction:isValid()
    return self.character:getInventory():contains(self.polaroidCamera)
end

function TakePhotoAction:start()
end

function TakePhotoAction:update()
    local tickDelay = 5
    if self.step == 0 then
        ISUIHandler.toggleUI()
        self.step = 1
        self.nextStepAt = TakePhotoAction.RenderTickCount + tickDelay
    elseif TakePhotoAction.RenderTickCount >= self.nextStepAt then 
        if self.step == 1 then
            takeScreenshot(self.screenshotBaseName .. ".png")
            self.step = 2
            self.nextStepAt = TakePhotoAction.RenderTickCount + tickDelay
        elseif self.step == 2 then
            ISUIHandler.toggleUI()
            self.step = 3
            self.nextStepAt = TakePhotoAction.RenderTickCount + tickDelay
        elseif self.step == 3 then
            takeScreenshot(self.screenshotBaseName .. "_ui.png")
            self.step = 4
            self.nextStepAt = TakePhotoAction.RenderTickCount + tickDelay
        elseif self.step == 4 then
            self.character:playSound("TakePhoto");

            local screenshotsFolder = getMyDocumentFolder() .. getFileSeparator() .. "Screenshots"
            if isDesktopOpenSupported() then
                openUrl(screenshotsFolder)
            else
                Clipboard.setClipboard(screenshotsFolder)
                self.character:setHaloNote("Screenshots Folder Path copied to clipboard", 220, 220, 220, 100)
            end
            self:forceComplete()
        end
    end
end

function TakePhotoAction:stop()
	ISBaseTimedAction.stop(self)
end

function TakePhotoAction:perform()
	ISBaseTimedAction.perform(self)
end

function TakePhotoAction:new(character, polaroidCamera)
	local o = ISBaseTimedAction.new(self, character)
	o.stopOnWalk = true
	o.stopOnRun = true
	o.stopOnAim = true
	o.maxTime = -1
    o.step = 0
    o.nextStepAt = 0
	o.useProgressBar = false
	o.polaroidCamera = polaroidCamera

    local dateFormat = SimpleDateFormat.new("dd-MM-yyyy_hh-mm-ss")
    o.screenshotBaseName = "screenshot_" .. dateFormat:format(Calendar.getInstance():getTime())
	return o
end

function TakePhotoAction.CountRenderTick()
    TakePhotoAction.RenderTickCount = TakePhotoAction.RenderTickCount + 1
end

Events.OnPostRender.Add(TakePhotoAction.CountRenderTick)