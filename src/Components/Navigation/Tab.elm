module Components.Navigation.Tab exposing
    ( Model
    , Msg
    , init
    , update
    , view
    )

import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Events as Html
import Html.Styled.Keyed
import List
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Breakpoints as Breakpoints
import Styles.Colors as Colors



-- MODEL


type TabItem
    = FirstItem
    | SecondItem
    | ThirdItem


type alias Model =
    { rectangle : Rectangle
    , selectedItem : TabItem
    }


init : Model
init =
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
    , selectedItem = FirstItem
    }



-- UPDATE


type Msg
    = OnTabClick TabItem


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnTabClick tabItem ->
            { model | selectedItem = tabItem }



-- VIEW


view : Model -> Html Msg
view { rectangle, selectedItem } =
    Html.div
        [ Html.css css
        , Html.class "component"
        ]
        [ [ FirstItem, SecondItem, ThirdItem ]
            |> List.indexedMap (itemView rectangle selectedItem)
            |> Html.Styled.Keyed.node "div"
                [ Html.class "tabs" ]
        ]


itemView : Rectangle -> TabItem -> Int -> TabItem -> ( String, Html Msg )
itemView rectangle selectedItem index item =
    ( "tab_" ++ String.fromInt index
    , Html.div
        [ Html.classList
            [ ( "tabs__item", True )
            , ( "tabs__item--active", item == selectedItem )
            ]
        , Html.onClick <| OnTabClick item
        ]
        [ Placeholders.Rectangle.view rectangle ]
    )



-- STYLES


css : List Css.Style
css =
    [ Css.width <| Css.pct 100
    , Css.height <| Css.px 400
    , Css.displayFlex
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.Global.descendants
        [ Css.Global.selector ".tabs"
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        , Css.Global.selector ".tabs__item"
            [ Css.borderBottom3 (Css.px 1) Css.solid Colors.grey
            , Css.padding <| Css.rem 1
            , Css.width <| Css.rem 10
            , Css.cursor Css.pointer
            , Breakpoints.small
                [ Css.width <| Css.rem 6 ]
            ]
        , Css.Global.selector ".tabs__item--active"
            [ Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderBottomColor Css.transparent
            , Css.borderTopLeftRadius <| Css.px 2
            , Css.borderTopRightRadius <| Css.px 2
            , Css.cursor Css.default
            ]
        ]
    ]
