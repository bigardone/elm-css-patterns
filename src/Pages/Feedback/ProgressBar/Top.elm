module Pages.Feedback.ProgressBar.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Feedback.ProgressBar as PageComponent
import Page exposing (Document, Page)
import Time


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type Msg
    = Tick Time.Posix


page : Page Flags Model Msg
page =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { component = PageComponent.init 0
      , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


progressBar : Html msg
progressBar =
    Html.div
        [ Html.css
            [ Css.backgroundColor Colors.greyLighter
            , Css.borderRadius <| Css.px 9999
            ]
        ]
        [ Html.div
            [ Html.css
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.backgroundColor <| Css.hex "8fbcbb"
                , Css.color Colors.white
                , Css.borderRadius <| Css.px 9999
                , Css.overflow Css.hidden
                , Css.width <| Css.pct 50
                ]
            ]
            [ Html.text "50%" ]
        ]
  """
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ component } as model) =
    case msg of
        Tick _ ->
            let
                percentage =
                    if component.percentage < 100 then
                        component.percentage + 1

                    else
                        0
            in
            ( { model | component = { component | percentage = percentage } }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 100 Tick


view : Model -> Document Msg
view { code, component } =
    { title = "Progress bar | Feedback"
    , body =
        { header = "Progress bar feedback"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Feedback/ProgressBar.elm"
        }
            |> Components.pageBody
    }
