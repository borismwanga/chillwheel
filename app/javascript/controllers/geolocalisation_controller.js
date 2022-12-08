import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocalisation"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    if (sessionStorage.getItem("newAddress")) {
      this.inputTarget.value = sessionStorage.getItem("newAddress")
    } else {
      this.inputTarget.value = sessionStorage.getItem('address')
      
    }
  }
  
}
