module Components.Navigation.Breadcrumb exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
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
    }



-- VIEW


view : Model -> Html msg
view { rectangle } =
    Html.div
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.div
            [ Html.class "breadcrumb" ]
            [ Html.a
                [ Html.class "breadcrumb__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.a
                [ Html.class "breadcrumb__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.a
                [ Html.class "breadcrumb__item" ]
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
        [ Css.Global.selector ".breadcrumb"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        , Css.Global.selector ".breadcrumb__item"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.minWidth <| Css.rem 6
            ]
        , Css.Global.selector ".breadcrumb__item:not(:last-of-type)"
            [ Css.after
                [ Css.property "content" "\"/\""
                , Css.margin2 Css.zero (Css.em 0.5)
                ]
            ]
        ]
    ]
