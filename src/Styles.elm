module Styles exposing (mainContent)

import Css
import Css.Global
import Styles.Animations as Animations
import Styles.Breakpoints as Breakpoints
import Styles.Colors as Colors


mainContent : List Css.Style
mainContent =
    [ Css.fontFamilies [ "Work Sans", "sans-serif" ]
    , Css.margin2 Css.zero Css.auto
    , Css.color Colors.blackLightest
    , Css.displayFlex
    , Css.flexDirection Css.column
    , Css.minHeight <| Css.vh 100
    , Css.Global.withClass "main-top" mainTop
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
            , Css.Global.withClass "cool"
                [ Css.position Css.relative
                , Css.fontWeight <| Css.int 500
                , Css.after
                    [ Css.property "content" "\" \""
                    , Css.backgroundColor Colors.blueLight
                    , Css.position Css.absolute
                    , Css.left <| Css.em 0.6
                    , Css.bottom <| Css.em -0.1
                    , Css.zIndex <| Css.int -1
                    , Css.property "width" "calc(100% - .4em)"
                    , Css.property "height" "calc(100% - .6em)"
                    , Css.opacity <| Css.num 0.2
                    , Css.property "transition" "0.35s cubic-bezier(0.25, 0.1, 0, 2.05)"
                    ]
                , Css.hover
                    [ Css.after
                        [ Css.left Css.zero
                        , Css.bottom <| Css.px -2
                        , Css.width <| Css.pct 100
                        , Css.height <| Css.pct 100
                        ]
                    ]
                ]
            ]
        , Css.Global.selector "h1"
            [ Css.fontSize <| Css.rem 1.9
            , Css.fontWeight <| Css.int 700
            , Css.color Colors.black
            ]
        ]
    ]


mainTop : List Css.Style
mainTop =
    [ Css.Global.descendants
        [ Css.Global.selector ".top-header"
            [ Animations.scale
            , Css.marginBottom <| Css.rem 5
            , Css.textAlign Css.center
            ]
        , Css.Global.selector ".main-content__sidebar"
            [ Css.display Css.none ]
        , Css.Global.selector "h1"
            [ Css.fontSize <| Css.rem 3.4
            , Css.marginBottom <| Css.em 1
            , Breakpoints.small
                [ Css.fontSize <| Css.rem 2.6 ]
            ]
        , Css.Global.selector ".hero"
            [ Css.fontSize <| Css.rem 1.8
            , Breakpoints.small
                [ Css.fontSize <| Css.rem 1.4 ]
            ]
        , Css.Global.selector ".sections"
            [ Css.displayFlex
            , Css.width <| Css.pct 60
            , Css.margin2 Css.zero Css.auto
            , Css.justifyContent Css.spaceBetween
            , Css.alignItems Css.center
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
        , Css.Global.selector ".burger"
            [ Css.display Css.none
            , Breakpoints.small
                [ Css.display Css.inlineBlock
                , Css.marginLeft <| Css.rem 0.3
                , Css.cursor Css.pointer
                ]
            ]
        ]
    ]


mainContentSidebar : List Css.Style
mainContentSidebar =
    [ Css.displayFlex
    , Css.width <| Css.px 300
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
                            , Css.color Colors.blueDark
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
                        [ Css.color Colors.blueDarker ]
                    ]
                ]
            ]
        ]
    , Breakpoints.small
        [ Css.display Css.none
        , Css.Global.withClass "show"
            [ Css.displayFlex
            , Css.position Css.fixed
            , Css.top <| Css.px 80
            , Css.left Css.zero
            , Css.width <| Css.pct 100
            , Css.backgroundColor Colors.white
            , Css.padding <| Css.rem 1
            , Css.height <| Css.vh 100
            , Css.zIndex <| Css.int 999
            , Animations.fade
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
            , Css.paddingTop <| Css.rem 2
            , Css.flex <| Css.int 1
            ]
        , Css.Global.selector ".header"
            [ Css.marginBottom <| Css.rem 3
            , Css.color Colors.black
            , Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.spaceBetween
            , Breakpoints.small
                [ Css.display Css.block ]
            ]
        , Css.Global.selector ".header svg"
            [ Css.marginLeft <| Css.rem 0.3 ]
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
            [ Css.marginTop <| Css.rem 3
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
    , Css.Global.descendants
        [ Css.Global.selector ".container"
            [ Css.textAlign Css.center
            , Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Breakpoints.small
                [ Css.justifyContent Css.flexStart ]
            ]
        , Css.Global.selector "a"
            [ Css.margin2 Css.zero (Css.rem 0.3) ]
        ]
    ]


inner : List Css.Style
inner =
    [ Css.flex <| Css.int 1 ]
