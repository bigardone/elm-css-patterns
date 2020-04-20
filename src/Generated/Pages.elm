module Generated.Pages exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Generated.Route as Route exposing (Route)
import Global
import Page exposing (Bundle, Document)
import Pages.Top
import Pages.NotFound
import Pages.Layout.Top
import Pages.Layout.Card.Top



-- TYPES


type Model
    = Top_Model Pages.Top.Model
    | NotFound_Model Pages.NotFound.Model
    | Layout_Top_Model Pages.Layout.Top.Model
    | Layout_Card_Top_Model Pages.Layout.Card.Top.Model


type Msg
    = Top_Msg Pages.Top.Msg
    | NotFound_Msg Pages.NotFound.Msg
    | Layout_Top_Msg Pages.Layout.Top.Msg
    | Layout_Card_Top_Msg Pages.Layout.Card.Top.Msg



-- PAGES


type alias UpgradedPage flags model msg =
    { init : flags -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
    , update : msg -> model -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
    , bundle : model -> Global.Model -> Bundle Msg
    }


type alias UpgradedPages =
    { top : UpgradedPage Pages.Top.Flags Pages.Top.Model Pages.Top.Msg
    , notFound : UpgradedPage Pages.NotFound.Flags Pages.NotFound.Model Pages.NotFound.Msg
    , layout_top : UpgradedPage Pages.Layout.Top.Flags Pages.Layout.Top.Model Pages.Layout.Top.Msg
    , layout_card_top : UpgradedPage Pages.Layout.Card.Top.Flags Pages.Layout.Card.Top.Model Pages.Layout.Card.Top.Msg
    }


pages : UpgradedPages
pages =
    { top = Pages.Top.page |> Page.upgrade Top_Model Top_Msg
    , notFound = Pages.NotFound.page |> Page.upgrade NotFound_Model NotFound_Msg
    , layout_top = Pages.Layout.Top.page |> Page.upgrade Layout_Top_Model Layout_Top_Msg
    , layout_card_top = Pages.Layout.Card.Top.page |> Page.upgrade Layout_Card_Top_Model Layout_Card_Top_Msg
    }



-- INIT


init : Route -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
init route =
    case route of
        Route.Top ->
            pages.top.init ()
        
        Route.NotFound ->
            pages.notFound.init ()
        
        Route.Layout_Top ->
            pages.layout_top.init ()
        
        Route.Layout_Card_Top ->
            pages.layout_card_top.init ()



-- UPDATE


update : Msg -> Model -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( Top_Msg msg, Top_Model model ) ->
            pages.top.update msg model
        
        ( NotFound_Msg msg, NotFound_Model model ) ->
            pages.notFound.update msg model
        
        ( Layout_Top_Msg msg, Layout_Top_Model model ) ->
            pages.layout_top.update msg model
        
        ( Layout_Card_Top_Msg msg, Layout_Card_Top_Model model ) ->
            pages.layout_card_top.update msg model
        
        _ ->
            always ( bigModel, Cmd.none, Cmd.none )



-- BUNDLE - (view + subscriptions)


bundle : Model -> Global.Model -> Bundle Msg
bundle bigModel =
    case bigModel of
        Top_Model model ->
            pages.top.bundle model
        
        NotFound_Model model ->
            pages.notFound.bundle model
        
        Layout_Top_Model model ->
            pages.layout_top.bundle model
        
        Layout_Card_Top_Model model ->
            pages.layout_card_top.bundle model


view : Model -> Global.Model -> Document Msg
view model =
    bundle model >> .view


subscriptions : Model -> Global.Model -> Sub Msg
subscriptions model =
    bundle model >> .subscriptions