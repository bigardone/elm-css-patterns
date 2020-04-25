module Pages.Input.Dropdown.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Placeholders.Triangle exposing (Triangle)
import Styles.Colors as Colors
import Styles.Input.Dropdown as DropdownStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , rectangle : Rectangle
    , triangle : Triangle
    , block : Block
    , smallBlock : Block
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
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


tab : Html msg
tab =
    Html.div
        [ Html.css
            [ Css.position Css.relative
            , Css.hover
                [ Css.Global.descendants
                    [ Css.Global.selector ".dropdown__content"
                        [ Css.display Css.block ]
                    ]
                ]
            ]
        ]
        [ Html.button
            []
            []
        , Html.div
            [ Html.class "dropdown__content"
            , Html.css
                [ Css.backgrounColor <| Css.hex "FFFFFF"
                , Css.position Css.absolute
                , Css.top <| Css.pct 100
                , Css.display Css.none
                , Css.marginTop <| Css.px 2
                , Css.width <| Css.px 250
                , Css.zIndex <| Css.int 9999
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
    { title = "Dropdown | Input"
    , body =
        { header = "Dropdown input"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { rectangle, triangle, block, smallBlock } =
    Html.div
        [ Html.css
            [ DropdownStyles.dropdown ]
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

