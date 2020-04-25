module Pages.Layout.StickyHeader.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Layout.StickyHeader as StickyHeaderStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , block : Block
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
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withItems [ 1, 2, 3, 2, 3, 4, 5, 2, 1, 2, 4, 2, 5, 3 ]
            |> Placeholders.Block.withBackgroundColor Colors.grey
    , rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


stickyHeader : Html msg
stickyHeader =
    Html.div
        []
        [ Html.header
            [ Html.css
                [ Css.position Css.sticky
                , Css.top <| Css.int 0
                ]
            ]
            []
        , Html.main_
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
    { title = "Sticky header | Layout"
    , body =
        { header = "Sticky header layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { block, rectangle } =
    Html.div
        [ Html.css
            [ StickyHeaderStyles.stickyHeader ]
        ]
        [ Html.header
            []
            [ Placeholders.Rectangle.view rectangle ]
        , List.range 1 6
            |> List.map (\_ -> Placeholders.Block.view block)
            |> Html.main_ []
        ]

