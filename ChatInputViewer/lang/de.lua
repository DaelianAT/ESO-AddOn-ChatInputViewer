local localization_strings = {
  CHATIV_WARNING_CAPTION = "Bitte beachten:",
  CHATIV_WARNING_TEXT = "Das Feld für die Anzeige der Chateingabe wird unterhalb des Chatfensters angezeigt. Reicht das Chatfenster,"
    .. " wie normalerweise üblich, bis zum unteren Rand des Bildschirms, ist das Anzeigefeld nicht zu sehen. Der untere Rand"
    .. " des Chatfensters muss dann nach oben geschoben werden.",
  CHATIV_VISIBLE = "Sichtbarkeit",
  CHATIV_VISIBLE_TOOLTIP = "Blendet das Fenster ein oder aus.",
  CHATIV_FONTSIZE = "Fontgröße",
  CHATIV_FONTSIZE_TOOLTIP = "Die Größe der Buchstaben im Fenster des Viewers. Eine Änderung dieses Werts ändert auch die Höhe des Viewer-Fensters.",
  CHATIV_WINDOWMODE = "Fenstermodus",
  CHATIV_WINDOWMODE_TOOLTIP = "Legt fest, wie die Breite des Fensters bestimmt wird.",
  CHATIV_WINDOWMODE_VAL1 = "Breite des Chat-Fensters",
  CHATIV_WINDOWMODE_VAL2 = "Feste Breite",
  CHATIV_WINDOWWIDTH = "Fensterbreite",
  CHATIV_WINDOWWIDTH_TOOLTIP = "Die Breite des Viewerfensters.",
  CHATIV_NROFLINES = "Anzahl der Textzeilen",
  CHATIV_NROFLINES_TOOLTIP = "Die Anzahl der Textzeilen, die im Viewer angezeigt werden können. Eine Änderung dieses Werts ändert die Höhe des Viewer-Fensters.",
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
