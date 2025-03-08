module Page.Code exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


personalSite : Html msg
personalSite =
    div
        [ style "text-align" "left"
        ]
        [ div [ style "font-size" "x-large" ] [ text "This website!" ]
        , div [ style "color" "rgba(0,0,0,0.7)" ]
            [ text """I took the opportunity to learn a new programming language, Elm, and wrote the website in it! It was a great experience learning the fundamentals of the language, and how it guarantees no runtime errors.
        
        You can find the source code for the website on my github """
            , a [ href "https://github.com/apuravkhare/akhare" ] [ text "here" ]
            , text "."
            ]
        ]


thesis : Html msg
thesis =
    div
        [ style "text-align" "right"
        ]
        [ div [ style "font-size" "x-large" ] [ text "Revisiting Ad-hoc Polymorphism" ]
        , div [ style "color" "rgba(0,0,0,0.7)" ]
            [ text """Ad-hoc polymorphism is a type of polymorphism where different function definitions can be given the same name. Programming languages utilize constructs like Type classes and Object classes to provide a mechanism for implementing ad-hoc polymorphism
        
        I did my thesis constructing an interpreter for a programming language that implements ad-hoc polymorphism in a type system with type classes.
        
        You can read all about it """
            , a [ href "https://repository.rit.edu/theses/11290/" ] [ text "here" ]
            , text "."
            ]
        ]


codewars : Html msg
codewars =
    div
        [ style "text-align" "left"
        ]
        [ div [ style "font-size" "x-large" ] [ text "Code wars" ]
        , div [ style "color" "rgba(0,0,0,0.7)" ]
            [ text """I love programming for fun and learning new programming languages. I'm in the top 7 percentile on the competitive coding website Code wars.
            
            Join me in the fun """
            , a [ href "https://www.codewars.com/users/apuravkhare" ] [ text "here" ]
            , text "."
            ]
        ]


separator : Html msg
separator =
    hr
        [ style "width" "40%"
        , style "opacity" "0.5"
        ]
        []


view model =
    div
        [ style "display" "flex"
        , style "flex-direction" "column"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "gap" "30px"
        , style "white-space" "pre-line"
        ]
        [ codeItem personalSite
        , separator
        , codeItem thesis
        , separator
        , codeItem codewars
        ]


codeItem child =
    div [ style "width" "50%" ] [ child ]
