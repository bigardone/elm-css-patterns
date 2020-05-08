module Pages.Input.Dropdown.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Input.Dropdown as PageComponent
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
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


tab : Html msg
tab =
    Html.div
        [ Html.css
            [ Css.position Css.relative
            , Css.hover
                [ Css.Global.descendants
                    [ Css.Global.selector ".dropdown__content"
                        [ Css.display Css.block ]
                    ]
                ]
            ]
        ]
        [ Html.button
            []
            []
        , Html.div
            [ Html.class "dropdown__content"
            , Html.css
                [ Css.backgrounColor <| Css.hex "FFFFFF"
                , Css.position Css.absolute
                , Css.top <| Css.pct 100
                , Css.display Css.none
                , Css.marginTop <| Css.px 2
                , Css.width <| Css.px 250
                , Css.zIndex <| Css.int 9999
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
    { title = "Dropdown | Input"
    , body =
        { header = "Dropdown input"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/Dropdown.elm"
        }
            |> Components.pageBody
    }

