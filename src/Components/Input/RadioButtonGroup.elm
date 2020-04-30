module Components.Input.RadioButtonGroup exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Breakpoints as Breakpoints
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { rectangle : Rectangle }


init : Model
init =
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { rectangle } =
    Html.div
        [ Html.css css ]
        [ List.range 1 3
            |> List.map (radioView rectangle)
            |> Html.Styled.Keyed.node "div"
                [ Html.class "radio-button-group" ]
        ]


radioView : Rectangle -> Int -> ( String, Html msg )
radioView rectangle index =
    let
        id =
            "radioButton" ++ String.fromInt index

        checked =
            index == 1
    in
    ( id
    , Html.div
        [ Html.class "radio-button" ]
        [ Html.input
            [ Html.type_ "radio"
            , Html.id id
            , Html.class "radio-button__input"
            , Html.name "radio"
            , Html.checked checked
            ]
            []
        , Html.label
            [ Html.class "radio-button__label"
            , Html.for id
            ]
            [ Placeholders.Rectangle.view rectangle ]
        ]
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
        [ Css.Global.selector ".radio-button-group"
            [ Css.displayFlex
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            ]
        , Css.Global.selector ".radio-button"
            [ Css.displayFlex
            , Css.flex <| Css.int 1
            ]
        , Css.Global.selector ".radio-button__label"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.flex <| Css.int 1
            , Css.padding <| Css.rem 0.8
            , Css.width <| Css.px 150
            , Css.cursor Css.pointer
            , Breakpoints.small
                [ Css.width <| Css.px 80 ]
            ]
        , Css.Global.selector ".radio-button:not(:last-of-type)"
            [ Css.borderRight3 (Css.px 1) Css.solid Colors.grey ]
        , Css.Global.selector ".radio-button__input"
            [ Css.display Css.none
            , Css.checked
                [ Css.Global.generalSiblings
                    [ Css.Global.selector ".radio-button__label"
                        [ Css.backgroundColor Colors.blue ]
                    ]
                ]
            ]
        ]
    ]
