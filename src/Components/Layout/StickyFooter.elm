module Components.Layout.StickyFooter exposing
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
    { block : Block
    , rectangle : Rectangle
    }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
    , rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { block, rectangle } =
    Html.div
        [ Html.css css ]
        [ Html.header
            []
            [ Placeholders.Rectangle.view rectangle ]
        , List.range 1 3
            |> List.map (\_ -> Placeholders.Block.view block)
            |> Html.main_ []
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
            , Css.flexShrink <| Css.int 0
            , Css.alignItems Css.center
            , Css.padding <| Css.rem 1
            , Css.borderBottom3 (Css.px 1) Css.solid Colors.greyLighter
            ]
        , Css.Global.selector "main"
            [ Css.width <| Css.pct 100
            , Css.padding <| Css.rem 1
            , Css.overflow Css.auto
            , Css.flexGrow <| Css.int 1
            , Css.Global.descendants
                [ Css.Global.selector "> div"
                    [ Css.marginBottom <| Css.rem 1 ]
                ]
            ]
        , Css.Global.selector "> footer"
            [ Css.displayFlex
            , Css.flexShrink <| Css.int 0
            , Css.alignItems Css.center
            , Css.padding <| Css.rem 1
            , Css.borderTop3 (Css.px 1) Css.solid Colors.greyLighter
            ]
        ]
    ]
