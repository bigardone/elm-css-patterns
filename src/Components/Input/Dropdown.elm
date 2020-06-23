module Components.Input.Dropdown exposing
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
import Placeholders.Triangle exposing (Triangle)
import Styles.Colors as Colors



-- MODEL


type alias Model =
    { rectangle : Rectangle
    , triangle : Triangle
    , block : Block
    , smallBlock : Block
    }


init : Model
init =
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    , triangle =
        Placeholders.Triangle.default
            |> Placeholders.Triangle.withBottomCorner
            |> Placeholders.Triangle.withBackgroundColor Colors.grey
            |> Placeholders.Triangle.withSize (Css.px 8)
    , block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    , smallBlock =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 2, 1, 3, 2 ]
    }



-- VIEW


view : Model -> Html msg
view { rectangle, triangle, block, smallBlock } =
    Html.div
        [ Html.class "component"
        , Html.css css
        ]
        [ Html.div
            [ Html.class "dropdown" ]
            [ Html.div
                [ Html.class "button" ]
                [ Placeholders.Rectangle.view rectangle
                , Placeholders.Triangle.view triangle
                ]
            , Html.div
                [ Html.class "dropdown__content" ]
                [ Placeholders.Block.view smallBlock ]
            ]
        , Html.div
            [ Html.class "other-content" ]
            [ Placeholders.Block.view block ]
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
        [ Css.Global.selector ".dropdown"
            [ Css.position Css.relative
            , Css.marginBottom <| Css.rem 1
            , Css.hover
                [ Css.Global.descendants
                    [ Css.Global.selector ".dropdown__content"
                        [ Css.display Css.block ]
                    ]
                ]
            ]
        , Css.Global.selector ".button"
            [ Css.padding <| Css.rem 1
            , Css.width <| Css.px 200
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.spaceBetween
            , Css.borderRadius <| Css.px 4
            , Css.cursor Css.pointer
            ]
        , Css.Global.selector ".dropdown__content"
            [ Css.backgroundColor Colors.white
            , Css.padding <| Css.rem 1
            , Css.position Css.absolute
            , Css.top <| Css.pct 100
            , Css.right Css.zero
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.width <| Css.px 250
            , Css.marginTop <| Css.px 2
            , Css.display Css.none
            , Css.zIndex <| Css.int 9999
            ]
        , Css.Global.selector ".other-content"
            [ Css.width <| Css.pct 60 ]
        ]
    ]
