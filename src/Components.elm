module Components exposing
    ( layout
    , layoutNav
    , navigationNav
    , pageBody
    )

import Assets
import Document exposing (Document)
import Generated.Route as Route
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed as HtmlKeyed
import Styles


layout : { page : Document msg } -> Document msg
layout { page } =
    { title = page.title
    , body =
        [ Html.main_
            [ Html.css Styles.mainContent
            , Html.id "main"
            ]
            [ navbar
            , Html.div
                [ Html.class "main-content__body" ]
                [ Html.div
                    [ Html.class "container" ]
                    [ sidebar
                    , Html.div
                        [ Html.class "inner" ]
                        page.body
                    ]
                ]
            , Html.footer
                [ Html.class "main-content__footer" ]
                [ Html.text "Crafted with ❤ and Elm by "
                , Html.a
                    [ Html.href "https://github.com/bigardone" ]
                    [ Html.text "bigardone" ]
                ]
            ]
        ]
    }


navbar : Html msg
navbar =
    Html.nav
        [ Html.class "main-content__nav" ]
        [ Html.div
            [ Html.class "container" ]
            [ Html.div
                []
                [ Html.a
                    [ Html.class "logo"
                    , Html.href (Route.toHref Route.Top)
                    ]
                    [ Html.text "Elm CSS patterns" ]
                ]
            , Html.a
                [ Html.href "https://github.com/bigardone/elm-css-patterns"
                , Html.target "_blank"
                ]
                [ Assets.githubIcon ]
            ]
        ]


sidebar : Html msg
sidebar =
    Html.aside
        [ Html.class "main-content__sidebar" ]
        [ Html.nav
            [ Html.class "main-nav" ]
            [ Html.div
                [ Html.class "main-nav__section" ]
                [ Html.header
                    [ Html.class "main-nav__header" ]
                    [ Html.a
                        [ Html.href <| Route.toHref Route.Layout_Top ]
                        [ Html.text "Layout" ]
                    ]
                , layoutNav
                ]
            , Html.div
                [ Html.class "main-nav__section" ]
                [ Html.header
                    [ Html.class "main-nav__header" ]
                    [ Html.a
                        [ Html.href <| Route.toHref Route.Navigation_Top ]
                        [ Html.text "Navigation" ]
                    ]
                , navigationNav
                ]
            ]
        ]


layoutNav : Html msg
layoutNav =
    Html.ul
        [ Html.class "list" ]
        [ Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_Card_Top ]
                [ Html.text "Card" ]
            ]
        , Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_Sidebar_Top ]
                [ Html.text "Sidebar" ]
            ]
        , Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_SplitScreen_Top ]
                [ Html.text "Split screen" ]
            ]
        , Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_HolyGrail_Top ]
                [ Html.text "Holy grail" ]
            ]
        , Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_StickyHeader_Top ]
                [ Html.text "Sticky header" ]
            ]
        , Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_StickyFooter_Top ]
                [ Html.text "Sticky footer" ]
            ]
        ]


navigationNav : Html msg
navigationNav =
    Html.ul
        [ Html.class "list" ]
        [ Html.li
            []
            [ Html.a
                [ Html.href <| Route.toHref Route.Navigation_Drawer_Top ]
                [ Html.text "Drawer" ]
            ]
        ]


pageBody : { header : String, content : Html msg, code : String } -> List (Html msg)
pageBody { header, content, code } =
    let
        id =
            header
                |> String.split " "
                |> List.map String.toLower
                |> String.concat
    in
    [ Html.header
        [ Html.class "header" ]
        [ Html.h1
            []
            [ Html.text header ]
        ]
    , HtmlKeyed.node "div"
        [ Html.class "content" ]
        [ ( id
          , Html.div
                [ Html.class "content__example" ]
                [ content ]
          )
        ]
    , HtmlKeyed.node "div"
        [ Html.class "code" ]
        [ ( id ++ "-code"
          , Html.node "c-highlight"
                [ Html.attribute "content" code ]
                []
          )
        ]
    ]
