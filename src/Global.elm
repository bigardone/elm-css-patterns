module Global exposing
    ( Flags
    , Model
    , Msg
    , init
    , navigate
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Components
import Document exposing (Document)
import Generated.Route as Route exposing (Route)
import Task
import Url exposing (Url)



-- INIT


type alias Flags =
    ()


type alias Model =
    { flags : Flags
    , url : Url
    , key : Nav.Key
    , showSidebar : Bool
    }


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model
        flags
        url
        key
        False
    , Cmd.none
    )



-- UPDATE


type Msg
    = Navigate Route
    | ShowSidebar


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate route ->
            ( model
            , Nav.pushUrl model.key (Route.toHref route)
            )

        ShowSidebar ->
            ( { model | showSidebar = not model.showSidebar }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view :
    { page : Document msg
    , global : Model
    , toMsg : Msg -> msg
    }
    -> Document msg
view { page, global, toMsg } =
    let
        isTop =
            case Route.fromUrl global.url of
                Just Route.Top ->
                    True

                _ ->
                    False
    in
    Components.layout (toMsg ShowSidebar) { page = page, showSidebar = global.showSidebar, isTop = isTop }



-- COMMANDS


send : msg -> Cmd msg
send =
    Task.succeed >> Task.perform identity


navigate : Route -> Cmd Msg
navigate route =
    send (Navigate route)
