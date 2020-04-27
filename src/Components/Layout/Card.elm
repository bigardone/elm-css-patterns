module Components.Layout.Card exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import Placeholders.Square exposing (Square)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { square : Square }


init : Model
init =
    { square =
        Placeholders.Square.default
            |> Placeholders.Square.withBackgroundColor Colors.grey
            |> Placeholders.Square.withSize (Css.px 112)
    }



-- VIEW


view : Model -> Html msg
view { square } =
    List.range 1 12
        |> List.map (cardView square)
        |> Html.Styled.Keyed.node "div"
            [ Html.css css ]


cardView : Square -> Int -> ( String, Html msg )
cardView square index =
    ( "card" ++ String.fromInt index
    , Html.div
        []
        [ Placeholders.Square.view square ]
    )



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.flexWrap Css.wrap
    , Css.margin2 Css.zero (Css.px -8)
    , Css.width <| Css.pct 100
    , Css.paddingTop <| Css.rem 1
    , Css.Global.descendants
        [ Css.Global.selector "> div"
            [ Css.flexBasis <| Css.pct 25
            , Css.padding2 Css.zero (Css.px 8)
            , Css.marginBottom <| Css.rem 1
            ]
        , Css.Global.selector "> div > div"
            [ Css.width <| Css.pct 100
            ]
        ]
    ]
