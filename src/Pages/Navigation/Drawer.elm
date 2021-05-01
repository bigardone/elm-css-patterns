module Pages.Navigation.Drawer exposing (Model, Msg, page)

import Components
import Components.Navigation.Drawer as PageComponent
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


view : Model -> View Msg
view { code, component } =
    { title = "Drawer | Navigation"
    , body =
        { header = "Drawer navigation"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navigation/Drawer.elm"
        }
            |> Components.pageBody
    }
