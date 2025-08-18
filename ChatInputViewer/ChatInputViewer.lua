--- ChatInput viewer
--- Version 1.2.0

--- Changelog
--- V. 1.2.0 - Update for ESO Version 11.1.5, API version 101047
---          - Repeating the channel color of the input textbox in the viewer.
--- V. 1.1.0 - Russian translation added.
---          - Bugfix for character counting of multibyte characters.
---          - Spelling errors removed
--- V. 1.0.0 - Initial version.

--- ---------------------------------------------------------------------

--- The Addon namespace.
--- @class ChatInputViewer
--- @field OnAddOnLoaded function
--- @field name string
ChatInputViewer = {}
ChatInputViewer.name = "ChatInputViewer"

--- # ChatInputViewerVars
--- @class savedVariables
local savedVariables

--- Existing OnTextChanged handler of other AddOns registered to the
--- ZO_ChatWindowTextEntryEditBox control.
local ExistingOnTextChangedHandler

--- Status of the input string
---   1     0 - 279 characters
---   2   280 - 314 characters
---   3   315 - 349 characters
---   4   350 characters
local LastInputLengthState
local InputLengthStateColors
local LastChannel

--- Table containing the provided window modes.
---   1   "Adjusted to chat window"
---   2   "Fixed width"
local ModeChoices


--- Updates the viewer display with the current text of the chat input textfield.
local function ShowChatInput()

	local chatInput, viewerOutput
	local chatInputSize, foundPos
	local currentInputLengthState
	local statCol

	chatInput = ZO_ChatWindowTextEntryEditBox:GetText()
	chatInputSize = utf8.len(chatInput)
	viewerOutput = ""

	if (chatInputSize >= 350) then
		currentInputLengthState = 4
	elseif (chatInputSize >= 315) then
		currentInputLengthState = 3
	elseif (chatInputSize >= 280) then
		currentInputLengthState = 2
	else
		currentInputLengthState = 1
	end

	ChatInputViewerControl_Label:SetText(chatInput)

	if (currentInputLengthState > 1) then
		if (currentInputLengthState ~= LastInputLengthState) then
			statCol = InputLengthStateColors[currentInputLengthState]
			ChatInputViewerControl_Label:SetColor(statCol[1], statCol[2], statCol[3], statCol[4])
			LastChannel = nil
		end
	elseif (LastChannel ~= CHAT_SYSTEM.currentChannel) then 
		ChatInputViewerControl_Label:SetColor(ZO_ChatSystem_GetCategoryColorFromChannel(CHAT_SYSTEM.currentChannel))
		LastChannel = CHAT_SYSTEM.currentChannel
	end
	LastInputLengthState = currentInputLengthState

end


local function SetChatHandlers(val)

	if (val) then
		-- Store an already existing event handler of another AddOn in ExistingOnTextChangedHandler
		ExistingOnTextChangedHandler = ZO_ChatWindowTextEntryEditBox:GetHandler("OnTextChanged")
		-- Register ChatInputViewer to the event
		ZO_ChatWindowTextEntryEditBox:SetHandler("OnTextChanged", function(self)
			ShowChatInput()
			if (ExistingOnTextChangedHandler ~= nil) then
				ExistingOnTextChangedHandler(self)
			end
		end)
	else
		-- If the Viewer is not visible, unregister the AddOn
		if (ExistingOnTextChangedHandler ~= nil) then
			-- Register the original event handler, that was stored in ExistingOnTextChangedHandler
			ZO_ChatWindowTextEntryEditBox:SetHandler("OnTextChanged", ExistingOnTextChangedHandler)
			ExistingOnTextChangedHandler = nil
		end
	end

end

--- Shows the viewer window.
local function ShowViewer()
	ChatInputViewerControl_Label:SetHidden(false)
	ChatInputViewerControl_BG:SetHidden(false)
	SetChatHandlers(true)
	savedVariables.visible = true
end

--- Hides the viewer window.
local function HideViewer()
	ChatInputViewerControl_Label:SetHidden(true)
	ChatInputViewerControl_BG:SetHidden(true)
	SetChatHandlers(false)
	savedVariables.visible = false
end


--- Sets the width of the viewer window.
---   @param val number # The width of the viewer window.
local function ResizeViewerControl(width, nrOfLines, fontsize)

	local height, addFontsize

	-- If a fixes width is given, set the width
	-- and calculate the number of lines to show.
	if (width > 0) then
		ChatInputViewerControl:SetWidth(width)

		--[[ Deactivated because it is difilcult to understand for the user.

		if (fontsize == 16 or fontsize == 18) then
			if (width < 800) then
				nrOfLines = 5
			elseif (width < 1000) then
				nrOfLines = 4
			else
				nrOfLines = 3
			end
		elseif (fontsize == 20) then
			if (width < 800) then
				nrOfLines = 6
			elseif (width < 1000) then
				nrOfLines = 4
			else
				nrOfLines = 3
			end
		elseif (fontsize == 22) then
			if (width < 800) then
				nrOfLines = 6
			elseif (width < 1000) then
				nrOfLines = 5
			elseif (width < 1200) then
				nrOfLines = 4
			else
				nrOfLines = 3
			end
		else
			if (width < 800) then
				nrOfLines = 7
			elseif (width < 1000) then
				nrOfLines = 5
			else
				nrOfLines = 4
			end
		end
		]]
	end

	if (fontsize == 16) then
		addFontsize = 5
	elseif (fontsize == 24) then
		addFontsize = 7
	else
		addFontsize = 6
	end

	height = nrOfLines * (fontsize + addFontsize) + 2
	ChatInputViewerControl:SetHeight(height + 10)
	ChatInputViewerControl_Label:SetHeight(height)

end


--- Retrieves the visibility status of the viewer window.
---   @return boolean visible # The visibility status.
local function getVisibility()
	return savedVariables.visible
end

--- Sets the visibility status of the viewer window.
---   @param val boolean # The visibility status to set.
local function setVisibility(val)
	if (val == true) then
		ShowViewer()
	else
		HideViewer()
	end
end

--- Retrieves the font size for the viewer window.
---   @return number fontsize # The font size of the viewer text.
local function getFontSize()
	return savedVariables.fontsize
end

--- Sets the font size of the text in the viewer window.
---   @param val number # The font size of the viewer text.
local function setFontSize(val)
	ChatInputViewerControl_Label:SetFont("$(CHAT_FONT)|$(KB_" .. val .. ")|soft-shadow-thick")
	ChatInputViewerControl:ClearAnchors()
	if (savedVariables.mode == 1) then
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ChatInputViewerControl:SetAnchor(TOPRIGHT, ZO_ChatWindow, BOTTOMRIGHT, 0, 0)
		ResizeViewerControl(0, savedVariables.nroflines, val)
	else
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ResizeViewerControl(savedVariables.windowwidth, savedVariables.nroflines, val)
	end
	savedVariables.fontsize = val
end

--- Retrieves the mode of the viewer window.
---   @return number mode # The ID of the window mode (1 = fixed, 2 = adjusted).
local function getWindowMode()
	return ModeChoices[savedVariables.mode]
end

--- Sets the mode of the viewer window.
---   @param val number # The ID of the window mode (1 = fixed, 2 = adjusted).
local function setWindowMode(val)

	local text

	for k, v in pairs(ModeChoices) do
		if v == val then
			savedVariables.mode = k
		end
	end

	ChatInputViewerControl:ClearAnchors()
	if (savedVariables.mode == 1) then
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ChatInputViewerControl:SetAnchor(TOPRIGHT, ZO_ChatWindow, BOTTOMRIGHT, 0, 0)
		ResizeViewerControl(0, savedVariables.nroflines, savedVariables.fontsize)
	else
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ResizeViewerControl(savedVariables.windowwidth, savedVariables.nroflines, savedVariables.fontsize)
	end
end

--- Retrieves the width for the viewer window.
---   @return number width # The width for the viewer window.
local function getWindowWidth()
	return savedVariables.windowwidth
end

--- Sets the width of the viewer window.
---   @param val number # The width of the viewer window.
local function setWindowWidth(val)
	if (savedVariables.mode == 2) then
		ResizeViewerControl(val, savedVariables.nroflines, savedVariables.fontsize)
	end
	savedVariables.windowwidth = val
end

--- Retrieves the number of text lines for the viewer window.
--- This value is used when the windows width is adjusted to the chat window.
---   @return number width # The  number of text lines for the viewer window.
local function getNrOfLines()
	return savedVariables.nroflines
end

--- Sets the number of text lines for the viewer window.
--- This value is used when the windows width is adjusted to the chat window.
---   @param val number # The  number of text lines for the viewer window.
local function setNrOfLines(val)
	--if (savedVariables.mode == 1) then
	ResizeViewerControl(0, val, savedVariables.fontsize)
	--end
	savedVariables.nroflines = val
end


--- Initializes the addon by setting the font size.
local function initializeChatInputViewer()

	local panelName = "ChatInputViewerOptions"

	LastChannel = nil

	LastInputLengthState = 0
	InputLengthStateColors = {
		[1] = {1.0, 1.0, 1.0, 1.0},
		[2] = {1.0, 1.0, 0.0, 1.0},
		[3] = {1.0, 0.5, 0.0, 1.0},
		[4] = {1.0, 0.0, 0.0, 1.0},
	}

	ModeChoices = {
		[1] = GetString(CHATIV_WINDOWMODE_VAL1),
		[2] = GetString(CHATIV_WINDOWMODE_VAL2),
	}

	ChatInputViewerControl_Label:SetFont("$(CHAT_FONT)|$(KB_" .. savedVariables.fontsize .. ")|soft-shadow-thick")
	ChatInputViewerControl_Label:SetWrapMode(TEXT_WRAP_MODE_ELLIPSIS)
	ChatInputViewerControl:ClearAnchors()
	if (savedVariables.mode == 1) then
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ChatInputViewerControl:SetAnchor(TOPRIGHT, ZO_ChatWindow, BOTTOMRIGHT, 0, 0)
		ResizeViewerControl(0, savedVariables.nroflines, savedVariables.fontsize)
	else
		ChatInputViewerControl:SetAnchor(TOPLEFT, ZO_ChatWindow, BOTTOMLEFT, 0, 0)
		ResizeViewerControl(savedVariables.windowwidth, savedVariables.nroflines, savedVariables.fontsize)
	end

	--- The panel data for the ChatInputViewer addon, that are shown in the Addon settings GUI.
	---   @class panelData
	---   @field type string @The type of the panel.
	---   @field name string @The name of the panel.
	---   @field author string @The author of the addon.
	local panelData = {
		type = "panel",
		name = "Chatinput viewer",
		author = "@GetanoNero",
		registerForRefresh = true,
	}
	--- The data for the configuration options of the ChatInputViewer addon.
	local optionsData = {
		[1] = {
			type = "description",
			title = GetString(CHATIV_WARNING_CAPTION),
			text = GetString(CHATIV_WARNING_TEXT),
		},
		[2] = {
			type = "checkbox",
			name = GetString(CHATIV_VISIBLE),
			tooltip = GetString(CHATIV_VISIBLE_TOOLTIP),
			getFunc = function() return getVisibility() end,
			setFunc = function(value) setVisibility(value) end,
		},
		[3] = {
			type = "dropdown",
			name = GetString(CHATIV_FONTSIZE),
			tooltip = GetString(CHATIV_FONTSIZE_TOOLTIP),
			choices = {
				16,
				18,
				20,
				22,
				24,
			},
			getFunc = function() return getFontSize() end,
			setFunc = function(value) setFontSize(value) end,
		},
		[4] = {
			type = "dropdown",
			name = GetString(CHATIV_WINDOWMODE),
			tooltip = GetString(CHATIV_WINDOWMODE_TOOLTIP),
			choices = ModeChoices,
			getFunc = function() return getWindowMode() end,
			setFunc = function(value) setWindowMode(value) end,
		},
		[5] = {
			type = "dropdown",
			name = GetString(CHATIV_WINDOWWIDTH),
			tooltip = GetString(CHATIV_WINDOWWIDTH_TOOLTIP),
			choices = {
				600,
				800,
				1000,
				1200,
			},
			getFunc = function() return getWindowWidth() end,
			setFunc = function(value) setWindowWidth(value) end,
			disabled = function() return (savedVariables.mode == 1) end,
		},
		[6] = {
			type = "dropdown",
			name = GetString(CHATIV_NROFLINES),
			tooltip = GetString(CHATIV_NROFLINES_TOOLTIP),
			choices = {
				2,
				3,
				4,
				5,
				6,
			},
			getFunc = function() return getNrOfLines() end,
			setFunc = function(value) setNrOfLines(value) end,
		},
	}

	local LAM = LibAddonMenu2
	LAM:RegisterAddonPanel(panelName, panelData)
	LAM:RegisterOptionControls(panelName, optionsData)
end

--- Event handler for the EVENT_ADD_ON_LOADED event.
---   @param event string # The event name.
---   @param name string # The name of the loaded addon.
function ChatInputViewer.OnAddOnLoaded(event, name)

	if name ~= "ChatInputViewer" then return end
	EVENT_MANAGER:UnregisterForEvent("ChatInputViewer", EVENT_ADD_ON_LOADED)

	--- The default values for the ChatInputViewer addon.
	---   @class defaults
	---   @field visible boolean # The visibility status of the viewer.
	local defaults = {
		visible = true,
		fontsize = 22,
		mode = 1,
		windowwidth = 1000,
		nroflines = 4,
	}
	savedVariables = ZO_SavedVars:NewAccountWide("ChatInputViewerVars", 1, nil, defaults)

	initializeChatInputViewer()
	setVisibility(savedVariables.visible)

end

--- Register the slash commands
SLASH_COMMANDS["/showchatviewer"] = ShowViewer
SLASH_COMMANDS["/hidechatviewer"] = HideViewer

--- Register the EVENT_ADD_ON_LOADED event
EVENT_MANAGER:RegisterForEvent(ChatInputViewer.name, EVENT_ADD_ON_LOADED, ChatInputViewer.OnAddOnLoaded)
