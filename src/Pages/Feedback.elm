module Pages.Feedback exposing (view)

import Components
import Html.Styled as Html
import Html.Styled.Attributes as Html
import Html.Styled.Keyed
import View exposing (View)


view : View msg
view =
    { title = "Feedback"
    , body =
        [ Html.header
            [ Html.class "header" ]
            [ Html.h1
                []
                [ Html.text "Feedback" ]
            ]
        , Components.feedbackNavItems
            |> List.map Components.navItem
            |> Html.Styled.Keyed.ul [ Html.class "list" ]
        ]
    }
