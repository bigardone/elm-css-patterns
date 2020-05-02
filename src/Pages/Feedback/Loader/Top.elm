module Pages.Feedback.Loader.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Feedback.Loader as PageComponent
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
import Css.Animations
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


load : Css.Animations.Keyframes {}
load =
    Css.Animations.keyframes
        [ ( 0, [ Css.Animations.transform [ Css.rotate <| Css.deg 0 ] ] )
        , ( 100, [ Css.Animations.transform [ Css.rotate <| Css.deg 360 ] ] )
        ]


loader : Html msg
loader =
    Html.div
        [ Html.css
            [ Css.borderRadius <| Css.pct 50
            , Css.height <| Css.rem 5
            , Css.width <| Css.rem 5
            , Css.position Css.relative
            , Css.border3 (Css.rem 0.5) Css.solid (Css.hex "efefef")
            , Css.borderLeft3 (Css.rem 0.5) Css.solid (Css.hex "eeeeee")
            , Css.transform <| Css.translateZ Css.zero
            , Css.animationName load
            , Css.animationDuration <| Css.sec 1.1
            , Css.property "animation-timing-function" "linear"
            , Css.property "animation-iteration-count" "infinite"
            ]
        ]
        []
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Loader | Feedback"
    , body =
        { header = "Loader feedback"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Feedback/Loader.elm"
        }
            |> Components.pageBody
    }

