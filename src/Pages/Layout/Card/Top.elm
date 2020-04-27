module Pages.Layout.Card.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Layout.Card as PageComponent
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


view : Model -> Document Msg
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

