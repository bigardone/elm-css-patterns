module Pages.Navigation.Breadcrumb.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Navigation.Breadcrumb as PageComponent
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


breadcrumb : Html msg
breadcrumb =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.Global.descendants
                [  Css.Global.selector ".breadcrumb__item"
                    [ Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.minWidth <| Css.rem 6
                    ]
                , Css.Global.selector ".breadcrumb__item:not(:last-of-type)"
                    [ Css.after
                        [ Css.property "content" ""/""
                        , Css.margin2 Css.zero (Css.em 0.5)
                        ]
                    ]
                ]
            ]
        ]
        [ Html.a
            [ Html.class "breadcrumb__item" ]
            []
        , Html.a
            [ Html.class "breadcrumb__item" ]
            []
        , Html.a
            [ Html.class "breadcrumb__item" ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Breadcrumb | Navigation"
    , body =
        { header = "Breadcrumb navigation"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Navigation/Breadcrumb.elm"
        }
            |> Components.pageBody
    }

