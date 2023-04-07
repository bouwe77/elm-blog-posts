--[Ellie Playground](https://ellie-app.com/mtvn5TcKNQBa1)

module Main exposing (..)

import Html exposing (b, div, text)
import Html.Attributes exposing (style)


main =
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
