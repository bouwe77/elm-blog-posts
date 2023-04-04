module Main exposing (main)

-- import Blog3

import Blog1
import Blog2
import Browser
import Html exposing (Html, a, b, button, div, h1, header, nav, text)
import Html.Attributes exposing (class, href, target)
import Html.Events exposing (onClick)


type alias Model =
    { selectedBlogId : Int }


init : Model
init =
    { selectedBlogId = 1 }


type alias Blog =
    { id : Int, title : String, source : String, blog : String, view : Html Msg }


blogs : List Blog
blogs =
    [ { id = 1
      , title = "The language"
      , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog1.elm"
      , blog = "https://bouwe.io/elm-baby-steps"
      , view = Blog1.view
      }
    , { id = 2
      , title = "Rendering HTML"
      , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog2.elm"
      , blog = "https://bouwe.io/elm-rendering-html"
      , view = Blog2.view
      }

    -- , { id = 3
    --   , title = "User interaction"
    --   , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog3.elm"
    --   , blog = "https://bouwe.io/elm-user-interaction"
    --   , view = Blog3.view
    --   }
    ]


getBlogById : Int -> Maybe Blog
getBlogById id =
    List.filter (\blog -> blog.id == id) blogs |> List.head


type Msg
    = SetSelectedBlogId Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetSelectedBlogId id ->
            let
                newSelectedId =
                    if List.any (\record -> record.id == id) blogs then
                        id

                    else
                        1
            in
            { model | selectedBlogId = newSelectedId }


blogNav : Html Msg
blogNav =
    div []
        (List.map
            (\blog ->
                div []
                    [ button
                        [ onClick (SetSelectedBlogId blog.id)
                        ]
                        [ text blog.title ]
                    ]
            )
            blogs
        )


blogHeader : Maybe Blog -> Html msg
blogHeader blog =
    case blog of
        Just blog2 ->
            div [ class "blog-header" ]
                [ b [] [ text blog2.title ]
                , text " "
                , a [ href blog2.blog, target "_blank" ] [ text "[blog post]" ]
                , text " "
                , a [ href blog2.source, target "_blank" ] [ text "[source code]" ]
                ]

        Nothing ->
            text "Nope"


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header [] [ h1 [] [ text "My Elm blog posts" ] ]
        , div [ class "main" ]
            [ nav [] [ blogNav ]
            , div [ class "content" ]
                [ blogHeader (getBlogById model.selectedBlogId)
                , case getBlogById model.selectedBlogId of
                    Just blog ->
                        blog.view

                    Nothing ->
                        text "Nope"
                ]
            ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
