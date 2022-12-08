import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newaddress"
export default class extends Controller {
  
  connect() {
  }
  newAddress(){
    this.inputTarget.value = sessionStorage.getItem('newAddress')
  }
}
