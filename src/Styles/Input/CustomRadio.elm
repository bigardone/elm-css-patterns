module Styles.Input.CustomRadio exposing (customRadio)

import Css
import Css.Global
import Styles.Colors as Colors


customRadio : Css.Style
customRadio =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.center
        , Css.flexDirection Css.column
        , Css.Global.descendants
            [ Css.Global.selector ".custom-radio"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.width <| Css.px 200
                , Css.cursor Css.pointer
                , Css.marginBottom <| Css.rem 1
                ]
            , Css.Global.selector ".custom-radio__input"
                [ Css.display Css.none
                , Css.checked
                    [ Css.Global.generalSiblings
                        [ Css.Global.selector ".custom-radio__icon > .custom-radio__inner-icon"
                            [ Css.backgroundColor Colors.blue ]
                        ]
                    ]
                ]
            , Css.Global.selector ".custom-radio__icon"
                [ Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderRadius <| Css.pct 100
                , Css.marginRight <| Css.rem 0.4
                , Css.padding <| Css.px 2
                ]
            , Css.Global.selector ".custom-radio__inner-icon"
                [ Css.borderRadius <| Css.pct 100
                , Css.height <| Css.rem 0.8
                , Css.width <| Css.rem 0.8
                ]
            ]
        ]

