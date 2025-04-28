import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("WBB Button connected 🚀")
  }

  click(event) {
    event.preventDefault()
    console.log("Button wurde geklickt 🎯")
  }
}