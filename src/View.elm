module View exposing
    ( View
    , map
    , none
    , toBrowserDocument
    )

import Assets
import Browser
import Components
import Gen.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as AHtml
import Html.Styled.Events as Html
import Html.Styled.Keyed as HtmlKeyed
import Styles
import Url exposing (Url)


type alias View msg =
    { title : String
    , body : List (Html msg)
    }


placeholder : String -> View msg
placeholder str =
    { title = str
    , body = [ Html.text str ]
    }


none : View msg
none =
    placeholder ""


map : (a -> b) -> View a -> View b
map fn view =
    { title = view.title
    , body = List.map (Html.map fn) view.body
    }


toBrowserDocument : { isHomeRoute : Bool, showSidebar : Bool, onShowSidebarClick : msg, url : Url } -> View msg -> Browser.Document msg
toBrowserDocument { isHomeRoute, showSidebar, onShowSidebarClick, url } view =
    { title = view.title ++ " | elm-css patterns"
    , body =
        [ Html.div
            [ AHtml.css Styles.mainContent
            , AHtml.id "main"
            , AHtml.classList
                [ ( "main-top", isHomeRoute )
                , ( "show-sidebar", showSidebar )
                ]
            ]
            [ navbar onShowSidebarClick
            , Html.div
                [ AHtml.class "main-content__body" ]
                [ Html.div
                    [ AHtml.class "container" ]
                    [ sidebar onShowSidebarClick showSidebar url
                    , Html.div
                        [ AHtml.class "inner" ]
                        view.body
                    ]
                ]
            , footer
            ]
        ]
            |> List.map Html.toUnstyled
    }


footer : Html msg
footer =
    Html.footer
        [ AHtml.class "main-content__footer" ]
        [ Html.div
            [ AHtml.class "container" ]
            [ Html.p
                []
                [ Html.text "Crafted with ❤ and "
                , Html.a
                    [ AHtml.href "https://elm-lang.org/"
                    , AHtml.target "_blank"
                    , AHtml.class "cool"
                    ]
                    [ Html.text "elm" ]
                , Html.text " by "
                , Html.a
                    [ AHtml.href "https://github.com/bigardone"
                    , AHtml.target "_blank"
                    , AHtml.class "cool"
                    ]
                    [ Html.text "bigardone" ]
                , Html.text ". Powered by "
                , Html.a
                    [ AHtml.href "https://github.com/ryannhg/elm-spa"
                    , AHtml.target "_blank"
                    , AHtml.class "cool"
                    ]
                    [ Html.text " elm-spa" ]
                , Html.text ". Inspired by "
                , Html.a
                    [ AHtml.href "https://github.com/phuoc-ng/csslayout"
                    , AHtml.target "_blank"
                    , AHtml.class "cool"
                    ]
                    [ Html.text " csslayout" ]
                , Html.text "."
                ]
            ]
        ]


navbar : msg -> Html msg
navbar onShowSidebarClick =
    Html.nav
        [ AHtml.class "main-content__nav" ]
        [ Html.div
            [ AHtml.class "container" ]
            [ Html.div
                [ AHtml.class "" ]
                [ Html.a
                    [ AHtml.class "logo"
                    , AHtml.href (Route.toHref Route.Home_)
                    ]
                    [ Html.text "elm-css patterns" ]
                ]
            , Html.div
                []
                [ Html.a
                    [ AHtml.href "https://github.com/bigardone/elm-css-patterns"
                    , AHtml.target "_blank"
                    ]
                    [ Assets.githubIcon ]
                , Html.span
                    [ AHtml.class "burger"
                    , Html.onClick onShowSidebarClick
                    ]
                    [ Assets.barsIcon ]
                ]
            ]
        ]


sidebar : msg -> Bool -> Url -> Html msg
sidebar onShowSidebarClick showSidebar url =
    Html.aside
        [ AHtml.classList
            [ ( "main-content__sidebar", True )
            , ( "show", showSidebar )
            ]
        ]
        [ Html.nav
            [ AHtml.class "main-nav" ]
            [ Html.span
                [ AHtml.class "close"
                , Html.onClick onShowSidebarClick
                ]
                [ Assets.closeIcon ]
            , mainNavSection "Layout" Components.layoutNavItems Route.Layout url
            , mainNavSection "Navigation" Components.navigationNavItems Route.Navigation url
            , mainNavSection "Input" Components.inputNavItems Route.Input url
            , mainNavSection "Feedback" Components.feedbackNavItems Route.Feedback url
            , mainNavSection "Misc" Components.miscNavItems Route.Misc url
            ]
        ]


mainNavSection : String -> List ( Route, String ) -> Route -> Url -> Html msg
mainNavSection title navItems route url =
    Html.div
        [ AHtml.class "main-nav__section" ]
        [ Html.header
            [ AHtml.class "main-nav__header" ]
            [ Html.a
                [ AHtml.href <| Route.toHref route ]
                [ Html.text title ]
            ]
        , nav navItems url
        ]


nav : List ( Route, String ) -> Url -> Html msg
nav items url =
    items
        |> List.map (navItem url)
        |> HtmlKeyed.ul [ AHtml.class "list" ]


navItem : Url -> ( Route, String ) -> ( String, Html msg )
navItem url ( route, text ) =
    let
        active =
            Route.fromUrl url == route
    in
    ( text
    , Html.li
        []
        [ Html.a
            [ AHtml.href <| Route.toHref route
            , AHtml.classList [ ( "active", active ) ]
            ]
            [ Html.text text ]
        ]
    )
