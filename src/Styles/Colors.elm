module Styles.Colors exposing
    ( black
    , blackLight
    , blackLightest
    , blue
    , blueDark
    , blueDarker
    , blueLight
    , blueLighter
    , grey
    , greyLight
    , greyLighter
    , white
    )

import Css


black : Css.Color
black =
    Css.hex "2e3440"


blackLight : Css.Color
blackLight =
    Css.hex "3b4252"


blackLightest : Css.Color
blackLightest =
    Css.hex "4c566a"


grey : Css.Color
grey =
    Css.hex "d8dee9"


greyLight : Css.Color
greyLight =
    Css.hex "e5e9f0"


greyLighter : Css.Color
greyLighter =
    Css.hex "eceff4"


blue : Css.Color
blue =
    Css.hex "88c0d0"


blueLight : Css.Color
blueLight =
    Css.hex "8fbcbb"


blueLighter : Css.Color
blueLighter =
    Css.hex "e8f1f1"


blueDark : Css.Color
blueDark =
    Css.hex "81a1c1"


blueDarker : Css.Color
blueDarker =
    Css.hex "5e81ac"


white : Css.Color
white =
    Css.hex "ffffff"
