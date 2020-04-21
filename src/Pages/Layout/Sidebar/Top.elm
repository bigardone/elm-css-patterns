module Pages.Layout.Sidebar.Top exposing (Flags, Model, Msg, page)

import Components
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import List
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Styles.Colors as Colors
import Styles.Layout.Sidebar as SidebarStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , block : Block
    , singleBlock : Block
    }


type alias Msg =
    ()


page : Page Flags Model Msg
page =
    Page.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { block =
            Placeholders.Block.default
                |> Placeholders.Block.withBackgroundColor Colors.grey
                |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
      , singleBlock =
            Placeholders.Block.default
                |> Placeholders.Block.withBackgroundColor Colors.grey
                |> Placeholders.Block.withItems [ 3 ]
      , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


sidebar : Html msg
sidebar =
    Html.div
        [ Html.css
            [ Css.displayFlex ]
        ]
        [ Html.aside
            [ Html.css
                [ Css.width <| Css.pct 30 ]
            ]
            []
        , Html.main_
            [ Html.css
                [ Css.flex <| Css.int 1
                , Css.overflow Css.auto
                ]
            ]
            []
        ]
      """
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update () model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Sidebar | Layout | Elm CSS Patterns"
    , body =
        { header = "Sidebar layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { block, singleBlock } =
    Html.div
        [ Html.css [ SidebarStyles.sidebar ] ]
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
