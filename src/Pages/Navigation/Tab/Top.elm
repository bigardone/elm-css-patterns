module Pages.Navigation.Tab.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Navigation.Tab as PageComponent
import Html.Styled as Html
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type Msg
    = ComponentMsg PageComponent.Msg


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


tab : Html msg
tab =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        ]

        -- Actice tab

        [ Html.div
            [ Html.css
                [ Css.border3 (Css.px 1) Css.solid (Css.hex "efefef")
                , Css.borderBottomColor Css.transparent
                , Css.borderTopLeftRadius <| Css.px 2
                , Css.borderTopRightRadius <| Css.px 2
                ]
            ]
            []

        -- Inactive tab

        , Html.div
            [ Html.css
                [ Css.borderBottom3 (Css.px 1) Css.solid (Css.hex "efefef") ]
            ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update msg ({ component } as model) =
    case msg of
        ComponentMsg subMsg ->
            let
                newComponent =
                    PageComponent.update subMsg component
            in
            { model | component = newComponent }


view : Model -> Document Msg
view { code, component } =
    { title = "Tab | Navigation"
    , body =
        { header = "Tab navigation"
        , content = Html.map ComponentMsg <| PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navigation/Tab.elm"
        }
            |> Components.pageBody
    }
