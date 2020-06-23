module Components.Feedback.RadialProgressBar exposing
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
        [ Html.class "component"
        , Html.css css
        ]
        [ Html.div
            [ Html.class "progress-bar" ]
            [ Html.div
                [ Html.class "progress-bar__percentage" ]
                [ Html.text <| String.fromInt percentage ++ "%" ]
            , Html.div
                [ Html.classList
                    [ ( "progress-bar__inner", True )
                    , ( "progress-bar__inner--ge-50", percentage >= 50 )
                    ]
                ]
                [ Html.div
                    [ Html.class "progress-bar__inner__1"
                    , Html.style "transform" <| "rotate(" ++ String.fromInt (percentage * 360 // 100) ++ "deg)"
                    ]
                    []
                , Html.div
                    [ Html.classList
                        [ ( "progress-bar__inner__2", True )
                        , ( "progress-bar__inner__2--ge-50", percentage >= 50 )
                        ]
                    ]
                    []
                ]
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
            [ Css.position Css.relative
            , Css.Global.descendants
                [ Css.Global.selector ".progress-bar__percentage"
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    , Css.border3 (Css.px 12) Css.solid Colors.greyLighter
                    , Css.borderRadius <| Css.px 9999
                    , Css.height <| Css.px 128
                    , Css.width <| Css.px 128
                    ]
                , Css.Global.selector ".progress-bar__inner"
                    [ Css.position Css.absolute
                    , Css.top Css.zero
                    , Css.left Css.zero
                    , Css.height <| Css.pct 100
                    , Css.width <| Css.pct 100
                    , Css.property "clip" "rect(0px, 128px, 128px, 64px)"
                    , Css.Global.withClass "progress-bar__inner--ge-50"
                        [ Css.property "clip" "rect(auto, auto, auto, auto)" ]
                    ]
                , Css.Global.selector ".progress-bar__inner__1"
                    [ Css.position Css.absolute
                    , Css.height <| Css.pct 100
                    , Css.width <| Css.pct 100
                    , Css.border3 (Css.px 12) Css.solid Colors.blueLight
                    , Css.borderRadius <| Css.px 9999
                    , Css.property "clip" "rect(0px, 64px, 128px, 0px)"
                    ]
                , Css.Global.selector ".progress-bar__inner__2"
                    [ Css.position Css.absolute
                    , Css.height <| Css.pct 100
                    , Css.width <| Css.pct 100
                    , Css.border3 (Css.px 12) Css.solid Colors.blueLight
                    , Css.borderRadius <| Css.px 9999
                    , Css.property "clip" "rect(0px, 64px, 128px, 0px)"
                    , Css.transform <| Css.rotate <| Css.deg 0
                    , Css.Global.withClass "progress-bar__inner__2--ge-50"
                        [ Css.transform <| Css.rotate <| Css.deg 180 ]
                    ]
                ]
            ]
        ]
    ]
