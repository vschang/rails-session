import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["hideclass"]
  hide() {
    this.hideclassTarget.classList.toggle("d-none")
  }
}
