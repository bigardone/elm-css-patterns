module Components exposing
    ( inputNavItems
    , layout
    , layoutNavItems
    , navigationNavItems
    , pageBody
    )

import Assets
import Document exposing (Document)
import Generated.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Events as Html
import Html.Styled.Keyed as HtmlKeyed
import Styles
import Url exposing (Url)


layout : msg -> { page : Document msg, showSidebar : Bool, url : Url } -> Document msg
layout onShowSidebarClick { page, showSidebar, url } =
    let
        isTop =
            case Route.fromUrl url of
                Just Route.Top ->
                    True

                _ ->
                    False
    in
    { title = page.title ++ " | elm-css patterns"
    , body =
        [ Html.div
            [ Html.css Styles.mainContent
            , Html.id "main"
            , Html.classList
                [ ( "main-top", isTop )
                , ( "show-sidebar", showSidebar )
                ]
            ]
            [ navbar onShowSidebarClick
            , Html.div
                [ Html.class "main-content__body" ]
                [ Html.div
                    [ Html.class "container" ]
                    [ sidebar showSidebar url
                    , Html.div
                        [ Html.class "inner" ]
                        page.body
                    ]
                ]
            , footer
            ]
        ]
    }


footer : Html msg
footer =
    Html.footer
        [ Html.class "main-content__footer" ]
        [ Html.div
            [ Html.class "container" ]
            [ Html.p
                []
                [ Html.text "Crafted with ❤ and "
                , Html.a
                    [ Html.href "https://elm-lang.org/"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text "elm" ]
                , Html.text " by "
                , Html.a
                    [ Html.href "https://github.com/bigardone"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text "bigardone" ]
                , Html.text ". Powered by "
                , Html.a
                    [ Html.href "https://github.com/ryannhg/elm-spa"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm-spa" ]
                , Html.text ". Inspired by "
                , Html.a
                    [ Html.href "https://github.com/phuoc-ng/csslayout"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " csslayout" ]
                , Html.text "."
                ]
            ]
        ]


navbar : msg -> Html msg
navbar onShowSidebarClick =
    Html.nav
        [ Html.class "main-content__nav" ]
        [ Html.div
            [ Html.class "container" ]
            [ Html.div
                [ Html.class "" ]
                [ Html.a
                    [ Html.class "logo"
                    , Html.href (Route.toHref Route.Top)
                    ]
                    [ Html.text "elm-css patterns" ]
                ]
            , Html.div
                []
                [ Html.a
                    [ Html.href "https://github.com/bigardone/elm-css-patterns"
                    , Html.target "_blank"
                    ]
                    [ Assets.githubIcon ]
                , Html.span
                    [ Html.class "burger"
                    , Html.onClick onShowSidebarClick
                    ]
                    [ Assets.barsIcon ]
                ]
            ]
        ]


layoutNavItems : List ( Route, String )
layoutNavItems =
    [ ( Route.Layout_Card_Top, "Card" )
    , ( Route.Layout_HolyGrail_Top, "Holy grail" )
    , ( Route.Layout_Sidebar_Top, "Sidebar" )
    , ( Route.Layout_SplitScreen_Top, "Split screen" )
    , ( Route.Layout_StickyFooter_Top, "Sticky footer" )
    , ( Route.Layout_StickyHeader_Top, "Sticky header" )
    ]


navigationNavItems : List ( Route, String )
navigationNavItems =
    [ ( Route.Navigation_Drawer_Top, "Drawer" )
    , ( Route.Navigation_Pagination_Top, "Pagination" )
    , ( Route.Navigation_Split_Top, "Split navigation" )
    , ( Route.Navigation_Tab_Top, "Tab" )
    ]


inputNavItems : List ( Route, String )
inputNavItems =
    [ ( Route.Input_CustomCheckbox_Top, "Custom checkbox" )
    , ( Route.Input_CustomRadio_Top, "Custom radio" )
    , ( Route.Input_Dropdown_Top, "Dropdown" )
    , ( Route.Input_RadioButtonGroup_Top, "Radio button group" )
    ]


sidebar : Bool -> Url -> Html msg
sidebar showSidebar url =
    Html.aside
        [ Html.classList
            [ ( "main-content__sidebar", True )
            , ( "show", showSidebar )
            ]
        ]
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
                , nav layoutNavItems url
                ]
            , Html.div
                [ Html.class "main-nav__section" ]
                [ Html.header
                    [ Html.class "main-nav__header" ]
                    [ Html.a
                        [ Html.href <| Route.toHref Route.Navigation_Top ]
                        [ Html.text "Navigation" ]
                    ]
                , nav navigationNavItems url
                ]
            , Html.div
                [ Html.class "main-nav__section" ]
                [ Html.header
                    [ Html.class "main-nav__header" ]
                    [ Html.a
                        [ Html.href <| Route.toHref Route.Input_Top ]
                        [ Html.text "Input" ]
                    ]
                , nav inputNavItems url
                ]
            ]
        ]


nav : List ( Route, String ) -> Url -> Html msg
nav items url =
    items
        |> List.map (navItem url)
        |> HtmlKeyed.ul [ Html.class "list" ]


navItem : Url -> ( Route, String ) -> ( String, Html msg )
navItem url ( route, text ) =
    let
        active =
            Route.fromUrl url == Just route
    in
    ( text
    , Html.li
        []
        [ Html.a
            [ Html.href <| Route.toHref route
            , Html.classList [ ( "active", active ) ]
            ]
            [ Html.text text ]
        ]
    )


pageBody : { header : String, content : Html msg, code : String, componentUrl : String } -> List (Html msg)
pageBody { header, content, code, componentUrl } =
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
        , Html.a
            [ Html.href componentUrl
            , Html.target "_blank"
            , Html.class "cool"
            ]
            [ Html.text "Get the code"
            , Assets.linkIcon
            ]
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
