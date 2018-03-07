module Add exposing (..)

import Html exposing (Html, div, input, text, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MODEL
type alias Model =
  { firstname : String
  , lastname : String
  }

initialModel : Model
initialModel = 
  Model "" ""
  
-- MESSAGES

type Msg
  = Firstname String
  | Lastname String

-- VIEW

view : Model -> Html Msg
view model =
  div [] 
    [ input [ type_ "text", placeholder "firstname", onInput Firstname ] []
    , input [ type_ "text", placeholder "lastname", onInput Lastname ] []
    ]

-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    Firstname firstname ->
      { model | firstname = firstname }
    Lastname lastname ->
      { model | lastname = lastname } 
