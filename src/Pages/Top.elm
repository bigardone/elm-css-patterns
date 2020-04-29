module Pages.Top exposing
    ( Flags
    , Model
    , Msg
    , page
    )

import Components
import Generated.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    ()


type alias Msg =
    Never


page : Page Flags Model Msg
page =
    Page.static
        { view = view
        }


view : Document Msg
view =
    { title = "Home"
    , body =
        [ Html.header
            [ Html.class "top-header" ]
            [ Html.h1
                []
                [ Html.text "elm-css patterns" ]
            , Html.p
                [ Html.class "hero" ]
                [ Html.text "Common CSS patterns done in "
                , Html.a
                    [ Html.href "https://elm-lang.org/"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm" ]
                , Html.text " and "
                , Html.a
                    [ Html.href "https://github.com/rtfeldman/elm-css"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm-css" ]
                , Html.text "."
                ]
            ]
        , Html.div
            [ Html.class "patterns" ]
            [ Html.div
                [ Html.class "patterns__section" ]
                [ Html.h3
                    []
                    [ Html.text "Layout" ]
                , Components.layoutNavItems
                    |> List.map navItem
                    |> Html.Styled.Keyed.ul [ Html.class "list" ]
                ]
            , Html.div
                [ Html.class "patterns__section" ]
                [ Html.h3
                    []
                    [ Html.text "Navigation" ]
                , Components.navigationNavItems
                    |> List.map navItem
                    |> Html.Styled.Keyed.ul [ Html.class "list" ]
                ]
            , Html.div
                [ Html.class "patterns__section" ]
                [ Html.h3
                    []
                    [ Html.text "Input" ]
                , Components.inputNavItems
                    |> List.map navItem
                    |> Html.Styled.Keyed.ul [ Html.class "list" ]
                ]
            ]
        ]
    }


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
