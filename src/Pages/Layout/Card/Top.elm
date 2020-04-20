module Pages.Layout.Card.Top exposing (Flags, Model, Msg, page)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import List
import Page exposing (Document, Page)
import Placeholders.Square exposing (Square)
import Styles.Layout.Card as CardStyles


type alias Flags =
    ()


type alias Model =
    {}


type Msg
    = NoOp


page : Page Flags Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    {}


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            {}


view : Model -> Document Msg
view model =
    { title = "Card | Layout | Elm CSS Patterns"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Card layout" ]
            ]
        , Html.div
            [ Html.class "content" ]
            [ List.range 1 12
                |> List.map cardItems
                |> Html.div
                    [ Html.css [ CardStyles.card ] ]
            ]
        , Html.div
            [ Html.class "code" ]
            [ Html.text "code"
            ]
        ]
    }


cardItems : Int -> Html Msg
cardItems _ =
    Html.div
        []
        [ Placeholders.Square.view Placeholders.Square.default ]

