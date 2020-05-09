module Components.Input.Rating exposing
    ( Model
    , Msg
    , init
    , update
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Events as Html
import Html.Styled.Keyed
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { score : Int }


init : Model
init =
    { score = 1 }



-- UPDATE


type Msg
    = OnStarClick Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnStarClick score ->
            { model | score = score }



-- VIEW


view : Model -> Html Msg
view { score } =
    Html.div
        [ Html.css css
        ]
        [ List.range 1 5
            |> List.reverse
            |> List.map (starView score)
            |> Html.Styled.Keyed.node "div" [ Html.class "rating" ]
        ]


starView : Int -> Int -> ( String, Html Msg )
starView index score =
    ( "star_" ++ String.fromInt index
    , Html.span
        [ Html.classList
            [ ( "rating__star", True )
            , ( "rating__star--active", index == score )
            ]
        , Html.onClick <| OnStarClick score
        ]
        [ Html.text "★" ]
    )



-- STYLES


css : List Css.Style
css =
    [ Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.displayFlex
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.flexDirection Css.column
    , Css.Global.descendants
        [ Css.Global.selector ".rating"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.flexDirection Css.rowReverse
            ]
        , Css.Global.selector ".rating__star"
            [ Css.backgroundColor Css.transparent
            , Css.color Colors.grey
            , Css.fontSize Css.larger
            , Css.cursor Css.pointer
            ]
        , Css.Global.selector ".rating__star:hover"
            [ Css.color Colors.blue ]
        , Css.Global.selector ".rating__star--active"
            [ Css.color Colors.blue ]
        , Css.Global.selector ".rating__star:hover ~ .rating__star"
            [ Css.color Colors.blue ]
        , Css.Global.selector ".rating__star--active ~ .rating__star"
            [ Css.color Colors.blue ]
        ]
    ]

