module Main exposing (..)

import Html exposing (a, div, h1, li, p, text, ul)
import Html.Attributes exposing (href)


main : Html.Html msg
main =
    view ""


type alias Item =
    { title : String, demo : String, source : String, blog : String }


items : List Item
items =
    [ { title = "The language"
      , demo = "/Blog1.elm"
      , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog1.elm"
      , blog = "https://bouwe.io/elm-baby-steps"
      }
    , { title = "Rendering HTML"
      , demo = "/Blog2.elm"
      , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog2.elm"
      , blog = "https://bouwe.io/elm-rendering-html"
      }
    , { title = "User interaction"
      , demo = "/Blog3.elm"
      , source = "https://github.com/bouwe77/elm-blog-posts/blob/main/src/Blog3.elm"
      , blog = "https://bouwe.io/elm-user-interaction"
      }
    ]


viewItem : Item -> Html.Html msg
viewItem item =
    p []
        [ text item.title
        , ul []
            [ li [] [ a [ href item.demo ] [ text "demo" ] ]
            , li [] [ a [ href item.source ] [ text "source code" ] ]
            , li [] [ a [ href item.blog ] [ text "blog post" ] ]
            ]
        ]


view : String -> Html.Html msg
view _ =
    div []
        [ h1 []
            [ text "My Elm blog posts" ]
        , div []
            (List.map viewItem items)
        ]
