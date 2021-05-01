module Pages.Misc exposing (view)

import Components
import Html.Styled as Html
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import View exposing (View)


view : View msg
view =
    { title = "Misc"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Misc" ]
            ]
        , Components.miscNavItems
            |> List.map Components.navItem
            |> Html.Styled.Keyed.ul [ Html.class "list" ]
        ]
    }
