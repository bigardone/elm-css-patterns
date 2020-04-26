module Styles.Input.RadioButtonGroup exposing (radioButtonGroup)

import Css
import Css.Global
import Styles.Colors as Colors


radioButtonGroup : Css.Style
radioButtonGroup =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.center
        , Css.flexDirection Css.column
        , Css.Global.descendants
            [ Css.Global.selector ".radio-button-group"
                [ Css.displayFlex
                , Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderRadius <| Css.px 4
                ]
            , Css.Global.selector ".radio-button"
                [ Css.displayFlex
                , Css.flex <| Css.int 1
                ]
            , Css.Global.selector ".radio-button__label"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.flex <| Css.int 1
                , Css.padding <| Css.rem 0.8
                , Css.width <| Css.px 150
                , Css.cursor Css.pointer
                ]
            , Css.Global.selector ".radio-button:not(:last-of-type)"
                [ Css.borderRight3 (Css.px 1) Css.solid Colors.grey ]
            , Css.Global.selector ".radio-button__input"
                [ Css.display Css.none
                , Css.checked
                    [ Css.Global.generalSiblings
                        [ Css.Global.selector ".radio-button__label"
                            [ Css.backgroundColor Colors.blue ]
                        ]
                    ]
                ]
            ]
        ]

