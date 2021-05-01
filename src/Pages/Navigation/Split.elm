module Pages.Navigation.Split exposing
    ( Model
    , Msg
    , page
    )

import Components
import Components.Navigation.Split as PageComponent
import Page
import Request exposing (Request)
import Shared
import View exposing (View)


page : Shared.Model -> Request -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type alias Msg =
    Never


init : Model
init =
    { component = PageComponent.init
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


split : Html msg
split =
    Html.ul
        [ Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.listStyle Css.none
            , Css.margin Css.zero
            ]
        ]
        [ Html.li
            []
            []

        ...

        -- Last item

        , Html.li
            [ Html.css
                [ Css.marginLeft Css.auto ]
            ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> View Msg
view { code, component } =
    { title = "Split | Navigation"
    , body =
        { header = "Split navigation"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navigation/Split.elm"
        }
            |> Components.pageBody
    }
