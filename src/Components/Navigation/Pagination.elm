module Components.Navigation.Pagination exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Circle exposing (Circle)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { rectangle : Rectangle
    , circle : Circle
    }


init : Model
init =
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 12)
    , circle =
        Placeholders.Circle.default
            |> Placeholders.Circle.withBackgroundColor Colors.grey
            |> Placeholders.Circle.withSize (Css.px 12)
    }



-- VIEW


view : Model -> Html msg
view { circle, rectangle } =
    Html.div
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.div
            [ Html.class "pagination" ]
            [ Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Circle.view circle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Circle.view circle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Circle.view circle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Circle.view circle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Circle.view circle ]
            , Html.div
                [ Html.class "pagination__item" ]
                [ Placeholders.Rectangle.view rectangle ]
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
    , Css.Global.descendants
        [ Css.Global.selector ".pagination"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.Global.descendants
                [ Css.Global.selector ".pagination__item"
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    , Css.borderRight3 (Css.px 1) Css.solid Colors.grey
                    , Css.padding <| Css.rem 0.5
                    , Css.lastOfType
                        [ Css.borderRight <| Css.px 0 ]
                    ]
                , Css.Global.selector ".placeholder-rectangle"
                    [ Css.width <| Css.rem 5 ]
                ]
            ]
        ]
    ]
