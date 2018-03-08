import Html exposing (Html, div, li, ul, text, input, program, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)
-- MODEL
type alias Name = 
  { firstname : String
  , lastname : String
  }

type alias Model = List Name

init : ( Model, Cmd Msg )
init = 
  ( [ { firstname = "Meowze", lastname = "Dong" }
    , { firstname = "Hana", lastname = "March" }
    , { firstname = "Mia", lastname = "Kirmse"} ]
    , Cmd.none)

-- MESSAGES

type Msg
  = Add
  -- | Firstname String
  -- | Lastname String
-- VIEW

view : Model -> Html Msg
view model =
  div [] [ ul [] (List.map viewGreeting model)
  -- , input [ type_ "text", placeholder "firstname", onInput Firstname ] []
  -- , input [ type_ "text", placeholder "lastname", onInput Lastname ] []
  , button [onClick Add] [ text "Add" ]
  ] 

viewGreeting : { a | firstname : String, lastname : String } -> Html Msg
viewGreeting greeting =
  div [] 
    [ li [] [ text greeting.firstname, text " ", text greeting.lastname ] ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Add ->
      let 
        updatedModel =
          { firstname = "henoheno", lastname = "moheji" } :: model
      in
      ( updatedModel, Cmd.none )
    -- Firstname firstname ->
    --   ( { model | firstname = firstname }, Cmd.none )
    -- Lastname lastname ->
    --   ( { model | lastname = lastname }, Cmd.none ) 
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
