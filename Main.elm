module Main exposing (..)

import Html exposing (Html, program)
import NameList
import Add

-- MODEL
type alias Model = 
  { namelistModel : NameList.Model
  }

initialModel : Model
initialModel = 
  { namelistModel = NameList.initialModel
  }

init : ( Model, Cmd Msg )
init =
  ( initialModel, Cmd.none )

-- MESSAGES

type Msg
  = NameListMsg NameList.Msg

-- VIEW

view : Model -> Html Msg
view model =
  Html.div [] 
    [ Html.map NameListMsg (NameList.view model.namelistModel)
    ] 

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NameListMsg subMsg ->
      let
        ( updatedNameListModel, namelistCmd ) =
          NameList.update subMsg model.namelistModel
      in
        ( { model | namelistModel = updatedNameListModel }, Cmd.map NameListMsg namelistCmd )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN
main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
