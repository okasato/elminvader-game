import Html exposing (Html, div, li, ul, text, program)

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
  = NoOp

-- VIEW

view : Model -> Html Msg
view model =
  ul [] (List.map viewGreeting model)

viewGreeting : { a | firstname : String, lastname : String } -> Html greeting
viewGreeting greeting =
  li [] [ text greeting.firstname, text " ", text greeting.lastname ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

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
