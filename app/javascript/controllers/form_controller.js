import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  add() {
    if ("content" in document.createElement("template")) {
      // select template
      const templateElement = document.querySelector('#template');
      // clone that template. Need to fill up node and 
      const nameDocFragment = templateElement.content.cloneNode(true);
      // select the extra div
      const extra = document.querySelector('#extra');
      // attach to the extra div
      extra.appendChild(nameDocFragment);
    }
    else {
        console.log('no dice');
    }
  }
}
