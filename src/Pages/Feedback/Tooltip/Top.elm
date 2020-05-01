module Pages.Feedback.Tooltip.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Feedback.Tooltip as PageComponent
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
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
    { component = PageComponent.init
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


tooltip : Html msg
tooltip =
    Html.div
        [ Html.css
            [ Css.position Css.relative
            , Css.hover
                [ Css.Global.descendants
                    [ Css.Global.selector ".tooltip__content"
                        [ Css.opacity <| Css.num 1
                        , Css.pointerEventsAll
                        ]
                    ]
                ]
            ]
        ]
        [ Html.div
            [ Html.class "tooltip__content"
            , Html.css
                [ Css.opacity Css.zero
                , Css.position Css.absolute
                , Css.backgroundColor <| Css.hex "333333"
                , Css.width <| Css.px 200
                , Css.color Colors.white
                , Css.bottom <| Css.pct 100
                , Css.left <| Css.pct 50
                , Css.transform <| Css.translate2 (Css.pct -50) (Css.px -8)
                , Css.after
                    [ Css.property "content" " "
                    , Css.position Css.absolute
                    , Css.border3 (Css.px 8) Css.solid Css.transparent
                    , Css.borderTopColor <| Css.hex "333333"
                    , Css.bottom Css.zero
                    , Css.left <| Css.pct 50
                    , Css.transform <| Css.translate2 (Css.pct -50) (Css.px 16)
                    , Css.height Css.zero
                    , Css.width Css.zero
                    ]
                ]
            ]
            [ Placeholders.Block.view block ]
        , Html.div
            [ Html.class "tooltip__trigger" ]
            [ Placeholders.Rectangle.view rectangle
            ]
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Tooltip | Feedback"
    , body =
        { header = "Tooltip feedback"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Feedback/Tooltip.elm"
        }
            |> Components.pageBody
    }

