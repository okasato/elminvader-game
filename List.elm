module List exposing (..)

import Html exposing (Html, div, li, ul, text, program, button)
import Html.Events exposing (onClick)

-- MODEL
type alias Name = 
  { firstname : String
  , lastname : String
  }

type alias Model = List Name

initialModel : Model
initialModel = 
  [ { firstname = "Meowze", lastname = "Dong" }
    , { firstname = "Hana", lastname = "March" }
    , { firstname = "Mia", lastname = "Kirmse"} ]
  
-- MESSAGES

type Msg
  = Edit

-- VIEW

view : Model -> Html Msg
view model =
  div [] [ ul [] (List.map viewGreeting model)
  , button [] [ text "Add" ]
  ] 


viewGreeting : { a | firstname : String, lastname : String } -> Html Msg
viewGreeting greeting =
  div [] [ li [] [ text greeting.firstname, text " ", text greeting.lastname ]
  , button [ onClick Edit ] [ text "Edit" ]
  , button [] [ text "Delete" ]
  ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Edit ->
      ( model, Cmd.none )

-- -- SUBSCRIPTIONS

-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     Sub.none

-- -- MAIN
-- main : Program Never Model Msg
-- main =
--   program
--     { init = init
--     , view = view
--     , update = update
--     , subscriptions = subscriptions
--     }
