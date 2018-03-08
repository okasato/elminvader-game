import Html exposing (Html, div, li, ul, text, input, table, thead, program, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)

-- MAIN
main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model =
  { persons : List Person
  , id : ID
  , firstname : Name
  , lastname : Name
  }

init : ( Model, Cmd Msg )
init = 
  ( { persons = [
      { id = 1, firstname = "Meowze", lastname = "Dong" }
      , { id = 2, firstname = "Hana", lastname = "March" }
      , { id = 3, firstname = "Mia", lastname = "Kirmse"}
      ]
    , firstname = ""
    , lastname = ""
    }
  , Cmd.none  
  )

type alias Person = 
  { id : ID 
  , firstname : String 
  , lastname : String
  }

type alias ID =
  Int

type alias Name = 
  String

-- MESSAGES

type Msg
  = Id ID
  | FirstName Name
  | LastName Name
  | NewPerson

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ persons, firstname, lastname } as model) =
  case msg of
    Id id -> 
      ( { model | id = id }, Cmd.none )
    
    FirstName name ->
      ( { model | firstname = firstname }, Cmd.none )
      
    LastName name ->
      ( { model | lastname = lastname }, Cmd.none )
      
    NewPerson ->
      ( { model | persons = { id = id, fitstname = firstname, lastname = lastname } :: persons }, Cmd.none )

-- VIEW

view : Model -> Html Msg
view ({ persons, firstname, lastname } as model) =
  div [] [ addForm id name ] 

addForm : Name -> ID -> Html Msg
addForm name id =
  div []
    [ div [] [ input [ type_ "text", placeholder "firstname" onInput FirstName ] [] ]
    , div [] [ input [ type_ "text", placeholder "lsstname" onInput LastName ] [] ]
    , div [] [ button [onClick NewPerson] [ text "Add" ] ]
    ]

-- personList : List Person -> ID -> Name -> Html Msg
-- personList persons id name =
  

--  person : 
--     [ li [] [ text firstname, text " ", text lastname ] ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

