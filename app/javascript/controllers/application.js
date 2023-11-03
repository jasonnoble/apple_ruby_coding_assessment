import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

window.initMap = () => {
  const event = new Event("map-loaded");
  window.dispatchEvent(event);
}

export { application }
