module Styles.Input.Dropdown exposing (dropdown)

import Css
import Css.Global
import Styles.Colors as Colors


dropdown : Css.Style
dropdown =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.center
        , Css.flexDirection Css.column
        , Css.Global.descendants
            [ Css.Global.selector ".dropdown"
                [ Css.position Css.relative
                , Css.marginBottom <| Css.rem 1
                , Css.hover
                    [ Css.Global.descendants
                        [ Css.Global.selector ".dropdown__content"
                            [ Css.display Css.block ]
                        ]
                    ]
                ]
            , Css.Global.selector ".button"
                [ Css.padding <| Css.rem 1
                , Css.width <| Css.px 200
                , Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.spaceBetween
                , Css.borderRadius <| Css.px 4
                , Css.cursor Css.pointer
                ]
            , Css.Global.selector ".dropdown__content"
                [ Css.backgroundColor Colors.white
                , Css.padding <| Css.rem 1
                , Css.position Css.absolute
                , Css.top <| Css.pct 100
                , Css.right Css.zero
                , Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderRadius <| Css.px 4
                , Css.width <| Css.px 250
                , Css.marginTop <| Css.px 2
                , Css.display Css.none
                , Css.zIndex <| Css.int 9999
                ]
            , Css.Global.selector ".other-content"
                [ Css.width <| Css.pct 60 ]
            ]
        ]

