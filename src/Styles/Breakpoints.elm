module Styles.Breakpoints exposing (small)

import Css
import Css.Media


{-|

    @media (min-width: 768px)

-}
small : List Css.Style -> Css.Style
small =
    custom 768


custom : Float -> List Css.Style -> Css.Style
custom width =
    Css.Media.withMedia
        [ Css.Media.all [ Css.Media.maxWidth (Css.px width) ] ]
