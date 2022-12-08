import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nearme"
export default class extends Controller {
  static targets = [ "element" ]
  connect() {
  }

  toggleClass(event) {
    this.elementTarget.classList.toggle('active')
  }
}
