module Styles.Input.CustomCheckbox exposing (customCheckbox)

import Css
import Css.Global
import Styles.Colors as Colors


customCheckbox : Css.Style
customCheckbox =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.center
        , Css.flexDirection Css.column
        , Css.Global.descendants
            [ Css.Global.selector ".custom-checkbox"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.width <| Css.px 200
                , Css.cursor Css.pointer
                , Css.marginBottom <| Css.rem 1
                ]
            , Css.Global.selector ".custom-checkbox__input"
                [ Css.display Css.none
                , Css.checked
                    [ Css.Global.generalSiblings
                        [ Css.Global.selector ".custom-checkbox__icon > .custom-checkbox__inner-icon"
                            [ Css.backgroundColor Colors.blue ]
                        ]
                    ]
                ]
            , Css.Global.selector ".custom-checkbox__icon"
                [ Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderRadius <| Css.px 4
                , Css.marginRight <| Css.rem 0.4
                , Css.padding <| Css.px 2
                ]
            , Css.Global.selector ".custom-checkbox__inner-icon"
                [ Css.borderRadius <| Css.px 4
                , Css.height <| Css.rem 0.8
                , Css.width <| Css.rem 0.8
                ]
            ]
        ]

