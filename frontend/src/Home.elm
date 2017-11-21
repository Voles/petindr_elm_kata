module Home exposing (..)

import Html exposing (..)
import Pets exposing (..)

import PetinderView exposing (petinderview, Model, Message(..))

nextPet : List Pet -> Pet
nextPet nextPets =
    case nextPets of
        [] -> princess
        [firstPet] -> firstPet
        firstPet::b::_ -> firstPet


initialModel : Model
initialModel = 
    {
        showProfileText = False,
        currentPet = princess
    }
    
update : Message -> Model -> Model
update msg model =
    case msg of
        ToggleMoreInfo ->
            { model | showProfileText = not model.showProfileText }

main : Program Never Model Message
main =
    beginnerProgram
        { model = initialModel
        , view = petinderview
        , update = update
        }
        