module Components exposing
    ( feedbackNavItems
    , inputNavItems
    , layout
    , layoutNavItems
    , miscNavItems
    , navigationNavItems
    , pageBody
    )

import Assets
import Components.Feedback.Loader
import Components.Feedback.ProgressBar
import Components.Feedback.RadialProgressBar
import Components.Feedback.Tooltip
import Components.Input.CustomCheckbox
import Components.Input.CustomRadio
import Components.Input.Dropdown
import Components.Input.FloatingLabel
import Components.Input.RadioButtonGroup
import Components.Input.Rating
import Components.Input.SearchBox
import Components.Layout.Card
import Components.Layout.HolyGrail
import Components.Layout.SameHeightColumns
import Components.Layout.Sidebar
import Components.Layout.SplitScreen
import Components.Layout.StickyFooter
import Components.Layout.StickyHeader
import Components.Misc.StickyColumnsTable
import Components.Misc.StickyHeadersTable
import Components.Misc.Timeline
import Components.Navigation.Breadcrumb
import Components.Navigation.Drawer
import Components.Navigation.Pagination
import Components.Navigation.Split
import Components.Navigation.Tab
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
                    [ sidebar onShowSidebarClick showSidebar url
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


sidebar : msg -> Bool -> Url -> Html msg
sidebar onShowSidebarClick showSidebar url =
    Html.aside
        [ Html.classList
            [ ( "main-content__sidebar", True )
            , ( "show", showSidebar )
            ]
        ]
        [ Html.nav
            [ Html.class "main-nav" ]
            [ Html.span
                [ Html.class "close"
                , Html.onClick onShowSidebarClick
                ]
                [ Assets.closeIcon ]
            , mainNavSection "Layout" layoutNavItems Route.Layout_Top url
            , mainNavSection "Navigation" navigationNavItems Route.Navigation_Top url
            , mainNavSection "Input" inputNavItems Route.Input_Top url
            , mainNavSection "Feedback" feedbackNavItems Route.Feedback_Top url
            , mainNavSection "Misc" miscNavItems Route.Misc_Top url
            ]
        ]


mainNavSection : String -> List ( Route, String, Html msg ) -> Route -> Url -> Html msg
mainNavSection title navItems route url =
    Html.div
        [ Html.class "main-nav__section" ]
        [ Html.header
            [ Html.class "main-nav__header" ]
            [ Html.a
                [ Html.href <| Route.toHref route ]
                [ Html.text title ]
            ]
        , nav navItems url
        ]


nav : List ( Route, String, Html msg ) -> Url -> Html msg
nav items url =
    items
        |> List.map (navItem url)
        |> HtmlKeyed.ul [ Html.class "list" ]


navItem : Url -> ( Route, String, Html msg ) -> ( String, Html msg )
navItem url ( route, text, _ ) =
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


layoutNavItems : List ( Route, String, Html msg )
layoutNavItems =
    [ ( Route.Layout_Card_Top, "Card", Components.Layout.Card.view Components.Layout.Card.init )
    , ( Route.Layout_HolyGrail_Top, "Holy grail", Components.Layout.HolyGrail.view Components.Layout.HolyGrail.init )
    , ( Route.Layout_SameHeightColumns_Top, "Same height columns", Components.Layout.SameHeightColumns.view Components.Layout.SameHeightColumns.init )
    , ( Route.Layout_Sidebar_Top, "Sidebar", Components.Layout.Sidebar.view Components.Layout.Sidebar.init )
    , ( Route.Layout_SplitScreen_Top, "Split screen", Components.Layout.SplitScreen.view Components.Layout.SplitScreen.init )
    , ( Route.Layout_StickyFooter_Top, "Sticky footer", Components.Layout.StickyFooter.view Components.Layout.StickyFooter.init )
    , ( Route.Layout_StickyHeader_Top, "Sticky header", Components.Layout.StickyHeader.view Components.Layout.StickyHeader.init )
    ]


navigationNavItems : List ( Route, String, Html msg )
navigationNavItems =
    [ ( Route.Navigation_Breadcrumb_Top, "Breadcrumb", Components.Navigation.Breadcrumb.view Components.Navigation.Breadcrumb.init )
    , ( Route.Navigation_Drawer_Top, "Drawer", Components.Navigation.Drawer.view Components.Navigation.Drawer.init )
    , ( Route.Navigation_Pagination_Top, "Pagination", Components.Navigation.Pagination.view Components.Navigation.Pagination.init )
    , ( Route.Navigation_Split_Top, "Split navigation", Components.Navigation.Split.view Components.Navigation.Split.init )

    -- , ( Route.Navigation_Tab_Top, "Tab", Components.Navigation.Tab.view Components.Navigation.Tab.init )
    ]


inputNavItems : List ( Route, String, Html msg )
inputNavItems =
    [ ( Route.Input_CustomCheckbox_Top, "Custom checkbox", Components.Input.CustomCheckbox.view Components.Input.CustomCheckbox.init )
    , ( Route.Input_CustomRadio_Top, "Custom radio", Components.Input.CustomRadio.view Components.Input.CustomRadio.init )
    , ( Route.Input_Dropdown_Top, "Dropdown", Components.Input.Dropdown.view Components.Input.Dropdown.init )
    , ( Route.Input_FloatingLabel_Top, "Floating label", Components.Input.FloatingLabel.view Components.Input.FloatingLabel.init )
    , ( Route.Input_RadioButtonGroup_Top, "Radio button group", Components.Input.RadioButtonGroup.view Components.Input.RadioButtonGroup.init )

    -- , ( Route.Input_Rating_Top, "Rating", Components.Input.Rating.view Components.Input.Rating.init )
    , ( Route.Input_SearchBox_Top, "Search box", Components.Input.SearchBox.view Components.Input.SearchBox.init )
    ]


feedbackNavItems : List ( Route, String, Html msg )
feedbackNavItems =
    [ ( Route.Feedback_Loader_Top, "Loader", Components.Feedback.Loader.view Components.Feedback.Loader.init )
    , ( Route.Feedback_Tooltip_Top, "Tooltip", Components.Feedback.Tooltip.view Components.Feedback.Tooltip.init )
    , ( Route.Feedback_ProgressBar_Top, "Progress bar", Components.Feedback.ProgressBar.view <| Components.Feedback.ProgressBar.init 80 )
    , ( Route.Feedback_RadialProgressBar_Top, "Radial progress bar", Components.Feedback.RadialProgressBar.view <| Components.Feedback.RadialProgressBar.init 80 )
    ]


miscNavItems : List ( Route, String, Html msg )
miscNavItems =
    [ ( Route.Misc_StickyColumnsTable_Top, "Sticky columns table", Components.Misc.StickyColumnsTable.view Components.Misc.StickyColumnsTable.init )
    , ( Route.Misc_StickyHeadersTable_Top, "Sticky headers table", Components.Misc.StickyHeadersTable.view Components.Misc.StickyHeadersTable.init )
    , ( Route.Misc_Timeline_Top, "Timeline", Components.Misc.Timeline.view Components.Misc.Timeline.init )
    ]
