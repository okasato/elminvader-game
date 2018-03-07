import Html exposing (Html, div, li, ul, text, program, button)
import Html.Events exposing (onClick)
import List

-- MODEL
type alias Model = 
  { listModel : List.Model
  }

initialModel : Model
initialModel = 
  { listModel : List.initialModel
  }

init : ( Model, Cmd Msg )
init =
  ( initialModel, Cmd.none )

-- MESSAGES

type Msg
  = ListMsg List.Msg

-- VIEW

view : Model -> Html Msg
view model =
  Html.div [] 
    [ Html.map ListMsg (List.view model.listModel)
    ] 

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ListMsg subMsg ->
      let
        ( updatedListModel, listCmd ) =
          List.update subMsg model.listModel
      in
        ( { model | listModel = updatedListModel }, Cmd.map ListMsg listCmd )

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
