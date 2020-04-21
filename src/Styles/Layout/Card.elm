module Styles.Layout.Card exposing (card)

import Css
import Css.Global


card : Css.Style
card =
    Css.batch
        [ Css.displayFlex
        , Css.flexWrap Css.wrap
        , Css.margin2 Css.zero (Css.px -8)
        , Css.width <| Css.pct 100
        , Css.paddingTop <| Css.rem 1
        , Css.Global.descendants
            [ Css.Global.selector "> div"
                [ Css.flexBasis <| Css.pct 25
                , Css.padding2 Css.zero (Css.px 8)
                , Css.marginBottom <| Css.rem 1
                ]
            , Css.Global.selector "> div > div"
                [ Css.width <| Css.pct 100
                ]
            ]
        ]
