module Pages.Navigation.Pagination.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Navigation.Pagination as PageComponent
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


view : Model -> Document Msg
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

