module Page.Music exposing (..)

import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Embed.Youtube.Thumbnail as Thumb exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


createEmbed : String -> Html msg
createEmbed url =
    Embed.Youtube.fromString url
        |> Embed.Youtube.attributes
            [ Embed.Youtube.Attributes.width 640
            , Embed.Youtube.Attributes.height 400
            ]
        |> Embed.Youtube.toHtml


videos : Html msg
videos =
    div
        [ style "display" "flex"
        , style "flex-direction" "column"
        , style "gap" "10px"
        , style "align-items" "center"
        ]
        (List.map createEmbed videosToEmbed)


desc : Html msg
desc =
    div
        [ style "margin" "10px"
        , style "text-align" "center"
        ]
        [ text """I'm a hobbyist musician and play the guitar and drums. Immersing myself into my hobbies is how I find peace after a long week. Here are some recordings I've made over the years!""" ]


view : a -> Html msg
view model =
    div
        []
        [ desc, videos ]


videosToEmbed : List String
videosToEmbed =
    [ "WPG8E6i1ETg"
    , "M0Xw676YueM"
    , "ep-hHNUR0Ls"
    , "WmBuwMcmi9A"
    ]
