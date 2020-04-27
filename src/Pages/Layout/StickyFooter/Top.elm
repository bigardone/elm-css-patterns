module Pages.Layout.StickyFooter.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Layout.StickyFooter as PageComponent
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
view { code, component } =
    { title = "Sticky footer | Layout"
    , body =
        { header = "Sticky footer layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/StickyFooter.elm"
        }
            |> Components.pageBody
    }
