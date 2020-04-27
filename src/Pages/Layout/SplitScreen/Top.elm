module Pages.Layout.SplitScreen.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Layout.SplitScreen as PageComponent
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


splitScreen : Html msg
splitScreen =
    Html.div
        [ Html.css
            [ Css.displayFlex ]
        ]
        [ Html.div
            [ Html.css
                [ Css.flex <| Css.int 1 ]
            ]
            []
        , Html.div
            [ Html.css
                [ Css.flex <| Css.int 1 ]
            ]
            []
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Split screen | Layout"
    , body =
        { header = "Split screen layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/SplitScreen.elm"
        }
            |> Components.pageBody
    }
