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
    | Layout_Top
    | Navigation_Top
    | Layout_Card_Top
    | Layout_HolyGrail_Top
    | Layout_Sidebar_Top
    | Layout_SplitScreen_Top
    | Layout_StickyFooter_Top
    | Layout_StickyHeader_Top
    | Navigation_Drawer_Top


fromUrl : Url -> Maybe Route
fromUrl =
    Parser.parse routes


routes : Parser (Route -> a) a
routes =
    Parser.oneOf
        [ Parser.map Top Parser.top
        , Parser.map NotFound (Parser.s "not-found")
        , Parser.map Layout_Top (Parser.s "layout")
        , Parser.map Navigation_Top (Parser.s "navigation")
        , Parser.map Layout_Card_Top (Parser.s "layout" </> Parser.s "card")
        , Parser.map Layout_HolyGrail_Top (Parser.s "layout" </> Parser.s "holy-grail")
        , Parser.map Layout_Sidebar_Top (Parser.s "layout" </> Parser.s "sidebar")
        , Parser.map Layout_SplitScreen_Top (Parser.s "layout" </> Parser.s "split-screen")
        , Parser.map Layout_StickyFooter_Top (Parser.s "layout" </> Parser.s "sticky-footer")
        , Parser.map Layout_StickyHeader_Top (Parser.s "layout" </> Parser.s "sticky-header")
        , Parser.map Navigation_Drawer_Top (Parser.s "navigation" </> Parser.s "drawer")
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
                
                Layout_Top ->
                    [ "layout" ]
                
                Navigation_Top ->
                    [ "navigation" ]
                
                Layout_Card_Top ->
                    [ "layout", "card" ]
                
                Layout_HolyGrail_Top ->
                    [ "layout", "holy-grail" ]
                
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
    in
    segments
        |> String.join "/"
        |> String.append "/"