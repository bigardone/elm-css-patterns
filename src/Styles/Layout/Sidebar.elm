module Styles.Layout.Sidebar exposing (sidebar)

import Css
import Css.Global
import Styles.Colors as Colors


sidebar : Css.Style
sidebar =
    Css.batch
        [ Css.displayFlex
        , Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.Global.descendants
            [ Css.Global.selector "aside"
                [ Css.width <| Css.pct 30
                , Css.padding <| Css.rem 1
                , Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
                , Css.displayFlex
                , Css.flexDirection Css.column
                , Css.justifyContent Css.spaceBetween
                ]
            , Css.Global.selector "main"
                [ Css.flex <| Css.int 1
                , Css.overflow Css.auto
                , Css.padding <| Css.rem 1
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            ]
        ]
