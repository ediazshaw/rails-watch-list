import { Controller } from "@hotwired/stimulus"

import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Enjoy movies", "Share your taste"],
      typeSpeed: 60,
      loop: true
    });
  }
}
