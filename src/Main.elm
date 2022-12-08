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
    = ToggleLocation String


update : Msg -> Presents -> Presents
update msg model =
    case msg of
        ToggleLocation id ->
            let
                updatePresent present =
                    if present.id == id then
                        case present.location of
                            Workshop ->
                                { present | location = Sleigh }

                            Sleigh ->
                                { present | location = Workshop }

                    else
                        present
            in
            List.map updatePresent model



-- View


renderPresent : String -> Html.Html Msg
renderPresent presentId =
    button
        [ id presentId
        , class "present"
        , onClick (ToggleLocation presentId)
        ]
        []


renderPresents : Presents -> Location -> List (Html.Html Msg)
renderPresents presents locationFilter =
    List.map (\p -> renderPresent p.id)
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
