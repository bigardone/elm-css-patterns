module Pages.Layout.SplitScreen exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.SplitScreen as PageComponent
import Page
import Request exposing (Request)
import Shared
import View exposing (View)


page : Shared.Model -> Request -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type alias Msg =
    Never


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


view : Model -> View Msg
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
