module Pages.Navigation.Tab.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Navigation.Tab as PageComponent
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
                [ Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderBottomColor Css.transparent
                , Css.borderTopLeftRadius <| Css.px 2
                , Css.borderTopRightRadius <| Css.px 2
                ]
            ]
            []

        -- Inactive tab

        , Html.div
            [ Html.css
                [ Css.borderBottom3 (Css.px 1) Css.solid Colors.grey ]
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
    { title = "Tab | Navigation"
    , body =
        { header = "Tab navigation"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navidation/Tab.elm"
        }
            |> Components.pageBody
    }
