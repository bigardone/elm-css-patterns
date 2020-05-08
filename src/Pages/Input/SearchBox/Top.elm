module Pages.Input.SearchBox.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Input.SearchBox as PageComponent
import Page exposing (Document, Page)


type alias Flags =
    ()


type alias Model =
    { code : String
    , component : PageComponent.Model
    }


type alias Msg =
    Never


page : Page Flags Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { component = PageComponent.init
    , code = """
import Css
import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


searchBox : Html msg
searchBox =
    Html.div
        [ Html.css
            [ Css.position Css.relative
            , Css.Global.descendants
                [ Css.Global.selector ".search-box__input:not(:placeholder-shown) + label"
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.border3 (Css.px 1) Css.solid (Css.hex "efefef")
                    , Css.padding <| Css.px 8
                    ]
                ]
            ]
        ]
        [ Html.input
            [ Html.class "search-box__input"
            , Html.placeholder "Search"
            , Html.css
                [ Css.border <| Css.px 0
                , Css.flex <| Css.int 1
                ]
            ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Search box | Input"
    , body =
        { header = "Search box input"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Input/SearchBox.elm"
        }
            |> Components.pageBody
    }

