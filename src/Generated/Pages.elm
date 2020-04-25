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
import Pages.Navigation.Top
import Pages.Layout.Card.Top
import Pages.Layout.HolyGrail.Top
import Pages.Layout.Sidebar.Top
import Pages.Layout.SplitScreen.Top
import Pages.Layout.StickyFooter.Top
import Pages.Layout.StickyHeader.Top
import Pages.Navigation.Drawer.Top



-- TYPES


type Model
    = Top_Model Pages.Top.Model
    | NotFound_Model Pages.NotFound.Model
    | Layout_Top_Model Pages.Layout.Top.Model
    | Navigation_Top_Model Pages.Navigation.Top.Model
    | Layout_Card_Top_Model Pages.Layout.Card.Top.Model
    | Layout_HolyGrail_Top_Model Pages.Layout.HolyGrail.Top.Model
    | Layout_Sidebar_Top_Model Pages.Layout.Sidebar.Top.Model
    | Layout_SplitScreen_Top_Model Pages.Layout.SplitScreen.Top.Model
    | Layout_StickyFooter_Top_Model Pages.Layout.StickyFooter.Top.Model
    | Layout_StickyHeader_Top_Model Pages.Layout.StickyHeader.Top.Model
    | Navigation_Drawer_Top_Model Pages.Navigation.Drawer.Top.Model


type Msg
    = Top_Msg Pages.Top.Msg
    | NotFound_Msg Pages.NotFound.Msg
    | Layout_Top_Msg Pages.Layout.Top.Msg
    | Navigation_Top_Msg Pages.Navigation.Top.Msg
    | Layout_Card_Top_Msg Pages.Layout.Card.Top.Msg
    | Layout_HolyGrail_Top_Msg Pages.Layout.HolyGrail.Top.Msg
    | Layout_Sidebar_Top_Msg Pages.Layout.Sidebar.Top.Msg
    | Layout_SplitScreen_Top_Msg Pages.Layout.SplitScreen.Top.Msg
    | Layout_StickyFooter_Top_Msg Pages.Layout.StickyFooter.Top.Msg
    | Layout_StickyHeader_Top_Msg Pages.Layout.StickyHeader.Top.Msg
    | Navigation_Drawer_Top_Msg Pages.Navigation.Drawer.Top.Msg



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
    , navigation_top : UpgradedPage Pages.Navigation.Top.Flags Pages.Navigation.Top.Model Pages.Navigation.Top.Msg
    , layout_card_top : UpgradedPage Pages.Layout.Card.Top.Flags Pages.Layout.Card.Top.Model Pages.Layout.Card.Top.Msg
    , layout_holyGrail_top : UpgradedPage Pages.Layout.HolyGrail.Top.Flags Pages.Layout.HolyGrail.Top.Model Pages.Layout.HolyGrail.Top.Msg
    , layout_sidebar_top : UpgradedPage Pages.Layout.Sidebar.Top.Flags Pages.Layout.Sidebar.Top.Model Pages.Layout.Sidebar.Top.Msg
    , layout_splitScreen_top : UpgradedPage Pages.Layout.SplitScreen.Top.Flags Pages.Layout.SplitScreen.Top.Model Pages.Layout.SplitScreen.Top.Msg
    , layout_stickyFooter_top : UpgradedPage Pages.Layout.StickyFooter.Top.Flags Pages.Layout.StickyFooter.Top.Model Pages.Layout.StickyFooter.Top.Msg
    , layout_stickyHeader_top : UpgradedPage Pages.Layout.StickyHeader.Top.Flags Pages.Layout.StickyHeader.Top.Model Pages.Layout.StickyHeader.Top.Msg
    , navigation_drawer_top : UpgradedPage Pages.Navigation.Drawer.Top.Flags Pages.Navigation.Drawer.Top.Model Pages.Navigation.Drawer.Top.Msg
    }


pages : UpgradedPages
pages =
    { top = Pages.Top.page |> Page.upgrade Top_Model Top_Msg
    , notFound = Pages.NotFound.page |> Page.upgrade NotFound_Model NotFound_Msg
    , layout_top = Pages.Layout.Top.page |> Page.upgrade Layout_Top_Model Layout_Top_Msg
    , navigation_top = Pages.Navigation.Top.page |> Page.upgrade Navigation_Top_Model Navigation_Top_Msg
    , layout_card_top = Pages.Layout.Card.Top.page |> Page.upgrade Layout_Card_Top_Model Layout_Card_Top_Msg
    , layout_holyGrail_top = Pages.Layout.HolyGrail.Top.page |> Page.upgrade Layout_HolyGrail_Top_Model Layout_HolyGrail_Top_Msg
    , layout_sidebar_top = Pages.Layout.Sidebar.Top.page |> Page.upgrade Layout_Sidebar_Top_Model Layout_Sidebar_Top_Msg
    , layout_splitScreen_top = Pages.Layout.SplitScreen.Top.page |> Page.upgrade Layout_SplitScreen_Top_Model Layout_SplitScreen_Top_Msg
    , layout_stickyFooter_top = Pages.Layout.StickyFooter.Top.page |> Page.upgrade Layout_StickyFooter_Top_Model Layout_StickyFooter_Top_Msg
    , layout_stickyHeader_top = Pages.Layout.StickyHeader.Top.page |> Page.upgrade Layout_StickyHeader_Top_Model Layout_StickyHeader_Top_Msg
    , navigation_drawer_top = Pages.Navigation.Drawer.Top.page |> Page.upgrade Navigation_Drawer_Top_Model Navigation_Drawer_Top_Msg
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
        
        Route.Navigation_Top ->
            pages.navigation_top.init ()
        
        Route.Layout_Card_Top ->
            pages.layout_card_top.init ()
        
        Route.Layout_HolyGrail_Top ->
            pages.layout_holyGrail_top.init ()
        
        Route.Layout_Sidebar_Top ->
            pages.layout_sidebar_top.init ()
        
        Route.Layout_SplitScreen_Top ->
            pages.layout_splitScreen_top.init ()
        
        Route.Layout_StickyFooter_Top ->
            pages.layout_stickyFooter_top.init ()
        
        Route.Layout_StickyHeader_Top ->
            pages.layout_stickyHeader_top.init ()
        
        Route.Navigation_Drawer_Top ->
            pages.navigation_drawer_top.init ()



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
        
        ( Navigation_Top_Msg msg, Navigation_Top_Model model ) ->
            pages.navigation_top.update msg model
        
        ( Layout_Card_Top_Msg msg, Layout_Card_Top_Model model ) ->
            pages.layout_card_top.update msg model
        
        ( Layout_HolyGrail_Top_Msg msg, Layout_HolyGrail_Top_Model model ) ->
            pages.layout_holyGrail_top.update msg model
        
        ( Layout_Sidebar_Top_Msg msg, Layout_Sidebar_Top_Model model ) ->
            pages.layout_sidebar_top.update msg model
        
        ( Layout_SplitScreen_Top_Msg msg, Layout_SplitScreen_Top_Model model ) ->
            pages.layout_splitScreen_top.update msg model
        
        ( Layout_StickyFooter_Top_Msg msg, Layout_StickyFooter_Top_Model model ) ->
            pages.layout_stickyFooter_top.update msg model
        
        ( Layout_StickyHeader_Top_Msg msg, Layout_StickyHeader_Top_Model model ) ->
            pages.layout_stickyHeader_top.update msg model
        
        ( Navigation_Drawer_Top_Msg msg, Navigation_Drawer_Top_Model model ) ->
            pages.navigation_drawer_top.update msg model
        
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
        
        Navigation_Top_Model model ->
            pages.navigation_top.bundle model
        
        Layout_Card_Top_Model model ->
            pages.layout_card_top.bundle model
        
        Layout_HolyGrail_Top_Model model ->
            pages.layout_holyGrail_top.bundle model
        
        Layout_Sidebar_Top_Model model ->
            pages.layout_sidebar_top.bundle model
        
        Layout_SplitScreen_Top_Model model ->
            pages.layout_splitScreen_top.bundle model
        
        Layout_StickyFooter_Top_Model model ->
            pages.layout_stickyFooter_top.bundle model
        
        Layout_StickyHeader_Top_Model model ->
            pages.layout_stickyHeader_top.bundle model
        
        Navigation_Drawer_Top_Model model ->
            pages.navigation_drawer_top.bundle model


view : Model -> Global.Model -> Document Msg
view model =
    bundle model >> .view


subscriptions : Model -> Global.Model -> Sub Msg
subscriptions model =
    bundle model >> .subscriptions