module Styles.Layout.SplitScreen exposing (spliScreen)

import Css
import Css.Global
import Styles.Colors as Colors


spliScreen : Css.Style
spliScreen =
    Css.batch
        [ Css.displayFlex
        , Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.Global.descendants
            [ Css.Global.selector "> div"
                [ Css.flex <| Css.int 1
                , Css.displayFlex
                , Css.flexDirection Css.column
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.padding <| Css.rem 1
                , Css.firstOfType
                    [ Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
                    ]
                ]
            , Css.Global.selector ".inner-wrapper"
                [ Css.width <| Css.pct 100
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            , Css.Global.selector ".inner-wrapper--center"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.flexDirection Css.column
                ]
            , Css.Global.selector ".placeholder-rectangle"
                [ Css.marginBottom <| Css.em 1 ]
            ]
        ]
