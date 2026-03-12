local localization_strings = {
  CHATIV_WARNING_CAPTION = "Обратите внимание:",
  CHATIV_WARNING_TEXT = "Поле для отображения ввода в чате отображается под окном чата. Окно чата обычно занимает всю нижнюю часть"
    .. " экрана. Если при отображении аддона окно не сдвигается вверх автоматически, нижний край окна чата необходимо сдвинуть вверх"
    .. " вручную.",
  CHATIV_VISIBLE = "Отображать поле ввода чата",
  CHATIV_VISIBLE_TOOLTIP = "Показывает или скрывает просмотрщик (область ввода чата).",
  CHATIV_MINIMISED = "Уменьшенный размер окна",
  CHATIV_MINIMISED_TOOLTIP = "Отображает окно в свернутом виде по одной строке.",
  CHATIV_FONTSIZE = "Размер шрифта",
  CHATIV_FONTSIZE_TOOLTIP = "Размер текста в поле ввода просмотрщика. Изменение этого значения также влияет на высоту окна.",
  CHATIV_WINDOWMODE = "Режим окна",
  CHATIV_WINDOWMODE_TOOLTIP = "Указывает, как определяется ширина окна.",
  CHATIV_WINDOWMODE_VAL1 = "Автоподстройка под окно чата",
  CHATIV_WINDOWMODE_VAL2 = "Фиксированная ширина",
  CHATIV_WINDOWWIDTH = "Ширина окна",
  CHATIV_WINDOWWIDTH_TOOLTIP = "Ширина окна просмотрщика.",
  CHATIV_NROFLINES = "Количество строк текста",
  CHATIV_NROFLINES_TOOLTIP = "Максимальное количество строк текста, отображаемых в окне просмотрщика. Изменение этого значения"
    .. " влияет на высоту окна.",
  CHATIV_KEYBINDING_TUGGLE = "Показать или скрыть окно",
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
