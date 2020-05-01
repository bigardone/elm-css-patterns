module Pages.Input.FloatingLabel.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Input.FloatingLabel as PageComponent
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


floatingLabel : Html msg
floatingLabel =
    Html.div
        [ Html.css
            [ Css.position Css.relative
            , Css.Global.descendants
                [ Css.Global.selector ".floating-label__input:not(:placeholder-shown) + label"
                    [ Css.backgroundColor Colors.white
                    , Css.transform <| Css.translate2 Css.zero (Css.pct -50)
                    , Css.opacity <| Css.num 1
                    ]
                ]
            ]
        ]
        [ Html.input
            [ Html.class "floating-label__input"
            , Html.placeholder "Placeholder"
            , Html.css
                [ Css.padding <| Css.px 8
                , Css.borderRadius <| Css.px 4
                , Css.border3 (Css.px 1) Css.solid Colors.grey
                ]
            ]
            []
        , Html.label
            [ Html.class "floating-label__label"
            , Html.css
                [ Css.position Css.absolute
                , Css.left <| Css.px 8
                , Css.top <| Css.px 0
                , Css.opacity Css.zero
                , Css.pointerEvents Css.none
                , Css.Transitions.transition
                    [ Css.Transitions.opacity 200
                    , Css.Transitions.transform 200
                    ]
                ]
            ]
            [ Html.text "Placeholder" ]
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Floating label | Input"
    , body =
        { header = "Floating label input"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/FloatingLabel.elm"
        }
            |> Components.pageBody
    }

