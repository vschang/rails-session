import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-chat"
export default class extends Controller {
  delete() {
    this.element.querySelector('form').submit();
  }
}
