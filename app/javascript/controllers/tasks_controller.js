import Rails from "@rails/ujs";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  change(e) {
    e.target.labels[0].classList.toggle('text-decoration-line-through');
    Rails.fire(this.element, 'submit');
  }
}
