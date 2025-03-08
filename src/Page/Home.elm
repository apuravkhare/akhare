module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view model =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        ]
        [ div
            [ style "background-image" "url(https://raw.githubusercontent.com/apuravkhare/akhare/refs/heads/main/images/D24AE895-8318-4FFA-87F6-03E67CD9A646_1_105_c.jpeg)"
            , style "background-position" "center"
            , style "background-repeat" "no-repeat"
            ]
            [ div [ style "margin-top" "80%" ]
                [ div
                    [ style "height" "40vh"
                    , style "background-color" "rgba(255,255,255,0.8)"
                    , style "white-space" "pre-line"
                    , style "padding" "10px"
                    , style "text-align" "center"
                    , style "backdrop-filter" "blur(5px)"
                    ]
                    [ text """Hi, I'm Apurav! A programmer by profession, and a hobbyist musician and artist.

                    This website is a collection of work that I've done over the years.

                    I am a functional programming nerd and love exploring new programming languages.
                    This website, for example, is written in """
                    , a
                        [ href "https://elm-lang.org/"
                        , style "color" "black"
                        ]
                        [ text "Elm" ]
                    , text """.

                    Immersing myself into my hobbies is how I find peace after a long week.
                    I like sketching all sorts of things, but mainly people and musicians that inspire me.

                    I play the guitar, bass, and drums.
                    I geek out on music production and love learning all about DAWs, VSTs, and mixing.
                    You can find some recordings I've made over the years in the music section!
                    
                    I hope you find something you like here.

                    I'd love to get in touch! Reach out to me on """
                    , a
                        [ href "https://www.instagram.com/apurav.khare/"
                        , style "color" "black"
                        ]
                        [ text "Instagram" ]
                    , text " or "
                    , a
                        [ href "https://www.linkedin.com/in/apuravkhare/"
                        , style "color" "black"
                        ]
                        [ text "LinkedIn" ]
                    , text "."
                    ]
                ]
            ]
        ]
