module Pages.Layout.HolyGrail.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Layout.HolyGrail as HolyGrailStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , leftBlock : Block
    , rightBlock : Block
    , mainBlock : Block
    , rectangle : Rectangle
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
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


holyGrail : Html msg
holyGrail =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.flexDirection Css.column
            ]
        ]
        [ Html.header
            []
            []
        , Html.main_
            [ Html.css
                [ Css.flexGrow <| Css.int 1
                , Css.displayFlex
                , Css.flexDirection Css.row
                ]
            ]
            [ Html.aside
                [ Html.css
                    [ Css.width <| Css.pct 25 ]
                ]
                []
            , Html.article
                [ Html.css
                    [ Css.flexGrow <| Css.int 1 ]
                ]
                []
            , Html.nav
                [ Html.css
                    [ Css.width <| Css.pct 20 ]
                ]
                []
            ]
        , Html.footer
            []
            []
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Holy grail | Layout | Elm CSS Patterns"
    , body =
        { header = "Holy grail layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { leftBlock, rightBlock, mainBlock, rectangle } =
    Html.div
        [ Html.css
            [ HolyGrailStyles.holyGrail ]
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

