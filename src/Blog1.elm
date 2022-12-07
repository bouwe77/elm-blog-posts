module Blog1 exposing (main)

import Html exposing (text)


add a b =
    a + b


addTen =
    add 10


result =
    addTen 20
        |> String.fromInt


main =
    text result
