local localization_strings = {
  CHATIV_WARNING_CAPTION = "À noter:",
  CHATIV_WARNING_TEXT = "Le champ d'affichage des messages instantanés s'affiche sous la fenêtre de chat. La fenêtre de chat"
    .. " s'étend généralement jusqu'au bord inférieur de l'écran. Si la fenêtre ne se déplace pas automatiquement vers le haut"
    .. " lorsque l'add-on est affiché, le bord inférieur de la fenêtre de chat doit être déplacé manuellement vers le haut.",
  CHATIV_VISIBLE = "Visibilité",
  CHATIV_VISIBLE_TOOLTIP = "Affiche ou masque la fenêtre.",
  CHATIV_MINIMISED = "Taille de fenêtre réduite",
  CHATIV_MINIMISED_TOOLTIP = "Affiche la fenêtre réduite à une ligne.",
  CHATIV_FONTSIZE = "Taille de la police",
  CHATIV_FONTSIZE_TOOLTIP = "La taille des caractères affichés dans la fenêtre du visualiseur. Toute modification de"
    .. " cette valeur aura également un impact sur la hauteur de la fenêtre.",
  CHATIV_WINDOWMODE = "Mode fenêtré",
  CHATIV_WINDOWMODE_TOOLTIP = "Définit comment la largeur de la fenêtre est déterminée.",
  CHATIV_WINDOWMODE_VAL1 = "Largeur de la fenêtre de chat",
  CHATIV_WINDOWMODE_VAL2 = "Largeur fixe",
  CHATIV_WINDOWWIDTH = "Largeur de la fenêtre",
  CHATIV_WINDOWWIDTH_TOOLTIP = "La largeur de la fenêtre du visualiseur.",
  CHATIV_NROFLINES = "Nombre de lignes de texte",
  CHATIV_NROFLINES_TOOLTIP = "Le nombre de lignes de texte pouvant être affichées dans le visualiseur. Toute modification"
    .. " de cette valeur modifie la hauteur de la fenêtre du visualiseur.",
  CHATIV_KEYBINDING_TUGGLE = "Afficher ou masquer la fenêtre",
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
