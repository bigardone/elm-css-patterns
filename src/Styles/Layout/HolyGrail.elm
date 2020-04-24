module Styles.Layout.HolyGrail exposing (holyGrail)

import Css
import Css.Global
import Styles.Colors as Colors


holyGrail : Css.Style
holyGrail =
    Css.batch
        [ Css.displayFlex
        , Css.flexDirection Css.column
        , Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.Global.descendants
            [ Css.Global.selector "> header"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.padding <| Css.rem 1
                , Css.borderBottom3 (Css.px 1) Css.solid Colors.greyLighter
                ]
            , Css.Global.selector "main"
                [ Css.flexGrow <| Css.int 1
                , Css.displayFlex
                , Css.flexDirection Css.row
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            , Css.Global.selector "article"
                [ Css.flexGrow <| Css.int 1
                , Css.padding <| Css.rem 1
                ]
            , Css.Global.selector "aside"
                [ Css.width <| Css.pct 25
                , Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
                , Css.padding <| Css.rem 1
                ]
            , Css.Global.selector "nav"
                [ Css.width <| Css.pct 20
                , Css.borderLeft3 (Css.px 1) Css.solid Colors.greyLighter
                , Css.padding <| Css.rem 1
                ]
            , Css.Global.selector "> footer"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.padding <| Css.rem 1
                , Css.borderTop3 (Css.px 1) Css.solid Colors.greyLighter
                ]
            ]
        ]
