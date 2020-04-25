module Styles.Navigation.Drawer exposing (drawer)

import Css
import Css.Global
import Styles.Colors as Colors


drawer : Css.Style
drawer =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.position Css.relative
        , Css.Global.descendants
            [ Css.Global.selector ".drawer__overlay"
                [ Css.height <| Css.pct 100
                , Css.position Css.absolute
                , Css.left Css.zero
                , Css.top Css.zero
                , Css.backgroundColor Colors.black
                , Css.opacity <| Css.num 0.8
                , Css.width <| Css.pct 100
                ]
            , Css.Global.selector ".drawer__content"
                [ Css.height <| Css.pct 100
                , Css.position Css.absolute
                , Css.backgroundColor Colors.white
                , Css.left Css.zero
                , Css.top Css.zero
                , Css.padding <| Css.rem 1
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            ]
        ]

