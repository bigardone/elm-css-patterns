module Pages.Layout.Top exposing
    ( Flags
    , Model
    , Msg
    , page
    )

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
            []
            [ Html.h1
                []
                [ Html.text "Layout" ]
            ]
        , Html.a
            [ Html.href <| Route.toHref Route.Layout_Card_Top ]
            [ Html.text "Card" ]
        ]
    }
