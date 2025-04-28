import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu", "iconOpen", "iconClose"]

    connect() {
		console.log("mobile_menu_controller loaded")
        this.open = false
        this._updateIcons()
    }

    toggle() {
        this.open = !this.open
        this.menuTarget.classList.toggle("hidden", !this.open)
        this._updateIcons()
    }

    _updateIcons() {
        this.iconOpenTarget.classList.toggle("hidden", this.open)
        this.iconCloseTarget.classList.toggle("hidden", !this.open)
    }
}