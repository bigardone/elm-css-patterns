module Components.Layout.SplitScreen exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Block exposing (Block)
import Placeholders.Circle exposing (Circle)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { block : Block
    , circle : Circle
    , rectangle : Rectangle
    }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
    , circle =
        Placeholders.Circle.default
            |> Placeholders.Circle.withBackgroundColor Colors.grey
    , rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { block, circle, rectangle } =
    Html.div
        [ Html.css css ]
        [ Html.div
            []
            [ Html.div
                [ Html.class "inner-wrapper inner-wrapper--center" ]
                [ Placeholders.Circle.view circle
                , Placeholders.Rectangle.view rectangle
                ]
            ]
        , Html.div
            []
            [ Placeholders.Rectangle.view rectangle
            , List.range 1 6
                |> List.map (\_ -> Placeholders.Block.view block)
                |> Html.div
                    [ Html.class "inner-wrapper" ]
            ]
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.Global.descendants
        [ Css.Global.selector "> div"
            [ Css.flex <| Css.int 1
            , Css.displayFlex
            , Css.flexDirection Css.column
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.padding <| Css.rem 1
            , Css.firstOfType
                [ Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
                ]
            ]
        , Css.Global.selector ".inner-wrapper"
            [ Css.width <| Css.pct 100
            , Css.Global.descendants
                [ Css.Global.selector "> div"
                    [ Css.marginBottom <| Css.rem 1 ]
                ]
            ]
        , Css.Global.selector ".inner-wrapper--center"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.flexDirection Css.column
            ]
        , Css.Global.selector ".placeholder-rectangle"
            [ Css.marginBottom <| Css.em 1 ]
        ]
    ]
