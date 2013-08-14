import Graphics.Input as Input
import JavaScript as JS

(fieldS,uriS) = Input.field "Enter URL"

(buttonE,pressedS) = Input.button "Go!"

redirect = JS.fromString <~ sampleOn pressedS uriS 
foreign export jsevent "redirect"
  redirect : Signal JSString
  
main = (\fieldV->flow right [fieldV,buttonE])<~fieldS
