module Pages.Layout.Card.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import List
import Page exposing (Document, Page)
import Placeholders.Square exposing (Square)
import Styles.Colors as Colors
import Styles.Layout.Card as CardStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , square : Square
    }


type alias Msg =
    ()


page : Page Flags Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { square =
        Placeholders.Square.default
            |> Placeholders.Square.withBackgroundColor Colors.grey
            |> Placeholders.Square.withSize (Css.px 112)
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
view ({ code } as model) =
    { title = "Card | Layout | Elm CSS Patterns"
    , body =
        { header = "Card layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { square } =
    List.range 1 12
        |> List.map (cardItems square)
        |> Html.div
            [ Html.css [ CardStyles.card ] ]


cardItems : Square -> Int -> Html Msg
cardItems square _ =
    Html.div
        []
        [ Placeholders.Square.view square ]
