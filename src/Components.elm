module Components exposing
    ( feedbackNavItems
    , inputNavItems
    , layoutNavItems
    , miscNavItems
    , navItem
    , navigationNavItems
    , pageBody
    )

import Assets
import Gen.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed as HtmlKeyed


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


layoutNavItems : List ( Route, String )
layoutNavItems =
    [ ( Route.Layout__Card, "Card" )
    , ( Route.Layout__HolyGrail, "Holy grail" )
    , ( Route.Layout__SameHeightColumns, "Same height columns" )
    , ( Route.Layout__Sidebar, "Sidebar" )
    , ( Route.Layout__SplitScreen, "Split screen" )
    , ( Route.Layout__StickyFooter, "Sticky footer" )
    , ( Route.Layout__StickyHeader, "Sticky header" )
    ]


navigationNavItems : List ( Route, String )
navigationNavItems =
    [ ( Route.Navigation__Breadcrumb, "Breadcrumb" )
    , ( Route.Navigation__Drawer, "Drawer" )
    , ( Route.Navigation__Pagination, "Pagination" )
    , ( Route.Navigation__Split, "Split navigation" )
    , ( Route.Navigation__Tab, "Tab" )
    ]


inputNavItems : List ( Route, String )
inputNavItems =
    [ ( Route.Input__CustomCheckbox, "Custom checkbox" )
    , ( Route.Input__CustomRadio, "Custom radio" )
    , ( Route.Input__Dropdown, "Dropdown" )
    , ( Route.Input__FloatingLabel, "Floating label" )
    , ( Route.Input__RadioButtonGroup, "Radio button group" )
    , ( Route.Input__Rating, "Rating" )
    , ( Route.Input__SearchBox, "Search box" )
    ]


feedbackNavItems : List ( Route, String )
feedbackNavItems =
    [ ( Route.Feedback__Loader, "Loader" )
    , ( Route.Feedback__Tooltip, "Tooltip" )
    , ( Route.Feedback__ProgressBar, "Progress bar" )
    , ( Route.Feedback__RadialProgressBar, "Radial progress bar" )
    ]


miscNavItems : List ( Route, String )
miscNavItems =
    [ ( Route.Misc__StickyColumnsTable, "Sticky columns table" )
    , ( Route.Misc__StickyHeadersTable, "Sticky headers table" )
    , ( Route.Misc__Timeline, "Timeline" )
    ]


navItem : ( Route, String ) -> ( String, Html msg )
navItem ( route, text ) =
    ( text
    , Html.li
        []
        [ Html.a
            [ Html.href <| Route.toHref route ]
            [ Html.text text ]
        ]
    )
