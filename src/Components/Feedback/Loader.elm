module Components.Feedback.Loader exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Animations
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Styles.Colors as Colors



-- MODEL


type alias Model =
    ()


init : Model
init =
    ()



-- VIEW


view : Model -> Html msg
view _ =
    Html.div
        [ Html.class "component"
        , Html.css css
        ]
        [ Html.div
            [ Html.class "loader" ]
            []
        ]



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
        [ Css.Global.selector ".loader"
            [ Css.borderRadius <| Css.pct 50
            , Css.height <| Css.rem 5
            , Css.width <| Css.rem 5
            , Css.position Css.relative
            , Css.border3 (Css.rem 0.5) Css.solid Colors.greyLighter
            , Css.borderLeft3 (Css.rem 0.5) Css.solid Colors.grey
            , Css.transform <| Css.translateZ Css.zero
            , Css.animationName load
            , Css.animationDuration <| Css.sec 1.1
            , Css.property "animation-timing-function" "linear"
            , Css.property "animation-iteration-count" "infinite"
            ]
        ]
    ]


load : Css.Animations.Keyframes {}
load =
    Css.Animations.keyframes
        [ ( 0, [ Css.Animations.transform [ Css.rotate <| Css.deg 0 ] ] )
        , ( 100, [ Css.Animations.transform [ Css.rotate <| Css.deg 360 ] ] )
        ]
