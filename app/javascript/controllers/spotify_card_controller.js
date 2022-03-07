import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "albumResults", "id"]
  static values = { album: String }
  fill() {
    console.log(this.albumValue);
  }
}
