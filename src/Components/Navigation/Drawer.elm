module Components.Navigation.Drawer exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Block exposing (Block)
import Styles.Breakpoints as Breakpoints
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { block : Block }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    }



-- VIEW


view : Model -> Html msg
view { block } =
    Html.div
        [ Html.css css ]
        [ Html.div
            [ Html.class "drawer__overlay" ]
            []
        , Html.div
            [ Html.class "drawer__content" ]
            [ Placeholders.Block.view block ]
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.position Css.relative
    , Css.Global.descendants
        [ Css.Global.selector ".drawer__overlay"
            [ Css.height <| Css.pct 100
            , Css.position Css.absolute
            , Css.left Css.zero
            , Css.top Css.zero
            , Css.backgroundColor Colors.black
            , Css.opacity <| Css.num 0.8
            , Css.width <| Css.pct 100
            ]
        , Css.Global.selector ".drawer__content"
            [ Css.height <| Css.pct 100
            , Css.position Css.absolute
            , Css.backgroundColor Colors.white
            , Css.left Css.zero
            , Css.top Css.zero
            , Css.padding <| Css.rem 1
            , Css.Global.descendants
                [ Css.Global.selector ".placeholder-block"
                    [ Css.marginBottom <| Css.rem 1
                    , Breakpoints.small
                        [ Css.marginBottom <| Css.rem 0.5 ]
                    ]
                ]
            , Breakpoints.small
                [ Css.width <| Css.pct 25 ]
            ]
        ]
    ]
