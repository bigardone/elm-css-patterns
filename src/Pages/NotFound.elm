module Pages.NotFound exposing (Flags, Model, Msg, page)

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
    { title = "Page not found"
    , body =
        [ Html.section
            [ Html.class "not-found" ]
            [ Html.h1
                []
                [ Html.text "404: Page not found" ]
            , Html.p
                [ Html.class "hero" ]
                [ Html.text "The pattern that you are looking for does not exist." ]
            ]
        ]
    }
