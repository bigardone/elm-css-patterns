module Styles.Layout.StickyFooter exposing (stickyFooter)

import Css
import Css.Global
import Styles.Colors as Colors


stickyFooter : Css.Style
stickyFooter =
    Css.batch
        [ Css.displayFlex
        , Css.flexDirection Css.column
        , Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.Global.descendants
            [ Css.Global.selector "> header"
                [ Css.displayFlex
                , Css.flexShrink <| Css.int 0
                , Css.alignItems Css.center
                , Css.padding <| Css.rem 1
                , Css.borderBottom3 (Css.px 1) Css.solid Colors.greyLighter
                ]
            , Css.Global.selector "main"
                [ Css.width <| Css.pct 100
                , Css.padding <| Css.rem 1
                , Css.overflow Css.auto
                , Css.flexGrow <| Css.int 1
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            , Css.Global.selector "> footer"
                [ Css.displayFlex
                , Css.flexShrink <| Css.int 0
                , Css.alignItems Css.center
                , Css.padding <| Css.rem 1
                , Css.borderTop3 (Css.px 1) Css.solid Colors.greyLighter
                ]
            ]
        ]
