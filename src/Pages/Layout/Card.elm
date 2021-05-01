module Pages.Layout.Card exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.Card as PageComponent
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


card : Html msg
card =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.flexWrap Css.wrap
            , Css.margin2 Css.zero (Css.px -8)
            ]
        ]
        [ Html.div
            [ Html.css
                [ Css.flexBasis <| Css.pct 25
                , Css.padding2 Css.zero (Css.px 8)
                ]
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
    { title = "Card | Layout"
    , body =
        { header = "Card layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/Card.elm"
        }
            |> Components.pageBody
    }
