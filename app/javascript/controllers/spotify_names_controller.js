import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["firstName", "lastName", "form"]

  connect() {
    console.log(this.firstNameTarget)
    console.log(this.lastNameTarget)
  }

  changeFormUrl() {
    console.log('TYPING REGISTERED!')
    const baseUrl = '/users/auth/spotify'
    console.log(this.formTarget.action)
    this.formTarget.action = `${baseUrl}/?first_name=${this.firstNameTarget.value}&last_name=${this.lastNameTarget.value}`
  }
}
