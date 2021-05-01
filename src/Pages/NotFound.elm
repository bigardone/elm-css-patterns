module Pages.NotFound exposing (view)

import Html.Styled as Html
import Html.Styled.Attributes as Html
import View exposing (View)


view : View msg
view =
    { title = "Page not found"
    , body =
        [ Html.section
            [ Html.class "not-found" ]
            [ Html.h1
                []
                [ Html.text "404: Page not found" ]
            , Html.p
                [ Html.class "hero" ]
                [ Html.text "The pattern that you are looking for does not exist." ]
            ]
        ]
    }
