module Styles.Layout.StickyHeader exposing (stickyHeader)

import Css
import Css.Global
import Styles.Colors as Colors


stickyHeader : Css.Style
stickyHeader =
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
                [ Css.width <| Css.pct 100
                , Css.padding <| Css.rem 1
                , Css.overflow Css.auto
                , Css.Global.descendants
                    [ Css.Global.selector "> div"
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                ]
            ]
        ]
