module Components.Layout.Sidebar exposing
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
    , singleBlock : Block
    }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    , singleBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 3 ]
    }



-- VIEW


view : Model -> Html msg
view { block, singleBlock } =
    Html.div
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.aside
            []
            [ Html.div
                []
                [ Placeholders.Block.view singleBlock
                , Placeholders.Block.view singleBlock
                , Placeholders.Block.view singleBlock
                ]
            , Html.div
                []
                [ Placeholders.Block.view singleBlock ]
            ]
        , List.range 1 6
            |> List.map (\_ -> Placeholders.Block.view block)
            |> Html.main_
                []
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.Global.descendants
        [ Css.Global.selector "aside"
            [ Css.width <| Css.pct 30
            , Css.padding <| Css.rem 1
            , Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
            , Css.displayFlex
            , Css.flexDirection Css.column
            , Css.justifyContent Css.spaceBetween
            ]
        , Css.Global.selector "main"
            [ Css.flex <| Css.int 1
            , Css.overflow Css.auto
            , Css.padding <| Css.rem 1
            , Css.Global.descendants
                [ Css.Global.selector "> div"
                    [ Css.marginBottom <| Css.rem 1 ]
                ]
            ]
        ]
    ]
