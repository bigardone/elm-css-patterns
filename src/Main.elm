module Main exposing (main)

import Browser
import Browser.Navigation as Nav exposing (Key)
import Document
import Generated.Pages as Pages
import Generated.Route as Route exposing (Route)
import Global exposing (Flags)
import SmoothScroll
import Task
import Url exposing (Url)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }



-- INIT


type alias Flags =
    ()


type alias Model =
    { key : Key
    , url : Url
    , global : Global.Model
    , page : Pages.Model
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( global, globalCmd ) =
            Global.init flags url key

        ( page, pageCmd, pageGlobalCmd ) =
            Pages.init (fromUrl url) global
    in
    ( Model key url global page
    , Cmd.batch
        [ Cmd.map Global globalCmd
        , Cmd.map Global pageGlobalCmd
        , Cmd.map Page pageCmd
        ]
    )


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url
    | Global Global.Msg
    | Page Pages.Msg
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked (Browser.Internal url) ->
            ( model, Nav.pushUrl model.key (Url.toString url) )

        LinkClicked (Browser.External href) ->
            ( model, Nav.load href )

        UrlChanged url ->
            let
                global =
                    model.global

                ( page, pageCmd, globalCmd ) =
                    Pages.init (fromUrl url) model.global
            in
            ( { model | url = url, page = page, global = { global | url = url, showSidebar = False } }
            , Cmd.batch
                [ Cmd.map Page pageCmd
                , Cmd.map Global globalCmd
                , Task.attempt (always NoOp) (SmoothScroll.scrollTo "main")
                ]
            )

        Global globalMsg ->
            let
                ( global, globalCmd ) =
                    Global.update globalMsg model.global
            in
            ( { model | global = global }
            , Cmd.map Global globalCmd
            )

        Page pageMsg ->
            let
                ( page, pageCmd, globalCmd ) =
                    Pages.update pageMsg model.page model.global
            in
            ( { model | page = page }
            , Cmd.batch
                [ Cmd.map Page pageCmd
                , Cmd.map Global globalCmd
                ]
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ model.global
            |> Global.subscriptions
            |> Sub.map Global
        , model.page
            |> (\page -> Pages.subscriptions page model.global)
            |> Sub.map Page
        ]


view : Model -> Browser.Document Msg
view model =
    Document.toBrowserDocument <|
        Global.view
            { page = Pages.view model.page model.global |> Document.map Page
            , global = model.global
            , toMsg = Global
            }


fromUrl : Url -> Route
fromUrl =
    Route.fromUrl >> Maybe.withDefault Route.NotFound
