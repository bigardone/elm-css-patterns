module Components.Misc.Timeline exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed as KHtml
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
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 2, 4, 2, 5 ]
    , circle =
        Placeholders.Circle.default
            |> Placeholders.Circle.withSize (Css.px 32)
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
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.div
            [ Html.class "timeline" ]
            [ Html.div
                [ Html.class "timeline__vertical-line" ]
                []
            , KHtml.node "div"
                []
                [ ( "item-1"
                  , Html.div
                        [ Html.class "timeline__item" ]
                        [ Html.header
                            [ Html.class "timeline__header" ]
                            [ Placeholders.Circle.view circle
                            , Placeholders.Rectangle.view rectangle
                            ]
                        , Html.div
                            [ Html.class "timeline__content" ]
                            [ Placeholders.Block.view block ]
                        ]
                  )
                , ( "item-2"
                  , Html.div
                        [ Html.class "timeline__item" ]
                        [ Html.header
                            [ Html.class "timeline__header" ]
                            [ Placeholders.Circle.view circle
                            , Placeholders.Rectangle.view rectangle
                            ]
                        , Html.div
                            [ Html.class "timeline__content" ]
                            [ Placeholders.Block.view block ]
                        ]
                  )
                , ( "item-3"
                  , Html.div
                        [ Html.class "timeline__item" ]
                        [ Html.header
                            [ Html.class "timeline__header" ]
                            [ Placeholders.Circle.view circle
                            , Placeholders.Rectangle.view rectangle
                            ]
                        , Html.div
                            [ Html.class "timeline__content" ]
                            [ Placeholders.Block.view block ]
                        ]
                  )
                ]
            ]
        ]



-- STYLES


css : List Css.Style
css =
    [ Css.displayFlex
    , Css.flexDirection Css.column
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.Global.descendants
        [ Css.Global.selector ".timeline"
            [ Css.position Css.relative
            , Css.width <| Css.pct 60
            ]
        , Css.Global.selector ".timeline__vertical-line"
            [ Css.borderRight3 (Css.px 2) Css.solid Colors.grey
            , Css.position Css.absolute
            , Css.top Css.zero
            , Css.left <| Css.px 16
            , Css.height <| Css.pct 100
            ]
        , Css.Global.selector ".timeline__item:not(:last-of-type)"
            [ Css.marginBottom <| Css.rem 1 ]
        , Css.Global.selector ".timeline__header"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.marginBottom <| Css.rem 0.5
            , Css.Global.children
                [ Css.Global.selector ".placeholder-rectangle"
                    [ Css.marginLeft <| Css.px 16
                    , Css.flex <| Css.int 1
                    ]
                ]
            ]
        , Css.Global.selector ".timeline__content"
            [ Css.marginLeft <| Css.px 48 ]
        ]
    ]
