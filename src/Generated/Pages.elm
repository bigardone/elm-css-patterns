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
import Pages.Feedback.Top
import Pages.Input.Top
import Pages.Layout.Top
import Pages.Navigation.Top
import Pages.Feedback.Loader.Top
import Pages.Feedback.ProgressBar.Top
import Pages.Feedback.Tooltip.Top
import Pages.Input.CustomCheckbox.Top
import Pages.Input.CustomRadio.Top
import Pages.Input.Dropdown.Top
import Pages.Input.FloatingLabel.Top
import Pages.Input.RadioButtonGroup.Top
import Pages.Input.SearchBox.Top
import Pages.Layout.Card.Top
import Pages.Layout.HolyGrail.Top
import Pages.Layout.SameHeightColumns.Top
import Pages.Layout.Sidebar.Top
import Pages.Layout.SplitScreen.Top
import Pages.Layout.StickyFooter.Top
import Pages.Layout.StickyHeader.Top
import Pages.Navigation.Breadcrumb.Top
import Pages.Navigation.Drawer.Top
import Pages.Navigation.Pagination.Top
import Pages.Navigation.Split.Top
import Pages.Navigation.Tab.Top



-- TYPES


type Model
    = Top_Model Pages.Top.Model
    | NotFound_Model Pages.NotFound.Model
    | Feedback_Top_Model Pages.Feedback.Top.Model
    | Input_Top_Model Pages.Input.Top.Model
    | Layout_Top_Model Pages.Layout.Top.Model
    | Navigation_Top_Model Pages.Navigation.Top.Model
    | Feedback_Loader_Top_Model Pages.Feedback.Loader.Top.Model
    | Feedback_ProgressBar_Top_Model Pages.Feedback.ProgressBar.Top.Model
    | Feedback_Tooltip_Top_Model Pages.Feedback.Tooltip.Top.Model
    | Input_CustomCheckbox_Top_Model Pages.Input.CustomCheckbox.Top.Model
    | Input_CustomRadio_Top_Model Pages.Input.CustomRadio.Top.Model
    | Input_Dropdown_Top_Model Pages.Input.Dropdown.Top.Model
    | Input_FloatingLabel_Top_Model Pages.Input.FloatingLabel.Top.Model
    | Input_RadioButtonGroup_Top_Model Pages.Input.RadioButtonGroup.Top.Model
    | Input_SearchBox_Top_Model Pages.Input.SearchBox.Top.Model
    | Layout_Card_Top_Model Pages.Layout.Card.Top.Model
    | Layout_HolyGrail_Top_Model Pages.Layout.HolyGrail.Top.Model
    | Layout_SameHeightColumns_Top_Model Pages.Layout.SameHeightColumns.Top.Model
    | Layout_Sidebar_Top_Model Pages.Layout.Sidebar.Top.Model
    | Layout_SplitScreen_Top_Model Pages.Layout.SplitScreen.Top.Model
    | Layout_StickyFooter_Top_Model Pages.Layout.StickyFooter.Top.Model
    | Layout_StickyHeader_Top_Model Pages.Layout.StickyHeader.Top.Model
    | Navigation_Breadcrumb_Top_Model Pages.Navigation.Breadcrumb.Top.Model
    | Navigation_Drawer_Top_Model Pages.Navigation.Drawer.Top.Model
    | Navigation_Pagination_Top_Model Pages.Navigation.Pagination.Top.Model
    | Navigation_Split_Top_Model Pages.Navigation.Split.Top.Model
    | Navigation_Tab_Top_Model Pages.Navigation.Tab.Top.Model


type Msg
    = Top_Msg Pages.Top.Msg
    | NotFound_Msg Pages.NotFound.Msg
    | Feedback_Top_Msg Pages.Feedback.Top.Msg
    | Input_Top_Msg Pages.Input.Top.Msg
    | Layout_Top_Msg Pages.Layout.Top.Msg
    | Navigation_Top_Msg Pages.Navigation.Top.Msg
    | Feedback_Loader_Top_Msg Pages.Feedback.Loader.Top.Msg
    | Feedback_ProgressBar_Top_Msg Pages.Feedback.ProgressBar.Top.Msg
    | Feedback_Tooltip_Top_Msg Pages.Feedback.Tooltip.Top.Msg
    | Input_CustomCheckbox_Top_Msg Pages.Input.CustomCheckbox.Top.Msg
    | Input_CustomRadio_Top_Msg Pages.Input.CustomRadio.Top.Msg
    | Input_Dropdown_Top_Msg Pages.Input.Dropdown.Top.Msg
    | Input_FloatingLabel_Top_Msg Pages.Input.FloatingLabel.Top.Msg
    | Input_RadioButtonGroup_Top_Msg Pages.Input.RadioButtonGroup.Top.Msg
    | Input_SearchBox_Top_Msg Pages.Input.SearchBox.Top.Msg
    | Layout_Card_Top_Msg Pages.Layout.Card.Top.Msg
    | Layout_HolyGrail_Top_Msg Pages.Layout.HolyGrail.Top.Msg
    | Layout_SameHeightColumns_Top_Msg Pages.Layout.SameHeightColumns.Top.Msg
    | Layout_Sidebar_Top_Msg Pages.Layout.Sidebar.Top.Msg
    | Layout_SplitScreen_Top_Msg Pages.Layout.SplitScreen.Top.Msg
    | Layout_StickyFooter_Top_Msg Pages.Layout.StickyFooter.Top.Msg
    | Layout_StickyHeader_Top_Msg Pages.Layout.StickyHeader.Top.Msg
    | Navigation_Breadcrumb_Top_Msg Pages.Navigation.Breadcrumb.Top.Msg
    | Navigation_Drawer_Top_Msg Pages.Navigation.Drawer.Top.Msg
    | Navigation_Pagination_Top_Msg Pages.Navigation.Pagination.Top.Msg
    | Navigation_Split_Top_Msg Pages.Navigation.Split.Top.Msg
    | Navigation_Tab_Top_Msg Pages.Navigation.Tab.Top.Msg



-- PAGES


type alias UpgradedPage flags model msg =
    { init : flags -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
    , update : msg -> model -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
    , bundle : model -> Global.Model -> Bundle Msg
    }


type alias UpgradedPages =
    { top : UpgradedPage Pages.Top.Flags Pages.Top.Model Pages.Top.Msg
    , notFound : UpgradedPage Pages.NotFound.Flags Pages.NotFound.Model Pages.NotFound.Msg
    , feedback_top : UpgradedPage Pages.Feedback.Top.Flags Pages.Feedback.Top.Model Pages.Feedback.Top.Msg
    , input_top : UpgradedPage Pages.Input.Top.Flags Pages.Input.Top.Model Pages.Input.Top.Msg
    , layout_top : UpgradedPage Pages.Layout.Top.Flags Pages.Layout.Top.Model Pages.Layout.Top.Msg
    , navigation_top : UpgradedPage Pages.Navigation.Top.Flags Pages.Navigation.Top.Model Pages.Navigation.Top.Msg
    , feedback_loader_top : UpgradedPage Pages.Feedback.Loader.Top.Flags Pages.Feedback.Loader.Top.Model Pages.Feedback.Loader.Top.Msg
    , feedback_progressBar_top : UpgradedPage Pages.Feedback.ProgressBar.Top.Flags Pages.Feedback.ProgressBar.Top.Model Pages.Feedback.ProgressBar.Top.Msg
    , feedback_tooltip_top : UpgradedPage Pages.Feedback.Tooltip.Top.Flags Pages.Feedback.Tooltip.Top.Model Pages.Feedback.Tooltip.Top.Msg
    , input_customCheckbox_top : UpgradedPage Pages.Input.CustomCheckbox.Top.Flags Pages.Input.CustomCheckbox.Top.Model Pages.Input.CustomCheckbox.Top.Msg
    , input_customRadio_top : UpgradedPage Pages.Input.CustomRadio.Top.Flags Pages.Input.CustomRadio.Top.Model Pages.Input.CustomRadio.Top.Msg
    , input_dropdown_top : UpgradedPage Pages.Input.Dropdown.Top.Flags Pages.Input.Dropdown.Top.Model Pages.Input.Dropdown.Top.Msg
    , input_floatingLabel_top : UpgradedPage Pages.Input.FloatingLabel.Top.Flags Pages.Input.FloatingLabel.Top.Model Pages.Input.FloatingLabel.Top.Msg
    , input_radioButtonGroup_top : UpgradedPage Pages.Input.RadioButtonGroup.Top.Flags Pages.Input.RadioButtonGroup.Top.Model Pages.Input.RadioButtonGroup.Top.Msg
    , input_searchBox_top : UpgradedPage Pages.Input.SearchBox.Top.Flags Pages.Input.SearchBox.Top.Model Pages.Input.SearchBox.Top.Msg
    , layout_card_top : UpgradedPage Pages.Layout.Card.Top.Flags Pages.Layout.Card.Top.Model Pages.Layout.Card.Top.Msg
    , layout_holyGrail_top : UpgradedPage Pages.Layout.HolyGrail.Top.Flags Pages.Layout.HolyGrail.Top.Model Pages.Layout.HolyGrail.Top.Msg
    , layout_sameHeightColumns_top : UpgradedPage Pages.Layout.SameHeightColumns.Top.Flags Pages.Layout.SameHeightColumns.Top.Model Pages.Layout.SameHeightColumns.Top.Msg
    , layout_sidebar_top : UpgradedPage Pages.Layout.Sidebar.Top.Flags Pages.Layout.Sidebar.Top.Model Pages.Layout.Sidebar.Top.Msg
    , layout_splitScreen_top : UpgradedPage Pages.Layout.SplitScreen.Top.Flags Pages.Layout.SplitScreen.Top.Model Pages.Layout.SplitScreen.Top.Msg
    , layout_stickyFooter_top : UpgradedPage Pages.Layout.StickyFooter.Top.Flags Pages.Layout.StickyFooter.Top.Model Pages.Layout.StickyFooter.Top.Msg
    , layout_stickyHeader_top : UpgradedPage Pages.Layout.StickyHeader.Top.Flags Pages.Layout.StickyHeader.Top.Model Pages.Layout.StickyHeader.Top.Msg
    , navigation_breadcrumb_top : UpgradedPage Pages.Navigation.Breadcrumb.Top.Flags Pages.Navigation.Breadcrumb.Top.Model Pages.Navigation.Breadcrumb.Top.Msg
    , navigation_drawer_top : UpgradedPage Pages.Navigation.Drawer.Top.Flags Pages.Navigation.Drawer.Top.Model Pages.Navigation.Drawer.Top.Msg
    , navigation_pagination_top : UpgradedPage Pages.Navigation.Pagination.Top.Flags Pages.Navigation.Pagination.Top.Model Pages.Navigation.Pagination.Top.Msg
    , navigation_split_top : UpgradedPage Pages.Navigation.Split.Top.Flags Pages.Navigation.Split.Top.Model Pages.Navigation.Split.Top.Msg
    , navigation_tab_top : UpgradedPage Pages.Navigation.Tab.Top.Flags Pages.Navigation.Tab.Top.Model Pages.Navigation.Tab.Top.Msg
    }


pages : UpgradedPages
pages =
    { top = Pages.Top.page |> Page.upgrade Top_Model Top_Msg
    , notFound = Pages.NotFound.page |> Page.upgrade NotFound_Model NotFound_Msg
    , feedback_top = Pages.Feedback.Top.page |> Page.upgrade Feedback_Top_Model Feedback_Top_Msg
    , input_top = Pages.Input.Top.page |> Page.upgrade Input_Top_Model Input_Top_Msg
    , layout_top = Pages.Layout.Top.page |> Page.upgrade Layout_Top_Model Layout_Top_Msg
    , navigation_top = Pages.Navigation.Top.page |> Page.upgrade Navigation_Top_Model Navigation_Top_Msg
    , feedback_loader_top = Pages.Feedback.Loader.Top.page |> Page.upgrade Feedback_Loader_Top_Model Feedback_Loader_Top_Msg
    , feedback_progressBar_top = Pages.Feedback.ProgressBar.Top.page |> Page.upgrade Feedback_ProgressBar_Top_Model Feedback_ProgressBar_Top_Msg
    , feedback_tooltip_top = Pages.Feedback.Tooltip.Top.page |> Page.upgrade Feedback_Tooltip_Top_Model Feedback_Tooltip_Top_Msg
    , input_customCheckbox_top = Pages.Input.CustomCheckbox.Top.page |> Page.upgrade Input_CustomCheckbox_Top_Model Input_CustomCheckbox_Top_Msg
    , input_customRadio_top = Pages.Input.CustomRadio.Top.page |> Page.upgrade Input_CustomRadio_Top_Model Input_CustomRadio_Top_Msg
    , input_dropdown_top = Pages.Input.Dropdown.Top.page |> Page.upgrade Input_Dropdown_Top_Model Input_Dropdown_Top_Msg
    , input_floatingLabel_top = Pages.Input.FloatingLabel.Top.page |> Page.upgrade Input_FloatingLabel_Top_Model Input_FloatingLabel_Top_Msg
    , input_radioButtonGroup_top = Pages.Input.RadioButtonGroup.Top.page |> Page.upgrade Input_RadioButtonGroup_Top_Model Input_RadioButtonGroup_Top_Msg
    , input_searchBox_top = Pages.Input.SearchBox.Top.page |> Page.upgrade Input_SearchBox_Top_Model Input_SearchBox_Top_Msg
    , layout_card_top = Pages.Layout.Card.Top.page |> Page.upgrade Layout_Card_Top_Model Layout_Card_Top_Msg
    , layout_holyGrail_top = Pages.Layout.HolyGrail.Top.page |> Page.upgrade Layout_HolyGrail_Top_Model Layout_HolyGrail_Top_Msg
    , layout_sameHeightColumns_top = Pages.Layout.SameHeightColumns.Top.page |> Page.upgrade Layout_SameHeightColumns_Top_Model Layout_SameHeightColumns_Top_Msg
    , layout_sidebar_top = Pages.Layout.Sidebar.Top.page |> Page.upgrade Layout_Sidebar_Top_Model Layout_Sidebar_Top_Msg
    , layout_splitScreen_top = Pages.Layout.SplitScreen.Top.page |> Page.upgrade Layout_SplitScreen_Top_Model Layout_SplitScreen_Top_Msg
    , layout_stickyFooter_top = Pages.Layout.StickyFooter.Top.page |> Page.upgrade Layout_StickyFooter_Top_Model Layout_StickyFooter_Top_Msg
    , layout_stickyHeader_top = Pages.Layout.StickyHeader.Top.page |> Page.upgrade Layout_StickyHeader_Top_Model Layout_StickyHeader_Top_Msg
    , navigation_breadcrumb_top = Pages.Navigation.Breadcrumb.Top.page |> Page.upgrade Navigation_Breadcrumb_Top_Model Navigation_Breadcrumb_Top_Msg
    , navigation_drawer_top = Pages.Navigation.Drawer.Top.page |> Page.upgrade Navigation_Drawer_Top_Model Navigation_Drawer_Top_Msg
    , navigation_pagination_top = Pages.Navigation.Pagination.Top.page |> Page.upgrade Navigation_Pagination_Top_Model Navigation_Pagination_Top_Msg
    , navigation_split_top = Pages.Navigation.Split.Top.page |> Page.upgrade Navigation_Split_Top_Model Navigation_Split_Top_Msg
    , navigation_tab_top = Pages.Navigation.Tab.Top.page |> Page.upgrade Navigation_Tab_Top_Model Navigation_Tab_Top_Msg
    }



-- INIT


init : Route -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
init route =
    case route of
        Route.Top ->
            pages.top.init ()
        
        Route.NotFound ->
            pages.notFound.init ()
        
        Route.Feedback_Top ->
            pages.feedback_top.init ()
        
        Route.Input_Top ->
            pages.input_top.init ()
        
        Route.Layout_Top ->
            pages.layout_top.init ()
        
        Route.Navigation_Top ->
            pages.navigation_top.init ()
        
        Route.Feedback_Loader_Top ->
            pages.feedback_loader_top.init ()
        
        Route.Feedback_ProgressBar_Top ->
            pages.feedback_progressBar_top.init ()
        
        Route.Feedback_Tooltip_Top ->
            pages.feedback_tooltip_top.init ()
        
        Route.Input_CustomCheckbox_Top ->
            pages.input_customCheckbox_top.init ()
        
        Route.Input_CustomRadio_Top ->
            pages.input_customRadio_top.init ()
        
        Route.Input_Dropdown_Top ->
            pages.input_dropdown_top.init ()
        
        Route.Input_FloatingLabel_Top ->
            pages.input_floatingLabel_top.init ()
        
        Route.Input_RadioButtonGroup_Top ->
            pages.input_radioButtonGroup_top.init ()
        
        Route.Input_SearchBox_Top ->
            pages.input_searchBox_top.init ()
        
        Route.Layout_Card_Top ->
            pages.layout_card_top.init ()
        
        Route.Layout_HolyGrail_Top ->
            pages.layout_holyGrail_top.init ()
        
        Route.Layout_SameHeightColumns_Top ->
            pages.layout_sameHeightColumns_top.init ()
        
        Route.Layout_Sidebar_Top ->
            pages.layout_sidebar_top.init ()
        
        Route.Layout_SplitScreen_Top ->
            pages.layout_splitScreen_top.init ()
        
        Route.Layout_StickyFooter_Top ->
            pages.layout_stickyFooter_top.init ()
        
        Route.Layout_StickyHeader_Top ->
            pages.layout_stickyHeader_top.init ()
        
        Route.Navigation_Breadcrumb_Top ->
            pages.navigation_breadcrumb_top.init ()
        
        Route.Navigation_Drawer_Top ->
            pages.navigation_drawer_top.init ()
        
        Route.Navigation_Pagination_Top ->
            pages.navigation_pagination_top.init ()
        
        Route.Navigation_Split_Top ->
            pages.navigation_split_top.init ()
        
        Route.Navigation_Tab_Top ->
            pages.navigation_tab_top.init ()



-- UPDATE


update : Msg -> Model -> Global.Model -> ( Model, Cmd Msg, Cmd Global.Msg )
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( Top_Msg msg, Top_Model model ) ->
            pages.top.update msg model
        
        ( NotFound_Msg msg, NotFound_Model model ) ->
            pages.notFound.update msg model
        
        ( Feedback_Top_Msg msg, Feedback_Top_Model model ) ->
            pages.feedback_top.update msg model
        
        ( Input_Top_Msg msg, Input_Top_Model model ) ->
            pages.input_top.update msg model
        
        ( Layout_Top_Msg msg, Layout_Top_Model model ) ->
            pages.layout_top.update msg model
        
        ( Navigation_Top_Msg msg, Navigation_Top_Model model ) ->
            pages.navigation_top.update msg model
        
        ( Feedback_Loader_Top_Msg msg, Feedback_Loader_Top_Model model ) ->
            pages.feedback_loader_top.update msg model
        
        ( Feedback_ProgressBar_Top_Msg msg, Feedback_ProgressBar_Top_Model model ) ->
            pages.feedback_progressBar_top.update msg model
        
        ( Feedback_Tooltip_Top_Msg msg, Feedback_Tooltip_Top_Model model ) ->
            pages.feedback_tooltip_top.update msg model
        
        ( Input_CustomCheckbox_Top_Msg msg, Input_CustomCheckbox_Top_Model model ) ->
            pages.input_customCheckbox_top.update msg model
        
        ( Input_CustomRadio_Top_Msg msg, Input_CustomRadio_Top_Model model ) ->
            pages.input_customRadio_top.update msg model
        
        ( Input_Dropdown_Top_Msg msg, Input_Dropdown_Top_Model model ) ->
            pages.input_dropdown_top.update msg model
        
        ( Input_FloatingLabel_Top_Msg msg, Input_FloatingLabel_Top_Model model ) ->
            pages.input_floatingLabel_top.update msg model
        
        ( Input_RadioButtonGroup_Top_Msg msg, Input_RadioButtonGroup_Top_Model model ) ->
            pages.input_radioButtonGroup_top.update msg model
        
        ( Input_SearchBox_Top_Msg msg, Input_SearchBox_Top_Model model ) ->
            pages.input_searchBox_top.update msg model
        
        ( Layout_Card_Top_Msg msg, Layout_Card_Top_Model model ) ->
            pages.layout_card_top.update msg model
        
        ( Layout_HolyGrail_Top_Msg msg, Layout_HolyGrail_Top_Model model ) ->
            pages.layout_holyGrail_top.update msg model
        
        ( Layout_SameHeightColumns_Top_Msg msg, Layout_SameHeightColumns_Top_Model model ) ->
            pages.layout_sameHeightColumns_top.update msg model
        
        ( Layout_Sidebar_Top_Msg msg, Layout_Sidebar_Top_Model model ) ->
            pages.layout_sidebar_top.update msg model
        
        ( Layout_SplitScreen_Top_Msg msg, Layout_SplitScreen_Top_Model model ) ->
            pages.layout_splitScreen_top.update msg model
        
        ( Layout_StickyFooter_Top_Msg msg, Layout_StickyFooter_Top_Model model ) ->
            pages.layout_stickyFooter_top.update msg model
        
        ( Layout_StickyHeader_Top_Msg msg, Layout_StickyHeader_Top_Model model ) ->
            pages.layout_stickyHeader_top.update msg model
        
        ( Navigation_Breadcrumb_Top_Msg msg, Navigation_Breadcrumb_Top_Model model ) ->
            pages.navigation_breadcrumb_top.update msg model
        
        ( Navigation_Drawer_Top_Msg msg, Navigation_Drawer_Top_Model model ) ->
            pages.navigation_drawer_top.update msg model
        
        ( Navigation_Pagination_Top_Msg msg, Navigation_Pagination_Top_Model model ) ->
            pages.navigation_pagination_top.update msg model
        
        ( Navigation_Split_Top_Msg msg, Navigation_Split_Top_Model model ) ->
            pages.navigation_split_top.update msg model
        
        ( Navigation_Tab_Top_Msg msg, Navigation_Tab_Top_Model model ) ->
            pages.navigation_tab_top.update msg model
        
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
        
        Feedback_Top_Model model ->
            pages.feedback_top.bundle model
        
        Input_Top_Model model ->
            pages.input_top.bundle model
        
        Layout_Top_Model model ->
            pages.layout_top.bundle model
        
        Navigation_Top_Model model ->
            pages.navigation_top.bundle model
        
        Feedback_Loader_Top_Model model ->
            pages.feedback_loader_top.bundle model
        
        Feedback_ProgressBar_Top_Model model ->
            pages.feedback_progressBar_top.bundle model
        
        Feedback_Tooltip_Top_Model model ->
            pages.feedback_tooltip_top.bundle model
        
        Input_CustomCheckbox_Top_Model model ->
            pages.input_customCheckbox_top.bundle model
        
        Input_CustomRadio_Top_Model model ->
            pages.input_customRadio_top.bundle model
        
        Input_Dropdown_Top_Model model ->
            pages.input_dropdown_top.bundle model
        
        Input_FloatingLabel_Top_Model model ->
            pages.input_floatingLabel_top.bundle model
        
        Input_RadioButtonGroup_Top_Model model ->
            pages.input_radioButtonGroup_top.bundle model
        
        Input_SearchBox_Top_Model model ->
            pages.input_searchBox_top.bundle model
        
        Layout_Card_Top_Model model ->
            pages.layout_card_top.bundle model
        
        Layout_HolyGrail_Top_Model model ->
            pages.layout_holyGrail_top.bundle model
        
        Layout_SameHeightColumns_Top_Model model ->
            pages.layout_sameHeightColumns_top.bundle model
        
        Layout_Sidebar_Top_Model model ->
            pages.layout_sidebar_top.bundle model
        
        Layout_SplitScreen_Top_Model model ->
            pages.layout_splitScreen_top.bundle model
        
        Layout_StickyFooter_Top_Model model ->
            pages.layout_stickyFooter_top.bundle model
        
        Layout_StickyHeader_Top_Model model ->
            pages.layout_stickyHeader_top.bundle model
        
        Navigation_Breadcrumb_Top_Model model ->
            pages.navigation_breadcrumb_top.bundle model
        
        Navigation_Drawer_Top_Model model ->
            pages.navigation_drawer_top.bundle model
        
        Navigation_Pagination_Top_Model model ->
            pages.navigation_pagination_top.bundle model
        
        Navigation_Split_Top_Model model ->
            pages.navigation_split_top.bundle model
        
        Navigation_Tab_Top_Model model ->
            pages.navigation_tab_top.bundle model


view : Model -> Global.Model -> Document Msg
view model =
    bundle model >> .view


subscriptions : Model -> Global.Model -> Sub Msg
subscriptions model =
    bundle model >> .subscriptions