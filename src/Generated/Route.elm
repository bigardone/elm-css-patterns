module Generated.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Top
    | NotFound
    | Feedback_Top
    | Input_Top
    | Layout_Top
    | Navigation_Top
    | Feedback_Loader_Top
    | Feedback_ProgressBar_Top
    | Feedback_Tooltip_Top
    | Input_CustomCheckbox_Top
    | Input_CustomRadio_Top
    | Input_Dropdown_Top
    | Input_FloatingLabel_Top
    | Input_RadioButtonGroup_Top
    | Input_Rating_Top
    | Input_SearchBox_Top
    | Layout_Card_Top
    | Layout_HolyGrail_Top
    | Layout_SameHeightColumns_Top
    | Layout_Sidebar_Top
    | Layout_SplitScreen_Top
    | Layout_StickyFooter_Top
    | Layout_StickyHeader_Top
    | Navigation_Breadcrumb_Top
    | Navigation_Drawer_Top
    | Navigation_Pagination_Top
    | Navigation_Split_Top
    | Navigation_Tab_Top


fromUrl : Url -> Maybe Route
fromUrl =
    Parser.parse routes


routes : Parser (Route -> a) a
routes =
    Parser.oneOf
        [ Parser.map Top Parser.top
        , Parser.map NotFound (Parser.s "not-found")
        , Parser.map Feedback_Top (Parser.s "feedback")
        , Parser.map Input_Top (Parser.s "input")
        , Parser.map Layout_Top (Parser.s "layout")
        , Parser.map Navigation_Top (Parser.s "navigation")
        , Parser.map Feedback_Loader_Top (Parser.s "feedback" </> Parser.s "loader")
        , Parser.map Feedback_ProgressBar_Top (Parser.s "feedback" </> Parser.s "progress-bar")
        , Parser.map Feedback_Tooltip_Top (Parser.s "feedback" </> Parser.s "tooltip")
        , Parser.map Input_CustomCheckbox_Top (Parser.s "input" </> Parser.s "custom-checkbox")
        , Parser.map Input_CustomRadio_Top (Parser.s "input" </> Parser.s "custom-radio")
        , Parser.map Input_Dropdown_Top (Parser.s "input" </> Parser.s "dropdown")
        , Parser.map Input_FloatingLabel_Top (Parser.s "input" </> Parser.s "floating-label")
        , Parser.map Input_RadioButtonGroup_Top (Parser.s "input" </> Parser.s "radio-button-group")
        , Parser.map Input_Rating_Top (Parser.s "input" </> Parser.s "rating")
        , Parser.map Input_SearchBox_Top (Parser.s "input" </> Parser.s "search-box")
        , Parser.map Layout_Card_Top (Parser.s "layout" </> Parser.s "card")
        , Parser.map Layout_HolyGrail_Top (Parser.s "layout" </> Parser.s "holy-grail")
        , Parser.map Layout_SameHeightColumns_Top (Parser.s "layout" </> Parser.s "same-height-columns")
        , Parser.map Layout_Sidebar_Top (Parser.s "layout" </> Parser.s "sidebar")
        , Parser.map Layout_SplitScreen_Top (Parser.s "layout" </> Parser.s "split-screen")
        , Parser.map Layout_StickyFooter_Top (Parser.s "layout" </> Parser.s "sticky-footer")
        , Parser.map Layout_StickyHeader_Top (Parser.s "layout" </> Parser.s "sticky-header")
        , Parser.map Navigation_Breadcrumb_Top (Parser.s "navigation" </> Parser.s "breadcrumb")
        , Parser.map Navigation_Drawer_Top (Parser.s "navigation" </> Parser.s "drawer")
        , Parser.map Navigation_Pagination_Top (Parser.s "navigation" </> Parser.s "pagination")
        , Parser.map Navigation_Split_Top (Parser.s "navigation" </> Parser.s "split")
        , Parser.map Navigation_Tab_Top (Parser.s "navigation" </> Parser.s "tab")
        ]


toHref : Route -> String
toHref route =
    let
        segments : List String
        segments =
            case route of
                Top ->
                    []
                
                NotFound ->
                    [ "not-found" ]
                
                Feedback_Top ->
                    [ "feedback" ]
                
                Input_Top ->
                    [ "input" ]
                
                Layout_Top ->
                    [ "layout" ]
                
                Navigation_Top ->
                    [ "navigation" ]
                
                Feedback_Loader_Top ->
                    [ "feedback", "loader" ]
                
                Feedback_ProgressBar_Top ->
                    [ "feedback", "progress-bar" ]
                
                Feedback_Tooltip_Top ->
                    [ "feedback", "tooltip" ]
                
                Input_CustomCheckbox_Top ->
                    [ "input", "custom-checkbox" ]
                
                Input_CustomRadio_Top ->
                    [ "input", "custom-radio" ]
                
                Input_Dropdown_Top ->
                    [ "input", "dropdown" ]
                
                Input_FloatingLabel_Top ->
                    [ "input", "floating-label" ]
                
                Input_RadioButtonGroup_Top ->
                    [ "input", "radio-button-group" ]
                
                Input_Rating_Top ->
                    [ "input", "rating" ]
                
                Input_SearchBox_Top ->
                    [ "input", "search-box" ]
                
                Layout_Card_Top ->
                    [ "layout", "card" ]
                
                Layout_HolyGrail_Top ->
                    [ "layout", "holy-grail" ]
                
                Layout_SameHeightColumns_Top ->
                    [ "layout", "same-height-columns" ]
                
                Layout_Sidebar_Top ->
                    [ "layout", "sidebar" ]
                
                Layout_SplitScreen_Top ->
                    [ "layout", "split-screen" ]
                
                Layout_StickyFooter_Top ->
                    [ "layout", "sticky-footer" ]
                
                Layout_StickyHeader_Top ->
                    [ "layout", "sticky-header" ]
                
                Navigation_Breadcrumb_Top ->
                    [ "navigation", "breadcrumb" ]
                
                Navigation_Drawer_Top ->
                    [ "navigation", "drawer" ]
                
                Navigation_Pagination_Top ->
                    [ "navigation", "pagination" ]
                
                Navigation_Split_Top ->
                    [ "navigation", "split" ]
                
                Navigation_Tab_Top ->
                    [ "navigation", "tab" ]
    in
    segments
        |> String.join "/"
        |> String.append "/"