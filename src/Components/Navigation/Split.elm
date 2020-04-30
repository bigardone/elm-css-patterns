module Components.Navigation.Split exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
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
            |> Placeholders.Rectangle.withHeight (Css.px 12)
    }



-- VIEW


view : Model -> Html msg
view { rectangle } =
    Html.div
        [ Html.css css ]
        [ Html.ul
            [ Html.class "navigation" ]
            [ Html.li
                [ Html.class "navigation__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.li
                [ Html.class "navigation__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.li
                [ Html.class "navigation__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.li
                [ Html.class "navigation__item" ]
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
        [ Css.Global.selector ".navigation"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.listStyle Css.none
            , Css.margin Css.zero
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.width <| Css.pct 80
            , Css.Global.descendants
                [ Css.Global.selector ".navigation__item"
                    [ Css.padding <| Css.rem 0.7
                    , Css.lastOfType
                        [ Css.marginLeft Css.auto ]
                    , Breakpoints.small
                        [ Css.padding <| Css.rem 0.3 ]
                    ]
                , Css.Global.selector ".placeholder-rectangle"
                    [ Css.width <| Css.rem 5
                    , Breakpoints.small
                        [ Css.width <| Css.rem 3 ]
                    ]
                ]
            ]
        ]
    ]
