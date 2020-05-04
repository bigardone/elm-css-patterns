module Components.Input.SearchBox exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Circle exposing (Circle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { circle : Circle }


init : Model
init =
    { circle =
        Placeholders.Circle.default
            |> Placeholders.Circle.withSize (Css.px 16)
            |> Placeholders.Circle.withBackgroundColor Colors.grey
    }



-- VIEW


view : Model -> Html msg
view { circle } =
    Html.div
        [ Html.css css ]
        [ Html.div
            [ Html.class "search-box" ]
            [ Placeholders.Circle.view circle
            , Html.input
                [ Html.class "search-box__input"
                , Html.placeholder "Search"
                , Html.autofocus True
                ]
                []
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
        [ Css.Global.selector ".search-box"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.padding <| Css.px 8
            , Css.borderRadius <| Css.px 4
            , Css.Global.descendants
                [ Css.Global.selector ".search-box__input"
                    [ Css.border <| Css.px 0
                    , Css.flex <| Css.int 1
                    , Css.paddingLeft <| Css.rem 0.5
                    , Css.outline Css.none
                    ]
                ]
            ]
        ]
    ]
