import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tweet-form-modal"
export default class extends Controller {
  static targets = ["closeButton"];
  connect() {
    this.element.addEventListener("submit", () => {
      this.closeButtonTarget?.click();
    });
  }
}
