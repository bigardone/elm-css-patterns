module Pages.Input.CustomCheckbox exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Input.CustomCheckbox as PageComponent
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


customCheckbox : Html msg
customCheckbox =
    Html.label
        [ Html.for "myCustomCheckbox"
        , Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.cursor Css.pointer
            ]
        ]
        [ Html.input
            [ Html.type_ "checkbox"
            , Html.id "myCustomCheckbox"
            , Html.css
                [ Css.display Css.none
                , Css.checked
                    [ Css.Global.generalSiblings
                        [ Css.Global.selector ".custom-checkbox__icon > .custom-checkbox__inner-icon"
                            [ Css.backgroundColor <| Css.hex "88c0d0" ]
                        ]
                    ]
                ]
            ]
            []
        , Html.div
            [ Html.class "custom-checkbox__icon"
            , Html.css
                [ Css.border3 (Css.px 1) Css.solid (Css.hex "EFEFEF")
                , Css.borderRadius <| Css.px 4
                , Css.marginRight <| Css.rem 0.4
                , Css.padding <| Css.px 2
                ]
            ]
            [ Html.div
                [ Html.class "custom-checkbox__inner-icon"
                , Html.css
                    [ Css.borderRadius <| Css.px 4
                    , Css.height <| Css.rem 0.8
                    , Css.width <| Css.rem 0.8
                    ]
                ]
                []
            ]
        , Html.text "Some text"
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> View Msg
view { code, component } =
    { title = "Custom checkbox | Input"
    , body =
        { header = "Custom checkbox input"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/CustomCheckbox.elm"
        }
            |> Components.pageBody
    }
