module Blog2 exposing (view)

import Html exposing (b, div, text)
import Html.Attributes exposing (style)


view : Html.Html msg
view =
    div
        [ style "display" "grid"
        , style "place-items" "center"
        , style "min-height" "5vh"
        , style "background-color" "white"
        ]
        [ text "Hello, "
        , b
            [ style "color" "red"
            ]
            [ text "World!"
            ]
        ]
