module Components.Input.FloatingLabel exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Css.Transitions
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
            [ Html.class "floating-label" ]
            [ Html.input
                [ Html.class "floating-label__input"
                , Html.placeholder "Placeholder"
                , Html.autofocus True
                ]
                []
            , Html.label
                [ Html.class "floating-label__label" ]
                [ Html.text "Placeholder" ]
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
        [ Css.Global.selector ".floating-label"
            [ Css.position Css.relative
            , Css.Global.descendants
                [ Css.Global.selector ".floating-label__input"
                    [ Css.padding <| Css.px 8
                    , Css.borderRadius <| Css.px 4
                    , Css.border3 (Css.px 1) Css.solid Colors.grey
                    , Css.outline Css.none
                    ]
                , Css.Global.selector ".floating-label__input:not(:placeholder-shown) + label"
                    [ Css.backgroundColor Colors.white
                    , Css.transform <| Css.translate2 Css.zero (Css.pct -50)
                    , Css.opacity <| Css.num 1
                    ]
                , Css.Global.selector ".floating-label__label"
                    [ Css.position Css.absolute
                    , Css.left <| Css.px 8
                    , Css.top <| Css.px 0
                    , Css.opacity Css.zero
                    , Css.pointerEvents Css.none
                    , Css.Transitions.transition
                        [ Css.Transitions.opacity 200
                        , Css.Transitions.transform 200
                        ]
                    ]
                ]
            ]
        ]
    ]
