# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import ./di/container
import ./datasources/builtin
import std/marshal
import jester

let di = newDIContainer(characters)
let appHandler = di.newAppHandler()


router route:
  get "/getCharacters":
    resp $$appHandler.characterHandler.getCharacters(),
        contentType = "application/json"


proc main() =
  let settings = newSettings()
  var jester = initJester(route, settings = settings)
  jester.serve()



when isMainModule:
  main()
