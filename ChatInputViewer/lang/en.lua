local localization_strings = {
  CHATIV_WARNING_CAPTION = "Please note:",
  CHATIV_WARNING_TEXT = "The area for displaying the chat input is shown below the chat window. The chat window normally extends"
    .. " to the bottom of the screen. If the window is not automatically moved upwards when the viewer is made visible, the bottom"
    .. " edge of the chat window must be moved upwards manually.",
  CHATIV_VISIBLE = "Visible",
  CHATIV_VISIBLE_TOOLTIP = "Shows or hides the viewer.",
  CHATIV_MINIMISED = "Minimised",
  CHATIV_MINIMISED_TOOLTIP = "Shows a minimised viewer Window with only one line.",
  CHATIV_FONTSIZE = "Font size",
  CHATIV_FONTSIZE_TOOLTIP = "Text size in the viewer textfield. Changing this value also changes the height of the window.",
  CHATIV_WINDOWMODE = "Window mode",
  CHATIV_WINDOWMODE_TOOLTIP = "Indicates how the window width is defined.",
  CHATIV_WINDOWMODE_VAL1 = "Adjusted to chat window",
  CHATIV_WINDOWMODE_VAL2 = "Fixed width",
  CHATIV_WINDOWWIDTH = "Window width",
  CHATIV_WINDOWWIDTH_TOOLTIP = "The width of the viewer window.",
  CHATIV_NROFLINES = "Number of text lines",
  CHATIV_NROFLINES_TOOLTIP = "The number of text lines, that can be shown in the viewer window. Changing this value changes the height of the window.",
  CHATIV_KEYBINDING_TUGGLE = "Show or hide the window",
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
