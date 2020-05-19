module Pages.Misc.StickyColumnsTable.Top exposing (Flags, Model, Msg, page)

import Components
import Components.Misc.StickyColumnsTable as PageComponent
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
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


stickyColumnsTable : Html msg
stickyColumnsTable =
    Html.div
        [ Html.css
            [ Css.overflow Css.auto ]
        ]
        [ Html.table
            [ Html.css
                [ Css.position Css.relative ]
            ]
            [ Html.body
                []
                [ Html.tr
                    []
                    [ Html.th
                        [ Html.css
                            [ Css.position Css.sticky
                            , Css.left Css.zero
                            , Css.zIndex <| Css.int 9999
                            ]
                        ]
                        []
                    ]
                ]
            ]
        ]
    """
    }


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Document Msg
view { code, component } =
    { title = "Sticky columns table | Misc"
    , body =
        { header = "Sticky columns table"
        , content = PageComponent.view component
        , code = code
        , componentUrl = "https://github.com/bigardone/elm-css-patterns/blob/master/src/Components/Misc/StickyColumnsTable.elm"
        }
            |> Components.pageBody
    }

