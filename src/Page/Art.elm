module Page.Art exposing (..)

import Css exposing (block, hover)
import Html exposing (..)
import Html.Attributes exposing (class, href, property, src, style)
import Html.Parser exposing (Node(..))
import Html.Parser.Util exposing (toVirtualDom)
import Html.Styled.Events exposing (onMouseOver)
import Svg.Styled exposing (image)


textHtml : String -> List (Html.Html msg)
textHtml t =
    case Html.Parser.run t of
        Ok nodes ->
            Html.Parser.Util.toVirtualDom nodes

        Err _ ->
            [ text "error" ]


{-| parsed an html string, transforms hrefs in links, and converts to vdom which can be used in views.
-}
toHtml : Maybe (String -> String) -> String -> Result String (List (Html msg))
toHtml mf html =
    case Html.Parser.run html of
        Ok nodes ->
            case mf of
                Just func ->
                    Ok <| toVirtualDom <| List.map (mapAnchorElement func) nodes

                Nothing ->
                    Ok <| toVirtualDom nodes

        Err _ ->
            Err "Invalid Html"



-- INTERNALS


mapHrefAttribute : (String -> String) -> ( String, String ) -> ( String, String )
mapHrefAttribute func x =
    if Tuple.first x == "href" then
        Tuple.mapSecond func x

    else
        x


mapAnchorElement : (String -> String) -> Node -> Node
mapAnchorElement func node =
    case node of
        Comment _ ->
            node

        Text _ ->
            node

        Element "a" attributes child_nodes ->
            let
                mapped =
                    List.map (mapHrefAttribute func) attributes
            in
            Element "a" mapped child_nodes

        Element n attributes child_nodes ->
            Element n attributes <| List.map (mapAnchorElement func) child_nodes


parseHtml : String -> Html msg
parseHtml str =
    case toHtml Nothing str of
        Ok res ->
            div [] res

        Err err ->
            text "error"


type alias Img =
    { srcUrl : String
    , instagramUrl : String
    }


imageRender : Img -> Html msg
imageRender imgProps =
    div []
        [ a
            [ href imgProps.instagramUrl
            ]
            [ img
                [ src ("images/" ++ imgProps.srcUrl)
                , style "width" "500px"
                , style "height" "500px"
                , style "object-fit" "cover"
                ]
                []
            ]
        ]


view model =
    div
        [ style "display" "grid"
        , style "grid-template-columns" "auto auto auto"
        , style "gap" "5px"
        , style "align-items" "center"
        , style "align-content" "center"
        , style "justify-content" "center"
        ]
        (List.map imageRender imagesToEmbed)


imagesToEmbed : List Img
imagesToEmbed =
    [ { srcUrl = "IMG_20200103_175440-01.jpeg", instagramUrl = "https://www.instagram.com/p/B650oXaAN2B/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "IMG_20200320_110742_944.jpg", instagramUrl = "https://www.instagram.com/p/B99bx_iHcS7/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "IMG_20190922_010652.jpg", instagramUrl = "https://www.instagram.com/p/B2t4kl8gQND/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "IMG_20200514_200824-01.jpg", instagramUrl = "https://www.instagram.com/p/CAN9A1eneYY/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "100915087_1387528694771680_6282897074976466400_n.jpg", instagramUrl = "https://www.instagram.com/p/CAspk61AsLd/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "122179190_2060459727417747_5315705912164542481_n.jpg", instagramUrl = "https://www.instagram.com/p/CGtB5VmARw3/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "221168420_151307497089904_8811148300092393183_n.jpg", instagramUrl = "https://www.instagram.com/p/CRjdbSoIkHA/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "271230318_322973489682028_3146300600334165312_n.jpg", instagramUrl = "https://www.instagram.com/p/CYKmr2uJLyI/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "315016827_1558959097895589_1308285458764390666_n.jpg", instagramUrl = "https://www.instagram.com/p/Ck1ryBYyiuX/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "375777396_827739622060555_1309238847533653786_n.jpg", instagramUrl = "https://www.instagram.com/p/Cw-0rOrvROA/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "455870402_431854893199396_8464633677940895858_n.jpg", instagramUrl = "https://www.instagram.com/p/C-xx5PpvGXo/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    , { srcUrl = "440121736_444042041330896_5411565750715049654_n.jpg", instagramUrl = "https://www.instagram.com/p/C6CQPmryU6t/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" }
    ]
