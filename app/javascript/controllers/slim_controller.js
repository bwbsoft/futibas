import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'
// import 'slim-select/dist/slimselect.css'

// Connects to data-controller="slim"
export default class extends Controller {
  'use strict'
  connect() {
    new SlimSelect({
      select: this.element,
      closeOnSelect: false
    })
  }
}