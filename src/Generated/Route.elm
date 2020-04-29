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
    | Input_Top
    | Layout_Top
    | Navigation_Top
    | Input_CustomCheckbox_Top
    | Input_CustomRadio_Top
    | Input_Dropdown_Top
    | Input_RadioButtonGroup_Top
    | Layout_Card_Top
    | Layout_HolyGrail_Top
    | Layout_SameHeightColumns_Top
    | Layout_Sidebar_Top
    | Layout_SplitScreen_Top
    | Layout_StickyFooter_Top
    | Layout_StickyHeader_Top
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
        , Parser.map Input_Top (Parser.s "input")
        , Parser.map Layout_Top (Parser.s "layout")
        , Parser.map Navigation_Top (Parser.s "navigation")
        , Parser.map Input_CustomCheckbox_Top (Parser.s "input" </> Parser.s "custom-checkbox")
        , Parser.map Input_CustomRadio_Top (Parser.s "input" </> Parser.s "custom-radio")
        , Parser.map Input_Dropdown_Top (Parser.s "input" </> Parser.s "dropdown")
        , Parser.map Input_RadioButtonGroup_Top (Parser.s "input" </> Parser.s "radio-button-group")
        , Parser.map Layout_Card_Top (Parser.s "layout" </> Parser.s "card")
        , Parser.map Layout_HolyGrail_Top (Parser.s "layout" </> Parser.s "holy-grail")
        , Parser.map Layout_SameHeightColumns_Top (Parser.s "layout" </> Parser.s "same-height-columns")
        , Parser.map Layout_Sidebar_Top (Parser.s "layout" </> Parser.s "sidebar")
        , Parser.map Layout_SplitScreen_Top (Parser.s "layout" </> Parser.s "split-screen")
        , Parser.map Layout_StickyFooter_Top (Parser.s "layout" </> Parser.s "sticky-footer")
        , Parser.map Layout_StickyHeader_Top (Parser.s "layout" </> Parser.s "sticky-header")
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
                
                Input_Top ->
                    [ "input" ]
                
                Layout_Top ->
                    [ "layout" ]
                
                Navigation_Top ->
                    [ "navigation" ]
                
                Input_CustomCheckbox_Top ->
                    [ "input", "custom-checkbox" ]
                
                Input_CustomRadio_Top ->
                    [ "input", "custom-radio" ]
                
                Input_Dropdown_Top ->
                    [ "input", "dropdown" ]
                
                Input_RadioButtonGroup_Top ->
                    [ "input", "radio-button-group" ]
                
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