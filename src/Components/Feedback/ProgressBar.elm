module Components.Feedback.ProgressBar exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { percentage : Int }


init : Int -> Model
init percentage =
    Model percentage



-- VIEW


view : Model -> Html msg
view { percentage } =
    Html.div
        [ Html.css css ]
        [ Html.div
            [ Html.class "progress-bar" ]
            [ Html.div
                [ Html.class "progress-bar__inner"
                , Html.style "width" <| String.fromInt percentage ++ "%"
                ]
                [ Html.text <| String.fromInt percentage ++ "%" ]
            ]
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
        [ Css.Global.selector ".progress-bar"
            [ Css.backgroundColor Colors.greyLighter
            , Css.borderRadius <| Css.px 9999
            , Css.width <| Css.pct 80
            , Css.Global.descendants
                [ Css.Global.selector ".progress-bar__inner"
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    , Css.backgroundColor Colors.blueLight
                    , Css.color Colors.white
                    , Css.borderRadius <| Css.px 9999
                    , Css.overflow Css.hidden
                    ]
                ]
            ]
        ]
    ]

