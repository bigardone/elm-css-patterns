module Pages.Layout.Sidebar.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Layout.Sidebar as PageComponent
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


view : Model -> Document Msg
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

