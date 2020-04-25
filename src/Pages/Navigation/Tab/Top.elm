module Pages.Navigation.Tab.Top exposing (Flags, Model, Msg, page)

import Components
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Page exposing (Document, Page)
import Placeholders.Rectangle exposing (Rectangle)
import Styles.Colors as Colors
import Styles.Navigation.Tab as TabStyles


type alias Flags =
    ()


type alias Model =
    { code : String
    , rectangle : Rectangle
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
    { rectangle =
        Placeholders.Rectangle.default
            |> Placeholders.Rectangle.withBackgroundColor Colors.grey
            |> Placeholders.Rectangle.withHeight (Css.px 4)
    , code = """
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


tab : Html msg
tab =
    Html.div
        [ Html.css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        ]

        -- Actice tab

        [ Html.div
            [ Html.css
                [ Css.border3 (Css.px 1) Css.solid Colors.grey
                , Css.borderBottomColor Css.transparent
                , Css.borderTopLeftRadius <| Css.px 2
                , Css.borderTopRightRadius <| Css.px 2
                ]
            ]
            []

        -- Inactive tab

        , Html.div
            [ Html.css
                [ Css.borderBottom3 (Css.px 1) Css.solid Colors.grey ]
            ]
            []
        ]
      """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view ({ code } as model) =
    { title = "Tab | Navigation"
    , body =
        { header = "Tab navigation"
        , content = contentView model
        , code = code
        }
            |> Components.pageBody
    }


contentView : Model -> Html Msg
contentView { rectangle } =
    Html.div
        [ Html.css
            [ TabStyles.tab ]
        ]
        [ Html.div
            [ Html.class "tabs" ]
            [ Html.div
                [ Html.class "tabs__item tabs__item--active" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.div
                [ Html.class "tabs__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            , Html.div
                [ Html.class "tabs__item" ]
                [ Placeholders.Rectangle.view rectangle ]
            ]
        ]

