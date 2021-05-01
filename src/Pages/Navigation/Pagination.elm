module Pages.Navigation.Pagination exposing (Model, Msg, page)

import Components
import Components.Navigation.Pagination as PageComponent
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


pagination : Html msg
pagination =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.border3 (Css.px 1) Css.solid (Css.hex "efefef")
            , Css.borderRadius <| Css.px 4
            ]
        ]
        [ Html.div
            [ Html.css
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.borderRight3 (Css.px 1) Css.solid (Css.hex "efefef")
                ]
            ]
            []

        ...

        -- Last item

        , Html.div
            [ Html.css
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.borderRight <| Css.px 0
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
    { title = "Pagination | Navigation"
    , body =
        { header = "Pagination navigation"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navigation/Pagination.elm"
        }
            |> Components.pageBody
    }
