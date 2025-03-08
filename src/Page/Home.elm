module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view model =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        ]
        [ div
            [ style "background-image" "url(images/D24AE895-8318-4FFA-87F6-03E67CD9A646_1_105_c.jpeg)" ]
            [ text """Hi, I'm Apurav! A programmer by profession, and a hobbyist musician and artist.
                  Welcome to my little corner on the internet!""" ]
        ]
