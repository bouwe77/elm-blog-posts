module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import Random


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0
    , Cmd.none
    )


type Msg
    = GenerateRandomNumber
    | RandomNumberGenerated Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandomNumber ->
            ( model
            , Random.generate RandomNumberGenerated (Random.int 1 6)
            )

        RandomNumberGenerated newRandomNumber ->
            ( newRandomNumber
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text (String.fromInt model) ]
        , button [ onClick GenerateRandomNumber ] [ text "🔁" ]
        ]
