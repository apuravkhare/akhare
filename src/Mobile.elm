module Mobile exposing (..)

import Browser
import Browser.Navigation as Nav
import Css exposing (..)
import FontAwesome exposing (icon, instagram, linkedIn)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Ionicon
import Ionicon.Android as Android
import Ionicon.Social as Social
import MobilePage.Art as ArtPage
import MobilePage.Code as CodePage
import MobilePage.Home as HomePage
import MobilePage.Music as MusicPage
import Url
import Url.Parser exposing ((</>), Parser, int, map, oneOf, s, string)


type ColorPalette
    = RaisinBlack
    | MidnightGreen
    | PaleDogwood
    | Buff
    | ImperialRed


getColor : ColorPalette -> String
getColor c =
    case c of
        RaisinBlack ->
            "#3a2e39"

        MidnightGreen ->
            "#1e555c"

        PaleDogwood ->
            "#f4d8cd"

        Buff ->
            "#edb183"

        ImperialRed ->
            "#f15152"


type UrlRequest
    = Internal Url.Url
    | External String


type Page
    = Home
    | Art
    | Code
    | Music



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , page : Page
    , menu : Bool
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url Home False, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ToggleMenu


routeParser : Parser (Page -> a) a
routeParser =
    oneOf
        [ Url.Parser.map Home (Url.Parser.s "home")
        , Url.Parser.map Code (Url.Parser.s "code")
        , Url.Parser.map Art (Url.Parser.s "art")
        , Url.Parser.map Music (Url.Parser.s "music")
        ]


changeUrl : Url.Url -> Model -> ( Model, Cmd Msg )
changeUrl url model =
    case Url.Parser.parse routeParser url of
        Just answer ->
            ( { model | page = answer, menu = False }, Cmd.none )

        Nothing ->
            ( { model | page = Home }
            , Cmd.none
            )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    changeUrl url model

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            changeUrl url model

        ToggleMenu ->
            ( { model | menu = not model.menu }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


separator : Html msg
separator =
    hr
        [ style "width" "80%"
        , style "color" "white"
        , style "margin" "0px"
        ]
        []


mobileMenu : Model -> Html msg
mobileMenu model =
    if model.menu then
        div
            [ style "background-color" "white"
            , style "display" "block"
            ]
            [ viewLink model Home "/home"
            , separator
            , viewLink model Code "/code"
            , separator
            , viewLink model Art "/art"
            , separator
            , viewLink model Music "/music"
            ]

    else
        div [ style "display" "none" ] []


renderTab : Model -> Html Msg
renderTab model =
    case model.page of
        Home ->
            HomePage.view { model | menu = False }

        Code ->
            CodePage.view { model | menu = False }

        Art ->
            ArtPage.view { model | menu = False }

        Music ->
            MusicPage.view { model | menu = False }


type alias RGBA =
    { red : Float
    , green : Float
    , blue : Float
    , alpha : Float
    }


view : Model -> Browser.Document Msg
view model =
    { title = "Apurav Khare"
    , body =
        [ div
            [ style "font-family" "monospace"
            , style "background-color" "#FEFEFE"
            , style "display" "grid"
            , style "grid-template-rows" "auto 1fr auto"
            , style "height" "100vh"
            , style "font-size" "16pt"
            ]
            [ div
                [ style "height" "150px"
                , style "display" "flex"
                , style "justify-content" "space-around"
                , style "align-items" "center"
                , style "background-color" (getColor MidnightGreen)
                , style "color" "white"
                , style "position" "sticky"
                , style "top" "0"
                , style "z-index" "1"
                ]
                [ span [ style "font-size" "30pt" ]
                    [ text "Apurav Khare" ]
                , div
                    [ style "display" "flex"
                    , style "color" "red"
                    , style "gap" "5px"
                    ]
                    [ span
                        [ onClick ToggleMenu
                        ]
                        [ Android.menu
                            70
                            (RGBA 255 255 255 1)
                        ]
                    ]
                ]
            , mobileMenu model
            , renderTab model
            , footer
                [ style "border-top" "1px solid #eeeeee"
                , style "text-align" "center"
                , style "padding" "2em"

                -- , style "margin" "4em"
                , style "color" "darkgrey"
                ]
                [ a
                    [ href """https://github.com/apuravkhare/akhare"""
                    , style "color" "darkgrey"
                    ]
                    [ text "Site source" ]
                , span
                    [ style "margin-left" "1.5em"
                    , style "margin-right" "1.5em"
                    ]
                    [ text "–" ]
                , span
                    [ style "display" "inline-flex"
                    , style "align-items" "center"
                    , style "gap" "5px"
                    ]
                    [ text "Apurav Khare"
                    , a [ href "https://www.instagram.com/apurav.khare/" ]
                        [ Social.instagramOutline 20 (RGBA 0.36 0.37 0.38 1) ]
                    , a [ href "https://www.linkedin.com/in/apuravkhare/" ]
                        [ Social.linkedin 20 (RGBA 0.36 0.37 0.38 1) ]
                    , a [ href "https://www.youtube.com/@ApuravKhare" ]
                        [ Social.youtube 20 (RGBA 0.36 0.37 0.38 1) ]
                    ]
                ]
            ]
        ]
    }



-- viewLink : String -> Html msg


viewLink model tab path =
    div
        [ style "padding" "0.5em"
        , style "text-align" "center"
        , style "font-size" "30pt"
        , style "background-color" (getColor MidnightGreen)
        ]
        [ a
            [ href path
            , style "color"
                (if model.page == tab then
                    getColor Buff

                 else
                    "white"
                )
            , style "text-decoration" "none"
            ]
            [ text path ]
        ]
