module Main exposing (main)

import Html exposing (button, div, h1, text)
import Html.Attributes exposing (class, id)


main =
    div []
        [ h1 [] [ text "Let's Help Santa! 🎅🏻🙏🏻" ]
        , div
            [ class "container"
            ]
            [ div
                [ class "workshop"
                ]
                [ button
                    [ id "present-2"
                    , class "present"
                    ]
                    []
                , button
                    [ id "present-3"
                    , class "present"
                    ]
                    []
                ]
            , div
                [ class "sleigh"
                ]
                [ button
                    [ id "present-1"
                    , class "present"
                    ]
                    []
                ]
            ]
        ]
