module Components exposing (layout)

import Document exposing (Document)
import Generated.Route as Route
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Styles


layout : { page : Document msg } -> Document msg
layout { page } =
    { title = page.title
    , body =
        [ Html.main_
            [ Html.css Styles.mainContent ]
            [ sidebar
            , Html.div
                [ Html.class "main-content__body" ]
                [ Html.div
                    [ Html.class "inner" ]
                    page.body
                ]
            ]
        ]
    }


sidebar : Html msg
sidebar =
    Html.aside
        [ Html.class "main-content__sidebar" ]
        [ Html.div
            [ Html.class "inner" ]
            [ Html.div
                []
                [ Html.div
                    []
                    [ Html.a
                        [ Html.href (Route.toHref Route.Top) ]
                        [ Html.text "Elm CSS patterns" ]
                    ]
                , Html.nav
                    [ Html.class "main-nav" ]
                    [ Html.a
                        [ Html.href <| Route.toHref Route.Layout_Top ]
                        [ Html.text "Layout" ]
                    ]
                ]
            , Html.footer
                [ Html.class "main-content__footer" ]
                [ Html.text "built with elm ❤" ]
            ]
        ]
