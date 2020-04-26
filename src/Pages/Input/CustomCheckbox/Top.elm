module Pages.Input.CustomCheckbox.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import List
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Rectangle exposing (Rectangle)
import Placeholders.Triangle exposing (Triangle)
import Styles.Colors as Colors
import Styles.Input.CustomCheckbox as CustomCheckbox


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
                            [ Css.backgroundColor <| Css.hex "333333" ]
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
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Custom checkbox | Input"
    , body =
        { header = "Custom checkbox input"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { rectangle } =
    Html.div
        [ Html.css
            [ CustomCheckbox.customCheckbox ]
        ]
        [ List.range 1 3
            |> List.map (checkBoxView rectangle)
            |> Html.Styled.Keyed.node "div" []
        ]


checkBoxView : Rectangle -> Int -> ( String, Html msg )
checkBoxView rectangle index =
    let
        id =
            "customCheckbox" ++ String.fromInt index
    in
    ( id
    , Html.label
        [ Html.class "custom-checkbox"
        , Html.for id
        ]
        [ Html.input
            [ Html.type_ "checkbox"
            , Html.id id
            , Html.class "custom-checkbox__input"
            ]
            []
        , Html.div
            [ Html.class "custom-checkbox__icon" ]
            [ Html.div
                [ Html.class "custom-checkbox__inner-icon" ]
                []
            ]
        , Placeholders.Rectangle.view rectangle
        ]
    )

