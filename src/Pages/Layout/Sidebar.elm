module Pages.Layout.Sidebar exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.Sidebar as PageComponent
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


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> View Msg
view { code, component } =
    { title = "Sidebar | Layout"
    , body =
        { header = "Sidebar layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/Sidebar.elm"
        }
            |> Components.pageBody
    }
