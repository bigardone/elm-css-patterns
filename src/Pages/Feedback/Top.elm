module Pages.Feedback.Top exposing (Flags, Model, Msg, page)

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
    { title = "Feedback"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Feedback" ]
            ]
        , Components.feedbackNavItems
            |> List.map navItem
            |> Html.Styled.Keyed.ul [ Html.class "list" ]
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

