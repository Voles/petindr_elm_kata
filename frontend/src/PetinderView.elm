module PetinderView exposing (petinderview, Model, Message(..))

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type Message = ToggleMoreInfo

type alias Model =
    { showProfileText : Bool
    , currentPet :
        { id : Int
        , name : String
        , distance : Int
        , text : String
        , photoUrl : String
        }
    -- , nextPets: List
    }

petinderview : Model -> Html Message
petinderview model =
    div []
        [ petHeader
        , mainContainer model
        ]

petHeader : Html msg
petHeader =
    header []
        [ span [ class "header-title" ]
            [ text "Petindr" ]
        , button [ class "icon-right chat-icon" ]
            []
        ]

mainContainer : Model -> Html Message
mainContainer model =
    div [ class "container main-container" ]
        [ profiles model
        , buttonGroup
        ]

profiles : Model -> Html msg
profiles model =
    div [ class "profiles" ]
        [ profile model ]

profile : Model -> Html msg
profile model =
    div [ class "profile" ]
        [ div []
            [ profileImage
            , profileText model.showProfileText
            ]
        , identification
        ]

profileImage : Html msg
profileImage =
    img [ src "http://localhost:3000/profiles/princess.jpg" ][]

profileText : Bool -> Html msg
profileText toggle =
    if toggle then
        div [ class "profile-text" ]
            [ text "Hello World" ]
    else
        div [][]

identification : Html msg
identification =
    div [ class "identification" ]
        [ span [ class "identification-name" ]
            [ text "Princess" ]
        , span [ class "identification-distance" ]
            [ text "25km" ]
        ]

buttonGroup : Html Message
buttonGroup =
    div [ class "button-group" ]
        [ button [ class "button-round button-primary button-big icon-x" ]
            [ img [ src "/styling/images/x-icon.png" ][]
            ]
        , button [ class "button-round button-primary button-small button-front" ]
            [ img [ src "/styling/images/i-icon.png", onClick ToggleMoreInfo ][]
            ]
        , button [ class "button-round button-primary button-big" ]
            [ img [ src "/styling/images/like-icon.png" ][]
            ]
        ]
