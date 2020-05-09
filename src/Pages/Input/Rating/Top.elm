module Pages.Input.Rating.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Input.Rating as PageComponent
import Html.Styled as Html
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type Msg
    = RatingMsg PageComponent.Msg


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
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed


rating : Int -> Html msg
rating score =
    List.range 1 5
        |> List.reverse
        |> List.map (starView score)
        |> Html.Styled.Keyed.node "div"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.flexDirection Css.rowReverse
            , Css.Global.descendants
                [ Css.Global.selector ".rating__star"
                    [ Css.backgroundColor Css.transparent
                    , Css.color (Css.hex "efefef")
                    , Css.cursor Css.pointer
                    ]
                , Css.Global.selector ".rating__star:hover"
                    [ Css.color (Css.hex "88c0d0") ]
                , Css.Global.selector ".rating__star:hover ~ .rating__star"
                    [ Css.color (Css.hex "88c0d0") ]
                ]
            ]


starView : Int -> Int -> ( String, Html Msg )
starView index score =
    ( "star_" ++ String.fromInt index
    , Html.span
        [ Html.class "rating__star" ]
        [ Html.text "★" ]
    )
      """
    }


update : Msg -> Model -> Model
update msg ({ component } as model) =
    case msg of
        RatingMsg subMsg ->
            let
                newComponent =
                    PageComponent.update subMsg component
            in
            { model | component = newComponent }


view : Model -> Document Msg
view { code, component } =
    { title = "Rating | Input"
    , body =
        { header = "Rating input"
        , content = PageComponent.view component |> Html.map RatingMsg
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/Rating.elm"
        }
            |> Components.pageBody
    }

