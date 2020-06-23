module Components.Misc.StickyHeadersTable exposing
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
        [ Html.css css
        , Html.class "component"
        ]
        [ Html.div
            [ Html.class "sticky-headers-table" ]
            [ Html.table
                [ Html.class "sticky-headers-table__table" ]
                [ Html.thead
                    []
                    [ List.range 1 4
                        |> List.map (thView rectangle)
                        |> Html.Styled.Keyed.node "tr" []
                    ]
                , List.range 1 10
                    |> List.map (trView rectangle)
                    |> Html.Styled.Keyed.node "tbody" []
                ]
            ]
        ]


thView : Rectangle -> Int -> ( String, Html msg )
thView rectangle index =
    ( "th_" ++ String.fromInt index
    , Html.th
        [ Html.class "sticky-headers-table__th" ]
        [ Placeholders.Rectangle.view rectangle ]
    )


trView : Rectangle -> Int -> ( String, Html msg )
trView rectangle index =
    ( "tr_" ++ String.fromInt index
    , Html.tr
        []
        [ Html.td
            [ Html.class "sticky-headers-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-headers-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-headers-table__td" ]
            [ Placeholders.Rectangle.view rectangle ]
        , Html.td
            [ Html.class "sticky-headers-table__td" ]
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
        [ Css.Global.selector ".sticky-headers-table"
            [ Css.width <| Css.pct 80
            , Css.height <| Css.pct 80
            , Css.border3 (Css.px 1) Css.solid Colors.greyLight
            , Css.overflow Css.auto
            ]
        , Css.Global.selector ".sticky-headers-table__table"
            [ Css.position Css.relative
            , Css.width <| Css.pct 100
            , Css.borderCollapse Css.collapse
            ]
        , Css.Global.selector ".sticky-headers-table__th"
            [ Css.padding <| Css.rem 1
            , Css.backgroundColor Colors.greyLighter
            , Css.position Css.sticky
            , Css.top Css.zero
            , Css.zIndex <| Css.int 9999
            ]
        , Css.Global.selector ".sticky-headers-table__td"
            [ Css.padding <| Css.rem 1
            , Css.borderTop3 (Css.px 1) Css.solid Colors.greyLight
            ]
        ]
    ]
