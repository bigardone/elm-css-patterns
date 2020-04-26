module Pages.Input.CustomRadio.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import List
import Page exposing (Document, Page)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Input.CustomRadio as CustomRadio


type alias Flags =
    ()


type alias Model =
    { code : String
    , rectangle : Rectangle
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
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    , code = """
import Css
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
                            [ Css.backgroundColor <| Css.hex "333333" ]
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
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Custom radio | Input"
    , body =
        { header = "Custom radio input"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { rectangle } =
    Html.div
        [ Html.css
            [ CustomRadio.customRadio ]
        ]
        [ List.range 1 3
            |> List.map (radioView rectangle)
            |> Html.Styled.Keyed.node "div" []
        ]


radioView : Rectangle -> Int -> ( String, Html msg )
radioView rectangle index =
    let
        id =
            "customRadio" ++ String.fromInt index
    in
    ( id
    , Html.label
        [ Html.class "custom-radio"
        , Html.for id
        ]
        [ Html.input
            [ Html.type_ "radio"
            , Html.id id
            , Html.class "custom-radio__input"
            , Html.name "radio"
            ]
            []
        , Html.div
            [ Html.class "custom-radio__icon" ]
            [ Html.div
                [ Html.class "custom-radio__inner-icon" ]
                []
            ]
        , Placeholders.Rectangle.view rectangle
        ]
    )

