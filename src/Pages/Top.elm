module Pages.Top exposing
    ( Flags
    , Model
    , Msg
    , page
    )

import Generated.Route as Route exposing (Route)
import Html.Styled as Html
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    ()


type alias Msg =
    Never


page : Page Flags Model Msg
page =
    Page.static
        { view = view
        }


view : Document Msg
view =
    { title = "Home"
    , body =
        [ Html.header
            [ Html.class "top-header" ]
            [ Html.h1
                []
                [ Html.text "elm-css patterns" ]
            , Html.p
                [ Html.class "hero" ]
                [ Html.text "Common CSS patterns done in "
                , Html.a
                    [ Html.href "https://elm-lang.org/"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm" ]
                , Html.text " and "
                , Html.a
                    [ Html.href "https://github.com/rtfeldman/elm-css"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm-css" ]
                , Html.text "."
                , Html.br [] []
                , Html.text "Powered by "
                , Html.a
                    [ Html.href "https://github.com/ryannhg/elm-spa"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " elm-spa" ]
                , Html.text ". Inspired by "
                , Html.a
                    [ Html.href "https://github.com/phuoc-ng/csslayout"
                    , Html.target "_blank"
                    , Html.class "cool"
                    ]
                    [ Html.text " csslayout" ]
                , Html.text "."
                ]
            ]
        , Html.div
            [ Html.class "sections" ]
            [ Html.a
                [ Html.href <| Route.toHref Route.Layout_Top ]
                [ Html.text "Layout" ]
            , Html.a
                [ Html.href <| Route.toHref Route.Navigation_Top ]
                [ Html.text "Navigation" ]
            , Html.a
                [ Html.href <| Route.toHref Route.Input_Top ]
                [ Html.text "Input" ]
            ]
        ]
    }
