module Styles.Animations exposing
    ( fade
    , scale
    )

import Css
import Css.Animations


scale : Css.Style
scale =
    Css.batch
        [ Css.animationName scaleIn
        , Css.animationDuration <| Css.ms 300
        ]


fade : Css.Style
fade =
    Css.batch
        [ Css.animationName fadeIn
        , Css.animationDuration <| Css.ms 300
        ]


scaleIn : Css.Animations.Keyframes {}
scaleIn =
    Css.Animations.keyframes
        [ ( 0
          , [ Css.Animations.transform [ Css.scale 0.5 ]
            , Css.Animations.opacity <| Css.num 0
            ]
          )
        , ( 100
          , [ Css.Animations.transform [ Css.scale 1 ]
            , Css.Animations.opacity <| Css.num 1
            ]
          )
        ]


fadeIn : Css.Animations.Keyframes {}
fadeIn =
    Css.Animations.keyframes
        [ ( 0
          , [ Css.Animations.opacity <| Css.num 0 ]
          )
        , ( 100
          , [ Css.Animations.opacity <| Css.num 1 ]
          )
        ]
