module Pages.Navigation exposing (view)

import Components
import Html.Styled as Html
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import View exposing (View)


view : View msg
view =
    { title = "Navigation"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Navigation" ]
            ]
        , Components.navigationNavItems
            |> List.map Components.navItem
            |> Html.Styled.Keyed.ul [ Html.class "list" ]
        ]
    }
