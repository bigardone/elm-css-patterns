module Pages.Layout.StickyHeader.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Layout.StickyHeader as PageComponent
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type alias Msg =
    Never


page : Page Flags Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { component = PageComponent.init
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


stickyHeader : Html msg
stickyHeader =
    Html.div
        []
        [ Html.header
            [ Html.css
                [ Css.position Css.sticky
                , Css.top <| Css.int 0
                ]
            ]
            []
        , Html.main_
            []
            []
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Sticky header | Layout"
    , body =
        { header = "Sticky header layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/StickyHeader.elm"
        }
            |> Components.pageBody
    }
