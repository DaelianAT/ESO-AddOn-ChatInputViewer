local localization_strings = {
  CHATIV_WARNING_CAPTION = "Please note:",
  CHATIV_WARNING_TEXT = "The area for displaying the chat input is displayed below the chat window. If the chat window"
    .. " extends to the bottom edge of the screen, as is normally the case, the display area is not visible. The bottom"
    .. " edge of the chat window must then be moved upwards.",
  CHATIV_VISIBLE = "Visible",
  CHATIV_VISIBLE_TOOLTIP = "Shows or hides the viewer.",
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
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
