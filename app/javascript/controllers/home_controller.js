import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['dogOne', 'dogTwo', 'dogThree', 'meetDog', 'showDog', 'dogDescription']

  connect() {
    console.log("Hello from home_controller.js");
  }

  displayDog(event) {
    const target = event.currentTarget;
    const dogName = target.dataset.dogName;
    const dogDescription = target.dataset.dogDescription;

    if (!dogName || !dogDescription) {
      console.error('Dog name or description is undefined');
      return;
    }

    console.log('Displaying:', dogName);

    // Update the heading and description
    this.meetDogTarget.innerText = `Meet ${dogName}`;
    this.dogDescriptionTarget.innerText = dogDescription;

    // Update the visibility of the dog cards
    this.showDogTarget.classList.remove('d-none');
    this.dogOneTarget.classList.add('d-none');
    this.dogTwoTarget.classList.add('d-none');
    this.dogThreeTarget.classList.add('d-none');

    // Make the clicked card visible in the showDog section
    const dogHtml = target.outerHTML;
    this.showDogTarget.querySelector('.col-6:first-child').innerHTML = dogHtml;
  }
}
