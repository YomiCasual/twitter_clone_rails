import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tweet-form-modal"
export default class extends Controller {
  connect() {
    console.log("connected");

    this.element.addEventListener("submit", () => {
      const closeButton = document.querySelector("#close_tweet_modal");

      closeButton?.click();
    });
  }
}
