module Styles exposing (mainContent)

import Css
import Css.Global
import Styles.Animations as Animations
import Styles.Colors as Colors


mainContent : List Css.Style
mainContent =
    [ Css.fontFamilies [ "Work Sans", "sans-serif" ]
    , Css.margin2 Css.zero Css.auto
    , Css.color Colors.blackLightest
    , Css.displayFlex
    , Css.flexDirection Css.column
    , Css.height <| Css.pct 100
    , Css.Global.descendants
        [ Css.Global.selector ".main-content__sidebar" mainContentSidebar
        , Css.Global.selector ".main-content__body" mainContentBody
        , Css.Global.selector ".main-content__nav" mainContentNav
        , Css.Global.selector ".main-content__footer" mainContentFooter
        , Css.Global.selector ".inner" inner
        , Css.Global.selector ".container"
            [ Css.width <| Css.px 1024
            , Css.padding2 Css.zero (Css.rem 1)
            , Css.margin2 Css.zero Css.auto
            , Css.displayFlex
            ]
        , Css.Global.selector "a"
            [ Css.textDecoration Css.none
            , Css.color Colors.blueDarker
            ]
        , Css.Global.selector "h1"
            [ Css.fontSize <| Css.rem 1.9
            , Css.fontWeight <| Css.int 700
            , Css.color Colors.black
            ]
        ]
    ]


mainContentNav : List Css.Style
mainContentNav =
    [ Css.height <| Css.rem 5
    , Css.displayFlex
    , Css.position Css.sticky
    , Css.top Css.zero
    , Css.backgroundColor Colors.white
    , Css.alignItems Css.center
    , Css.borderBottom3 (Css.px 1) Css.solid Colors.greyLighter
    , Css.flexShrink <| Css.int 0
    , Css.zIndex <| Css.int 999
    , Css.Global.descendants
        [ Css.Global.selector ".logo"
            [ Css.textDecoration Css.none
            , Css.color Colors.blueDarker
            , Css.fontWeight Css.bolder
            , Css.textTransform Css.uppercase
            ]
        , Css.Global.selector ".container"
            [ Css.displayFlex
            , Css.justifyContent Css.spaceBetween
            ]
        ]
    ]


mainContentSidebar : List Css.Style
mainContentSidebar =
    [ Css.width <| Css.px 300
    , Css.displayFlex
    , Css.flexDirection Css.column
    , Css.Global.descendants
        [ Css.Global.selector ".inner"
            [ Css.justifyContent Css.spaceBetween
            , Css.flexDirection Css.column
            , Css.displayFlex
            ]
        , Css.Global.selector ".main-nav"
            [ Css.marginTop <| Css.rem 1
            , Css.fontSize <| Css.rem 0.9
            , Css.position Css.sticky
            , Css.top <| Css.px 100
            , Css.Global.descendants
                [ Css.Global.selector ".main-nav__section"
                    [ Css.marginBottom <| Css.rem 2 ]
                , Css.Global.selector ".main-nav__header"
                    [ Css.Global.descendants
                        [ Css.Global.selector "a"
                            [ Css.textTransform Css.uppercase
                            , Css.color Colors.grey
                            , Css.marginBottom <| Css.em 0.6
                            , Css.fontSize <| Css.rem 0.8
                            , Css.fontWeight Css.bolder
                            ]
                        ]
                    ]
                , Css.Global.selector "a"
                    [ Css.textDecoration Css.none
                    , Css.color Colors.blackLightest
                    , Css.display Css.block
                    , Css.padding2 (Css.rem 0.3) Css.zero
                    , Css.hover
                        [ Css.color Colors.blue ]
                    ]
                ]
            ]
        ]
    ]


mainContentBody : List Css.Style
mainContentBody =
    [ Css.displayFlex
    , Css.flexGrow <| Css.int 1
    , Css.Global.descendants
        [ Css.Global.selector ".container"
            [ Css.displayFlex ]
        , Css.Global.selector ".inner"
            [ Css.flexDirection Css.column
            , Css.height <| Css.pct 100
            , Css.paddingTop <| Css.rem 2
            , Css.flex <| Css.int 1
            ]
        , Css.Global.selector ".header"
            [ Css.marginBottom <| Css.rem 3
            , Css.color Colors.black
            ]
        , Css.Global.selector ".content"
            [ Css.displayFlex
            , Css.justifyContent Css.center
            ]
        , Css.Global.selector ".content__example"
            [ Css.displayFlex
            , Css.justifyContent Css.center
            , Css.width <| Css.pct 100
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.boxShadow5 Css.zero (Css.px 25) (Css.px 50) (Css.px -12) Colors.grey
            , Css.overflow Css.hidden
            , Animations.scale
            ]
        , Css.Global.selector ".code"
            [ Css.marginTop <| Css.rem 5
            , Css.overflow Css.auto
            , Css.borderRadius <| Css.px 4
            , Css.fontFamilies [ "monospace" ]
            ]
        , Css.Global.selector "c-highlight"
            [ Css.width <| Css.pct 100
            , Css.overflow Css.auto
            ]
        , Css.Global.selector "pre"
            [ Css.margin Css.zero ]
        ]
    ]


mainContentFooter : List Css.Style
mainContentFooter =
    [ Css.fontSize Css.smaller
    , Css.height <| Css.rem 5
    , Css.flexShrink <| Css.int 0
    , Css.displayFlex
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.Global.descendants
        [ Css.Global.selector "a"
            [ Css.margin2 Css.zero (Css.rem 0.3) ]
        ]
    ]


inner : List Css.Style
inner =
    [ Css.flex <| Css.int 1 ]
