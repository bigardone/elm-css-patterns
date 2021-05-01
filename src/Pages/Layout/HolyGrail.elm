module Pages.Layout.HolyGrail exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Layout.HolyGrail as PageComponent
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


view : Model -> View Msg
view { code, component } =
    { title = "Holy grail | Layout"
    , body =
        { header = "Holy grail layout"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Layout/HolyGrail.elm"
        }
            |> Components.pageBody
    }
