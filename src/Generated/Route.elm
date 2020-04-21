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
    | Layout_Card_Top
    | Layout_Sidebar_Top
    | Layout_SplitScreen_Top


fromUrl : Url -> Maybe Route
fromUrl =
    Parser.parse routes


routes : Parser (Route -> a) a
routes =
    Parser.oneOf
        [ Parser.map Top Parser.top
        , Parser.map NotFound (Parser.s "not-found")
        , Parser.map Layout_Top (Parser.s "layout")
        , Parser.map Layout_Card_Top (Parser.s "layout" </> Parser.s "card")
        , Parser.map Layout_Sidebar_Top (Parser.s "layout" </> Parser.s "sidebar")
        , Parser.map Layout_SplitScreen_Top (Parser.s "layout" </> Parser.s "split-screen")
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
                
                Layout_Card_Top ->
                    [ "layout", "card" ]
                
                Layout_Sidebar_Top ->
                    [ "layout", "sidebar" ]
                
                Layout_SplitScreen_Top ->
                    [ "layout", "split-screen" ]
    in
    segments
        |> String.join "/"
        |> String.append "/"