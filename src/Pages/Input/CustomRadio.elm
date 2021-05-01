module Pages.Input.CustomRadio exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Input.CustomRadio as PageComponent
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
    { component : PageComponent.Model
    , code : String
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


customRadio : Html msg
customRadio =
    Html.label
        [ Html.for "myCustomRadio"
        , Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.cursor Css.pointer
            ]
        ]
        [ Html.input
            [ Html.type_ "radio"
            , Html.id "myCustomRadio"
            , Html.css
                [ Css.display Css.none
                , Css.checked
                    [ Css.Global.generalSiblings
                        [ Css.Global.selector ".custom-radio__icon > .custom-radio__inner-icon"
                            [ Css.backgroundColor <| Css.hex "88c0d0" ]
                        ]
                    ]
                ]
            ]
            []
        , Html.div
            [ Html.class "custom-radio__icon"
            , Html.css
                [ Css.border3 (Css.px 1) Css.solid (Css.hex "EFEFEF")
                , Css.borderRadius <| Css.pct 100
                , Css.marginRight <| Css.rem 0.4
                , Css.padding <| Css.px 2
                ]
            ]
            [ Html.div
                [ Html.class "custom-radio__inner-icon"
                , Html.css
                    [ Css.borderRadius <| Css.pct 100
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
    { title = "Custom radio | Input"
    , body =
        { header = "Custom radio input"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/CustomRadio.elm"
        }
            |> Components.pageBody
    }
