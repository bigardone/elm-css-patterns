module Pages.Layout.SplitScreen.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Block exposing (Block)
import Placeholders.Circle exposing (Circle)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Layout.SplitScreen as SplitScreenStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , block : Block
    , circle : Circle
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
    { block =
        Placeholders.Block.default
            |> Placeholders.Block.withBackgroundColor Colors.grey
    , circle =
        Placeholders.Circle.default
            |> Placeholders.Circle.withBackgroundColor Colors.grey
    , rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withHeight (Css.px 8)
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withWidth (Css.pct 80)
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


splitScreen : Html msg
splitScreen =
    Html.div
        [ Html.css
            [ Css.displayFlex ]
        ]
        [ Html.div
            [ Html.css
                [ Css.flex <| Css.int 1 ]
            ]
            []
        , Html.div
            [ Html.css
                [ Css.flex <| Css.int 1 ]
            ]
            []
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Split screen | Layout"
    , body =
        { header = "Split screen layout"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { block, circle, rectangle } =
    Html.div
        [ Html.css [ SplitScreenStyles.spliScreen ] ]
        [ Html.div
            []
            [ Html.div
                [ Html.class "inner-wrapper inner-wrapper--center" ]
                [ Placeholders.Circle.view circle
                , Placeholders.Rectangle.view rectangle
                ]
            ]
        , Html.div
            []
            [ Placeholders.Rectangle.view rectangle
            , List.range 1 6
                |> List.map (\_ -> Placeholders.Block.view block)
                |> Html.div
                    [ Html.class "inner-wrapper" ]
            ]
        ]
