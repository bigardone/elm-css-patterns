module Pages.Top exposing
    ( Flags
    , Model
    , Msg
    , page
    )

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
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Elm CSS patterns" ]
            ]
        , Html.p
            []
            [ Html.text "Common CSS patterns done in "
            , Html.a
                [ Html.href "https://elm-lang.org/"
                , Html.target "_blank"
                ]
                [ Html.text " elm " ]
            , Html.text " and "
            , Html.a
                [ Html.href "https://github.com/rtfeldman/elm-css"
                , Html.target "_blank"
                ]
                [ Html.text " elm-css" ]
            , Html.text ". Powered by "
            , Html.a
                [ Html.href "https://github.com/ryannhg/elm-spa"
                , Html.target "_blank"
                ]
                [ Html.text " elm-spa" ]
            , Html.text ". Inspired by "
            , Html.a
                [ Html.href "https://github.com/phuoc-ng/csslayout"
                , Html.target "_blank"
                ]
                [ Html.text " csslayout" ]
            , Html.text "."
            ]
        ]
    }
