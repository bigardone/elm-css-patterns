module Components.Layout.HolyGrail exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { leftBlock : Block
    , rightBlock : Block
    , mainBlock : Block
    , rectangle : Rectangle
    }


init : Model
init =
    { leftBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 2, 1, 3, 2, 1, 3 ]
    , rightBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 2, 1, 3, 2 ]
    , mainBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    , rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { leftBlock, rightBlock, mainBlock, rectangle } =
    Html.div
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.header
            []
            [ Placeholders.Rectangle.view rectangle ]
        , Html.main_
            []
            [ Html.aside
                []
                [ Placeholders.Block.view leftBlock ]
            , List.range 1 3
                |> List.map (\_ -> Placeholders.Block.view mainBlock)
                |> Html.article []
            , Html.nav
                []
                [ Placeholders.Block.view rightBlock ]
            ]
        , Html.footer
            []
            [ Placeholders.Rectangle.view rectangle ]
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.flexDirection Css.column
    , Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.Global.descendants
        [ Css.Global.selector "> header"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.padding <| Css.rem 1
            , Css.borderBottom3 (Css.px 1) Css.solid Colors.greyLighter
            ]
        , Css.Global.selector "main"
            [ Css.flexGrow <| Css.int 1
            , Css.displayFlex
            , Css.flexDirection Css.row
            , Css.Global.descendants
                [ Css.Global.selector "> div"
                    [ Css.marginBottom <| Css.rem 1 ]
                ]
            ]
        , Css.Global.selector "article"
            [ Css.flexGrow <| Css.int 1
            , Css.padding <| Css.rem 1
            ]
        , Css.Global.selector "aside"
            [ Css.width <| Css.pct 25
            , Css.borderRight3 (Css.px 1) Css.solid Colors.greyLighter
            , Css.padding <| Css.rem 1
            ]
        , Css.Global.selector "nav"
            [ Css.width <| Css.pct 20
            , Css.borderLeft3 (Css.px 1) Css.solid Colors.greyLighter
            , Css.padding <| Css.rem 1
            ]
        , Css.Global.selector "> footer"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.padding <| Css.rem 1
            , Css.borderTop3 (Css.px 1) Css.solid Colors.greyLighter
            ]
        ]
    ]
