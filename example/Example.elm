import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Clipboard exposing (onPaste)



main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }



-- MODEL


type alias Model =
  { pasted : Maybe String
  }


init : ( Model, Cmd Msg )
init =
  ( Model Nothing
  , Cmd.none
  )



-- UPDATE


type Msg
  = Pasted (Maybe String)


{- We are just storing the location in our history in this example, but
normally, you would use a package like evancz/url-parser to parse the path
or hash into nicely structured Elm values.

    <http://package.elm-lang.org/packages/evancz/url-parser/latest>

-}
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Pasted contents ->
      ( { model | pasted = contents }
      , Cmd.none
      )



-- VIEW


view : Model -> Html Msg
view model =
  let
      pastedText =
        case model.pasted of
          Nothing -> "(nothing yet)"
          Just str -> str
  in
    div []
      [ h1 [] [ text "Paste" ]
      , textarea [onPaste "text/plain" Pasted] []
      , h1 [] [ text "Pasted content" ]
      , text pastedText
      ]
