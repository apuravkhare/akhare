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


view : a -> Html msg
view model =
    div
        []
        [  videos ]


videosToEmbed : List String
videosToEmbed =
    [ "Y1LkX5tLHX0"
    , "WPG8E6i1ETg"
    , "M0Xw676YueM"
    , "ep-hHNUR0Ls"
    , "WmBuwMcmi9A"
    ]
