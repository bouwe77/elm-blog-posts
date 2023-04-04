module Blog1 exposing (view)

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


view : Html.Html msg
view =
    div [] [ text result ]
