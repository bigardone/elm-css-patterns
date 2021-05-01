module Pages.Layout.StickyHeader exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.StickyHeader as PageComponent
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


view : Model -> View Msg
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
