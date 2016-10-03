module MouseEvents exposing (..)

import DOM exposing (Rectangle)
import Html
import Html.Events exposing (onWithOptions, defaultOptions)
import Json.Decode as Decode exposing ((:=))


type alias MouseEvent =
    { clientX : Int
    , clientY : Int
    , target : DOM.Rectangle
    }


preventOpts : Html.Events.Options
preventOpts =
    let
        defs =
            defaultOptions
    in
        { defs
            | stopPropagation = True
            , preventDefault = True
        }


mouseEventDecoder : Decode.Decoder MouseEvent
mouseEventDecoder =
    Decode.object3 MouseEvent
        ("clientX" := Decode.int)
        ("clientY" := Decode.int)
        ("target" := DOM.boundingClientRect)



-- reference: https://developer.mozilla.org/en-US/docs/Web/Events


onMouseEnter : (MouseEvent -> msg) -> Html.Attribute msg
onMouseEnter target =
    onWithOptions "mouseenter" preventOpts (Decode.map target mouseEventDecoder)


onMouseOver : (MouseEvent -> msg) -> Html.Attribute msg
onMouseOver target =
    onWithOptions "mouseover" preventOpts (Decode.map target mouseEventDecoder)


onMouseMove : (MouseEvent -> msg) -> Html.Attribute msg
onMouseMove target =
    onWithOptions "mousemove" preventOpts (Decode.map target mouseEventDecoder)


onMouseDown : (MouseEvent -> msg) -> Html.Attribute msg
onMouseDown target =
    onWithOptions "mousedown" preventOpts (Decode.map target mouseEventDecoder)


onMouseUp : (MouseEvent -> msg) -> Html.Attribute msg
onMouseUp target =
    onWithOptions "mouseup" preventOpts (Decode.map target mouseEventDecoder)


onClick : (MouseEvent -> msg) -> Html.Attribute msg
onClick target =
    onWithOptions "click" preventOpts (Decode.map target mouseEventDecoder)


onDoubleClick : (MouseEvent -> msg) -> Html.Attribute msg
onDoubleClick target =
    onWithOptions "dblclick" preventOpts (Decode.map target mouseEventDecoder)


onContextMenu : (MouseEvent -> msg) -> Html.Attribute msg
onContextMenu target =
    onWithOptions "contextmenu" preventOpts (Decode.map target mouseEventDecoder)


onWheel : (MouseEvent -> msg) -> Html.Attribute msg
onWheel target =
    onWithOptions "wheel" preventOpts (Decode.map target mouseEventDecoder)


onMouseLeave : (MouseEvent -> msg) -> Html.Attribute msg
onMouseLeave target =
    onWithOptions "mouseleave" preventOpts (Decode.map target mouseEventDecoder)


onMouseOut : (MouseEvent -> msg) -> Html.Attribute msg
onMouseOut target =
    onWithOptions "mouseout" preventOpts (Decode.map target mouseEventDecoder)


onSelect : (MouseEvent -> msg) -> Html.Attribute msg
onSelect target =
    onWithOptions "select" preventOpts (Decode.map target mouseEventDecoder)


onPointerLockChange : (MouseEvent -> msg) -> Html.Attribute msg
onPointerLockChange target =
    onWithOptions "pointerlockchange" preventOpts (Decode.map target mouseEventDecoder)


onPointerLockError : (MouseEvent -> msg) -> Html.Attribute msg
onPointerLockError target =
    onWithOptions "pointerlockerror" preventOpts (Decode.map target mouseEventDecoder)
