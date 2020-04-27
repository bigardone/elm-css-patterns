module Components.Navigation.Tab exposing
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
        [ Html.css css ]
        [ Html.div
            [ Html.class "tabs" ]
            [ Html.div
                [ Html.class "tabs__item tabs__item--active" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.div
                [ Html.class "tabs__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.div
                [ Html.class "tabs__item" ]
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
        [ Css.Global.selector ".tabs"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        , Css.Global.selector ".tabs__item"
            [ Css.borderBottom3 (Css.px 1) Css.solid Colors.grey
            , Css.padding <| Css.rem 1
            , Css.width <| Css.rem 10
            ]
        , Css.Global.selector ".tabs__item--active"
            [ Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderBottomColor Css.transparent
            , Css.borderTopLeftRadius <| Css.px 2
            , Css.borderTopRightRadius <| Css.px 2
            ]
        ]
    ]
