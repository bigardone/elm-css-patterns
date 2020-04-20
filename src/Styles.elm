module Styles exposing (mainContent)

import Css
import Css.Global


mainContent : List Css.Style
mainContent =
    [ Css.fontFamilies [ "Work Sans", "sans-serif" ]
    , Css.displayFlex
    , Css.height <| Css.vh 100
    , Css.Global.descendants
        [ Css.Global.selector ".main-content__sidebar" mainContentSidebar
        , Css.Global.selector ".main-content__body" mainContentBody
        , Css.Global.selector ".inner" inner
        ]
    ]


mainContentSidebar : List Css.Style
mainContentSidebar =
    [ Css.backgroundColor <| Css.hex "EFEFEF"
    , Css.width <| Css.px 300
    , Css.displayFlex
    , Css.flexDirection Css.column
    , Css.Global.descendants
        [ Css.Global.selector ".inner"
            [ Css.justifyContent Css.spaceBetween
            , Css.flexDirection Css.column
            , Css.displayFlex
            ]
        , Css.Global.selector ".main-nav"
            [ Css.marginTop <| Css.rem 1 ]
        ]
    ]


mainContentBody : List Css.Style
mainContentBody =
    [ Css.flex <| Css.int 1
    , Css.Global.descendants
        [ Css.Global.selector ".inner"
            [ Css.flexDirection Css.column
            , Css.displayFlex
            , Css.height <| Css.pct 100
            ]
        , Css.Global.selector ".header"
            [ Css.marginBottom <| Css.rem 2
            ]
        , Css.Global.selector ".content"
            [ Css.flex <| Css.int 1
            , Css.displayFlex
            , Css.justifyContent Css.center
            ]
        , Css.Global.selector ".code"
            [ Css.flex <| Css.int 1
            , Css.displayFlex
            , Css.backgroundColor <| Css.hex "000000"
            , Css.marginRight <| Css.rem -1
            , Css.marginLeft <| Css.rem -1
            , Css.marginBottom <| Css.rem -1
            ]
        ]
    ]


inner : List Css.Style
inner =
    [ Css.padding <| Css.rem 1
    , Css.flex <| Css.int 1
    ]
