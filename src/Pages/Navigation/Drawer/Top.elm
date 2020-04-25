module Pages.Navigation.Drawer.Top exposing (Flags, Model, Msg, page)

import Components
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import List
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Styles.Colors as Colors
import Styles.Navigation.Drawer as DrawerStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , block : Block
    }


type alias Msg =
    Never


page : Page Flags Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


drawer : Html msg
drawer =
    Html.div
        [ Html.css
            [ Css.width <| Css.pct 100
            , Css.height <| Css.pct 100
            , Css.position Css.fixed
            , Css.left Css.zero
            , Css.top Css.zero
            , Css.zIndex <| Css.int 9999
            ]
        [ Html.div
            [ Html.css
                [ Css.width <| Css.pct 100
                , Css.height <| Css.pct 100
                , Css.position Css.fixed
                , Css.left Css.zero
                , Css.top Css.zero
                , Css.zIndex <| Css.int -1
                , Css.backgroundColor <| Css.rgba 0 0 0 0.5
                ]
            []
        , Html.div
            [ Html.css
                [ Css.width <| Css.px 200
                , Css.height <| Css.pct 100
                , Css.position Css.fixed
                , Css.left Css.zero
                , Css.top Css.zero
                , Css.backgroundColor <| Css.hex "FFFFFF"
                ]
            ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Drawer | Navigation"
    , body =
        { header = "Drawer navigation"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { block } =
    Html.div
        [ Html.css
            [ DrawerStyles.drawer ]
        ]
        [ Html.div
            [ Html.class "drawer__overlay" ]
            []
        , Html.div
            [ Html.class "drawer__content" ]
            [ Placeholders.Block.view block ]
        ]

