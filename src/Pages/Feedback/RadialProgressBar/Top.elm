module Pages.Feedback.RadialProgressBar.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Feedback.RadialProgressBar as PageComponent
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


progressBar : Int -> Html msg
progressBar percentage =
    Html.div
        [ Html.css
            [ Css.position Css.relative ]
        ]
        [ Html.div
            [ Html.css
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.border3 (Css.px 12) Css.solid (Css.hex "efefef")
                , Css.borderRadius <| Css.px 9999
                , Css.height <| Css.px 128
                , Css.width <| Css.px 128
                ]
            ]
            [ Html.text <| String.fromInt percentage ++ "%" ]
        , Html.div
            [ Html.classList [ ( "progress-bar__inner--ge-50", percentage >= 50 ) ]
            , Html.css
                [ Css.position Css.absolute
                , Css.top Css.zero
                , Css.left Css.zero
                , Css.height <| Css.pct 100
                , Css.width <| Css.pct 100
                , Css.property "clip" "rect(0px, 128px, 128px, 64px)"
                , Css.Global.withClass "progress-bar__inner--ge-50"
                    [ Css.property "clip" "rect(auto, auto, auto, auto)" ]
                ]
            ]
            [ Html.div
                [ Html.css
                    [ Css.position Css.absolute
                    , Css.height <| Css.pct 100
                    , Css.width <| Css.pct 100
                    , Css.border3 (Css.px 12) Css.solid (Css.hex "8fbcbb")
                    , Css.borderRadius <| Css.px 9999
                    , Css.property "clip" "rect(0px, 64px, 128px, 0px)"
                    ]
                , Html.style "transform" <| "rotate(" ++ String.fromInt (percentage * 360 // 100) ++ "deg)"
                ]
                []
            , Html.div
                [ Html.classList [ ( "progress-bar__inner__2--ge-50", percentage >= 50 ) ]
                , Html.css
                    [ Css.position Css.absolute
                    , Css.height <| Css.pct 100
                    , Css.width <| Css.pct 100
                    , Css.border3 (Css.px 12) Css.solid ( Css.hex "8fbcbb" )
                    , Css.borderRadius <| Css.px 9999
                    , Css.property "clip" "rect(0px, 64px, 128px, 0px)"
                    , Css.transform <| Css.rotate <| Css.deg 0
                    , Css.Global.withClass "progress-bar__inner__2--ge-50"
                        [ Css.transform <| Css.rotate <| Css.deg 180 ]
                    ]
                ]
                []
            ]
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
    { title = "Radial progress bar | Feedback"
    , body =
        { header = "Radial progress bar feedback"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Feedback/RadialProgressBar.elm"
        }
            |> Components.pageBody
    }

