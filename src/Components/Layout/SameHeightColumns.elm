module Components.Layout.SameHeightColumns exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Block exposing (Block)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { block : Block
    , smallBlock : Block
    , largeBlock : Block
    }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
    , smallBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 3 ]
    , largeBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    }



-- VIEW


view : Model -> Html msg
view { block, smallBlock, largeBlock } =
    Html.div
        [ Html.css css ]
        [ Html.div
            [ Html.class "equal-height" ]
            [ Html.div
                [ Html.class "equal-height__column" ]
                [ Placeholders.Block.view block ]
            , Html.div
                [ Html.class "equal-height__column" ]
                [ Placeholders.Block.view smallBlock ]
            , Html.div
                [ Html.class "equal-height__column" ]
                [ Placeholders.Block.view largeBlock ]
            ]
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.Global.descendants
        [ Css.Global.selector ".equal-height"
            [ Css.padding <| Css.rem 1
            , Css.displayFlex
            , Css.width <| Css.pct 100
            ]
        , Css.Global.selector ".equal-height__column"
            [ Css.flex <| Css.int 1
            , Css.margin2 Css.zero (Css.px 8)
            , Css.padding <| Css.rem 1
            , Css.border3 (Css.px 1) Css.solid Colors.greyLighter
            , Css.borderRadius <| Css.px 4
            ]
        , Css.Global.selector ".equal-height__column:not(:last-of-type)"
            [ Css.marginRight <| Css.rem 1 ]
        ]
    ]
