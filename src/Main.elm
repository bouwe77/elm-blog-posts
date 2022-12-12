module Main exposing (main)

import Browser
import Html exposing (button, div, h1, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)



-- Model


type Location
    = Workshop
    | Sleigh


type alias Present =
    { id : String, location : Location }


type alias Presents =
    List Present


initialModel : Presents
initialModel =
    [ { id = "present-1", location = Workshop }
    , { id = "present-2", location = Workshop }
    , { id = "present-3", location = Workshop }
    ]



-- Update


type Msg
    = MoveTo String Location


update : Msg -> Presents -> Presents
update msg presents =
    case msg of
        MoveTo presentId location ->
            -- Update the location of the present with the given id
            let
                updatedPresents =
                    List.map
                        (\present ->
                            if present.id == presentId then
                                { present | location = location }

                            else
                                present
                        )
                        presents
            in
            updatedPresents



-- View


renderPresent : Present -> Html.Html Msg
renderPresent present =
    button
        [ id present.id
        , class "present"
        , onClick
            (MoveTo present.id
                (if present.location == Sleigh then
                    Workshop

                 else
                    Sleigh
                )
            )
        ]
        []


renderPresents : Presents -> Location -> List (Html.Html Msg)
renderPresents presents locationFilter =
    List.map (\p -> renderPresent p)
        (List.filter (\p -> p.location == locationFilter) presents)


view : Presents -> Html.Html Msg
view model =
    div []
        [ h1 [] [ text "Let's Help Santa! 🎅🏻🙏🏻" ]
        , div [ class "container" ]
            [ div [ class "workshop" ] (renderPresents model Workshop)
            , div [ class "sleigh" ] (renderPresents model Sleigh)
            ]
        ]


main : Program () Presents Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
