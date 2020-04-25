module Pages.Navigation.Top exposing (Flags, Model, Msg, page)

import Components
import Html.Styled as Html
import Html.Styled.Attributes as Html
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
    { title = "Navigation | Elm CSS Patterns"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Navigation" ]
            ]
        , Components.navigationNav
        ]
    }

