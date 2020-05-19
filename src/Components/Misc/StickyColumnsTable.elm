module Components.Misc.StickyColumnsTable exposing
    ( Model
    , init
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import List
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
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    }



-- VIEW


view : Model -> Html msg
view { rectangle } =
    Html.div
        [ Html.css css ]
        [ Html.div
            [ Html.class "sticky-columns-table" ]
            [ Html.table
                [ Html.class "sticky-columns-table__table" ]
                [ List.range 1 5
                    |> List.map (trView rectangle)
                    |> Html.Styled.Keyed.node "tbody" []
                ]
            ]
        ]


trView : Rectangle -> Int -> ( String, Html msg )
trView rectangle index =
    ( "tr_" ++ String.fromInt index
    , Html.tr
        []
        [ Html.td
            [ Html.class "sticky-columns-table__th" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-columns-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        ]
    )



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
        [ Css.Global.selector ".sticky-columns-table"
            [ Css.width <| Css.px 550
            , Css.border3 (Css.px 1) Css.solid Colors.greyLight
            , Css.overflow Css.scroll
            , Css.position Css.relative
            , Breakpoints.small
                [ Css.width <| Css.px 250 ]
            ]
        , Css.Global.selector ".sticky-columns-table__table"
            [ Css.borderCollapse Css.collapse
            , Css.width <| Css.pct 100
            ]
        , Css.Global.selector ".sticky-columns-table__th"
            [ Css.padding <| Css.rem 1
            , Css.backgroundColor Colors.greyLighter
            , Css.position Css.sticky
            , Css.left Css.zero
            , Css.zIndex <| Css.int 9999
            ]
        , Css.Global.selector ".sticky-columns-table__td"
            [ Css.padding <| Css.rem 1 ]
        , Css.Global.selector ".placeholder-rectangle"
            [ Css.width <| Css.px 150
            , Breakpoints.small
                [ Css.width <| Css.px 50 ]
            ]
        ]
    ]
