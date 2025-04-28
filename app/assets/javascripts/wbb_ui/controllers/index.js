//import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
//eagerLoadControllersFrom("controllers", application)


//import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
//import { application } from "wbb_ui/application"

//eagerLoadControllersFrom("wbb_ui/controllers", application)

//export default application.controllers



import { application } from "wbb_ui/application"
import { registerControllers } from "@hotwired/stimulus-loading"

// Alle Controller unter "wbb_ui/controllers" automatisch laden
import controllers from "./**/*_controller.js"

// Registriere die Controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)