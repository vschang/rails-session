import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "albumResults", "id", "hideclass"]
  static values = { album: String }

  hide() {
    this.hideclassTarget.classlist.toggle("d-none")
  }
}
