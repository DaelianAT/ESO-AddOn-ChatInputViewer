local localization_strings = {
  CHATIV_WARNING_CAPTION = "À noter:",
  CHATIV_WARNING_TEXT = "Le champ de saisie du message s’affiche sous la fenêtre de discussion. Si la fenêtre de chat"
    .. " atteint le bord inférieur de l’écran – comme c’est souvent le cas – ce champ peut ne pas être visible. Il faut"
    .. " alors remonter légèrement la fenêtre de chat pour le faire apparaître.",
  CHATIV_VISIBLE = "Visibilité",
  CHATIV_VISIBLE_TOOLTIP = "Affiche ou masque la fenêtre.",
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
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
