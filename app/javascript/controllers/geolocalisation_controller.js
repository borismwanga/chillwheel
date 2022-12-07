import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocalisation"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.inputTarget.value = localStorage.getItem('address')
  }

  
  
}

