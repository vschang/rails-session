import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
                  chatroomId: Number,
                  userId: Number
                }
  static targets = ["messages"]

  connect() {
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)

    this.channel = createConsumer().subscriptions.create(
    { channel: 'ChatroomChannel', id: this.chatroomIdValue },
    { received: this.#processMessage.bind(this) }
      )
      this.#scrollToBottom()
    }

  // this works
  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  // this works
  resetForm(event) {
    console.log('resetting!')
    event.target.reset()
  }

  #processMessage(data) {
    console.log('processing!')
    const sender = this.userIdValue == data.user_id
    const msgElement = this.#buildHTML(data.html)
    if (!sender) msgElement.classList.remove('sender')
    this.#insertMessage(msgElement)
    this.#scrollToBottom()
  }

  #buildHTML(string) {
    console.log('building html')
    const tmpDiv = document.createElement('div')
    tmpDiv.innerHTML = string
    return tmpDiv.firstElementChild
  }

  #insertMessage(element) {
    console.log('inserting message')
    this.messagesTarget.appendChild(element)
  }

  // this works
  #scrollToBottom() {
    console.log('scrolling to bottom')
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
