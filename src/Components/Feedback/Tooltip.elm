module Components.Feedback.Tooltip exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Css.Transitions
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { rectangle : Rectangle
    , block : Block
    }


init : Model
init =
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
    , block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
    }



-- VIEW


view : Model -> Html msg
view { rectangle, block } =
    Html.div
        [ Html.class "component"
        , Html.css css
        ]
        [ Html.div
            [ Html.class "tooltip" ]
            [ Html.div
                [ Html.class "tooltip__content" ]
                [ Placeholders.Block.view block ]
            , Html.div
                [ Html.class "tooltip__trigger" ]
                [ Placeholders.Rectangle.view rectangle
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
        [ Css.Global.selector ".tooltip"
            [ Css.position Css.relative
            , Css.hover
                [ Css.Global.descendants
                    [ Css.Global.selector ".tooltip__content"
                        [ Css.opacity <| Css.num 1
                        , Css.pointerEventsAll
                        ]
                    ]
                ]
            ]
        , Css.Global.selector ".tooltip__content"
            [ Css.opacity Css.zero
            , Css.position Css.absolute
            , Css.backgroundColor Colors.blackLight
            , Css.width <| Css.px 200
            , Css.color Colors.white
            , Css.bottom <| Css.pct 100
            , Css.left <| Css.pct 50
            , Css.transform <| Css.translate2 (Css.pct -50) (Css.px -8)
            , Css.pointerEvents Css.none
            , Css.padding <| Css.rem 1
            , Css.borderRadius <| Css.px 4
            , Css.Transitions.transition
                [ Css.Transitions.opacity 200 ]
            , Css.after
                [ Css.property "content" "\" \""
                , Css.position Css.absolute
                , Css.border3 (Css.px 8) Css.solid Css.transparent
                , Css.borderTopColor Colors.blackLight
                , Css.bottom Css.zero
                , Css.left <| Css.pct 50
                , Css.transform <| Css.translate2 (Css.pct -50) (Css.px 16)
                , Css.height Css.zero
                , Css.width Css.zero
                , Css.Transitions.transition
                    [ Css.Transitions.opacity 200 ]
                ]
            ]
        , Css.Global.selector ".tooltip__trigger"
            [ Css.backgroundColor Colors.white
            , Css.padding <| Css.rem 1
            , Css.width <| Css.px 200
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            ]
        ]
    ]
