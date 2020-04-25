module Styles.Navigation.Tab exposing (tab)

import Css
import Css.Global
import Styles.Colors as Colors


tab : Css.Style
tab =
    Css.batch
        [ Css.width <| Css.pct 100
        , Css.height <| Css.px 400
        , Css.displayFlex
        , Css.alignItems Css.center
        , Css.justifyContent Css.center
        , Css.Global.descendants
            [ Css.Global.selector ".tabs"
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                ]
            , Css.Global.selector ".tabs__item"
                [ Css.borderBottom3 (Css.px 1) Css.solid Colors.grey
                , Css.padding <| Css.rem 1
                , Css.width <| Css.rem 10
                ]
            , Css.Global.selector ".tabs__item--active"
                [ Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderBottomColor Css.transparent
                , Css.borderTopLeftRadius <| Css.px 2
                , Css.borderTopRightRadius <| Css.px 2
                ]
            ]
        ]
