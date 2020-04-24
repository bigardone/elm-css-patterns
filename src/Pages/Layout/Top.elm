module Pages.Layout.Top exposing
    ( Flags
    , Model
    , Msg
    , page
    )

import Components
import Generated.Route as Route
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
    { title = "Layout | Elm CSS Patterns"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Layout" ]
            ]
        , Components.layoutNav
        ]
    }
