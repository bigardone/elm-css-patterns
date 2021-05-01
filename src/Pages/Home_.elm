module Pages.Home_ exposing (view)

import Components
import Gen.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import View exposing (View)


view : View msg
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
            [ patternSection "Layout" Components.layoutNavItems
            , patternSection "Navigation" Components.navigationNavItems
            , patternSection "Input" Components.inputNavItems
            , patternSection "Feedback" Components.feedbackNavItems
            , patternSection "Misc" Components.miscNavItems
            ]
        ]
    }


patternSection : String -> List ( Route, String ) -> Html msg
patternSection title items =
    Html.div
        [ Html.class "patterns__section" ]
        [ Html.header
            [ Html.class "patterns__header" ]
            [ Html.h3
                []
                [ Html.text title ]
            ]
        , items
            |> List.map navItem
            |> Html.Styled.Keyed.ul [ Html.class "list" ]
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
