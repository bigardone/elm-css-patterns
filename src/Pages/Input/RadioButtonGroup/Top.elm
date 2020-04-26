module Pages.Input.RadioButtonGroup.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import List
import Page exposing (Document, Page)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Input.RadioButtonGroup as RadioButtonGroup


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


radioButtonGroup : Html msg
radioButtonGroup =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.border3 (Css.px 1) Css.solid Colors.grey
            , Css.borderRadius <| Css.px 4
            , Css.Global.descendants
                [ Css.Global.selector ".radio-button:not(:last-of-type)"
                    [ Css.borderRight3 (Css.px 1) Css.solid Colors.grey ]
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
                                [ Css.backgroundColor Colors.blue ]
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


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Radio button group | Input"
    , body =
        { header = "Radio button group"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { rectangle } =
    Html.div
        [ Html.css
            [ RadioButtonGroup.radioButtonGroup ]
        ]
        [ List.range 1 3
            |> List.map (radioView rectangle)
            |> Html.Styled.Keyed.node "div"
                [ Html.class "radio-button-group" ]
        ]


radioView : Rectangle -> Int -> ( String, Html msg )
radioView rectangle index =
    let
        id =
            "radioButton" ++ String.fromInt index

        checked =
            index == 1
    in
    ( id
    , Html.div
        [ Html.class "radio-button" ]
        [ Html.input
            [ Html.type_ "radio"
            , Html.id id
            , Html.class "radio-button__input"
            , Html.name "radio"
            , Html.checked checked
            ]
            []
        , Html.label
            [ Html.class "radio-button__label"
            , Html.for id
            ]
            [ Placeholders.Rectangle.view rectangle ]
        ]
    )

