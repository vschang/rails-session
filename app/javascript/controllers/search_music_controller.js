import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.resultsTarget)


  }
  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.outerHTML = data
      })
  }
}

