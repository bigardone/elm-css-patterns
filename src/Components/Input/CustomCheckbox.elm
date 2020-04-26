module Components.Input.CustomCheckbox exposing
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
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { rectangle } =
    Html.div
        [ Html.css css
        ]
        [ List.range 1 3
            |> List.map (checkBoxView rectangle)
            |> Html.Styled.Keyed.node "div" []
        ]


checkBoxView : Rectangle -> Int -> ( String, Html msg )
checkBoxView rectangle index =
    let
        id =
            "customCheckbox" ++ String.fromInt index
    in
    ( id
    , Html.label
        [ Html.class "custom-checkbox"
        , Html.for id
        ]
        [ Html.input
            [ Html.type_ "checkbox"
            , Html.id id
            , Html.class "custom-checkbox__input"
            ]
            []
        , Html.div
            [ Html.class "custom-checkbox__icon" ]
            [ Html.div
                [ Html.class "custom-checkbox__inner-icon" ]
                []
            ]
        , Placeholders.Rectangle.view rectangle
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
        [ Css.Global.selector ".custom-checkbox"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.width <| Css.px 200
            , Css.cursor Css.pointer
            , Css.marginBottom <| Css.rem 1
            ]
        , Css.Global.selector ".custom-checkbox__input"
            [ Css.display Css.none
            , Css.checked
                [ Css.Global.generalSiblings
                    [ Css.Global.selector ".custom-checkbox__icon > .custom-checkbox__inner-icon"
                        [ Css.backgroundColor Colors.blue ]
                    ]
                ]
            ]
        , Css.Global.selector ".custom-checkbox__icon"
            [ Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.marginRight <| Css.rem 0.4
            , Css.padding <| Css.px 2
            ]
        , Css.Global.selector ".custom-checkbox__inner-icon"
            [ Css.borderRadius <| Css.px 4
            , Css.height <| Css.rem 0.8
            , Css.width <| Css.rem 0.8
            ]
        ]
    ]

