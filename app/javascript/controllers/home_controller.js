import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['dog-1', 'dog-2', 'dog-3', 'meet-dog']

  connect() {
    console.log("Hello from home_controller.js");
  }

  displayDog() {
    console.log('hello world!')
  }
}
