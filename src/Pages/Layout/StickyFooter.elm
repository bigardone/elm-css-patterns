module Pages.Layout.StickyFooter exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.StickyFooter as PageComponent
import Page
import Request exposing (Request)
import Shared
import View exposing (View)


page : Shared.Model -> Request -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type alias Msg =
    Never


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


view : Model -> View Msg
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
