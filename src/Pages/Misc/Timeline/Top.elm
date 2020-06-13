module Pages.Misc.Timeline.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Misc.Timeline as PageComponent
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
import Html.Styled.Keyed as KHtml


timeline : Html msg
timeline =
    Html.div
        [ Html.css
            [ Css.position Css.relative ]
        ]
        [ -- The vertical line
          Html.div
            [ Html.css
                [ Css.borderRight3 (Css.px 2) Css.solid (Css.hex "EFEFEF")
                , Css.position Css.absolute
                , Css.top Css.zero
                , Css.left <| Css.px 16
                , Css.height <| Css.pct 100
                ]
            ]
            []
        , KHtml.node "div"
            []
            [ ( "item-1"
              , Html.div
                    [ Html.css
                        [ Css.marginBottom <| Css.rem 1 ]
                    ]
                    [ Html.header
                        [ Html.css
                            [ Css.displayFlex
                            , Css.alignItems Css.center
                            , Css.marginBottom <| Css.rem 0.5
                            ]
                        ]
                        [ Placeholders.Circle.view circle
                        , Placeholders.Rectangle.view rectangle
                        ]
                    , Html.div
                        [ Html.css
                            [ Css.marginLeft <| Css.px 48 ]
                        ]
                        [ Placeholders.Block.view block ]
                    ]
              )

            -- More items
            ]
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Timeline | Misc"
    , body =
        { header = "Timeline"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Misc/Timeline.elm"
        }
            |> Components.pageBody
    }

