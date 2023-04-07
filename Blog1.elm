-- [Ellie Playground](https://ellie-app.com/mtvhHKNVxhTa1)

module Main exposing (..)

import Html exposing (div, text)


add : number -> number -> number
add a b =
    a + b


addTen : number -> number
addTen =
    add 10


result : String
result =
    addTen 20
        |> String.fromInt


main =
    div [] [ text result ]
