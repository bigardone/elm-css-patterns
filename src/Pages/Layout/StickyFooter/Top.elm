module Pages.Layout.StickyFooter.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Layout.StickyFooter as StickyFooterStyles


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


stickyFooter : Html msg
stickyFooter =
    Html.div
      [ Html.css
          [ Css.displayFlex
          , Css.flexDirection Css.column
          , Css.height <| Css.pct 100
          ]
        ]
        [ Html.header
            [ Html.css
                [ Css.flexShrink <| Css.int 0 ]
            ]
            []
        , Html.main_
            [ Html.css
                [ Css.flexGrow <| Css.int 1 ]
            ]
            []
        , Html.footer
            [ Html.css
                [ Css.flexShrink <| Css.int 0 ]
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
    { title = "Sticky footer | Layout | Elm CSS Patterns"
    , body =
        { header = "Sticky footer layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { block, rectangle } =
    Html.div
        [ Html.css
            [ StickyFooterStyles.stickyFooter ]
        ]
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

