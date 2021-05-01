module Pages.Input.RadioButtonGroup exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Input.RadioButtonGroup as PageComponent
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
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


radioButtonGroup : Html msg
radioButtonGroup =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.border3 (Css.px 1) Css.solid (Css.hex "efefef")
            , Css.borderRadius <| Css.px 4
            , Css.Global.descendants
                [ Css.Global.selector ".radio-button:not(:last-of-type)"
                    [ Css.borderRight3 (Css.px 1) Css.solid (Css.hex "efefef") ]
                ]
            ]
        ]
        [ Html.div
            [ Html.css
                [ Css.displayFlex
                , Css.flex <| Css.int 1
                ]
            , Html.class "radio-button"
            ]
            [ Html.input
                [ Html.type_ "radio"
                , Html.id "myCustomRadio"
                , Html.css
                    [ Css.display Css.none
                    , Css.checked
                        [ Css.Global.generalSiblings
                            [ Css.Global.selector ".radio-button__label"
                                [ Css.backgroundColor <| Css.hex "88c0d0" ]
                            ]
                        ]
                    ]
                ]
                []
            , Html.label
                [ Html.class "radio-button__label"
                , Html.for "myCustomRadioid"
                , Html.css
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    , Css.padding <| Css.rem 0.8
                    , Css.cursor Css.pointer
                    ]
                ]
                [ Placeholders.Rectangle.view rectangle ]
            ]
        , -- more radio buttons
        ]
"""
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> View Msg
view { code, component } =
    { title = "Radio button group | Input"
    , body =
        { header = "Radio button group"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/RadioButtonGroup.elm"
        }
            |> Components.pageBody
    }
