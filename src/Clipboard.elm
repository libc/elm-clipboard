module Clipboard exposing (onPaste)


{-|

# Event Handler
@docs onPaste

-}

import Native.Clipboard as Native
import Html exposing (Attribute)
import Json.Decode as Json
import Html.Events exposing (on)

{-| Capture paste events.
-}
onPaste : String -> (Maybe String -> msg) -> Attribute msg
onPaste mime msg =
    on "paste" <| Json.map msg <| (Json.map <| Native.getData mime) Json.value
