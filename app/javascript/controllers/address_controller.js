import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'input'
  ]
  connect() {
    console.log('Address controller is connected')
  }

  initGoogle() {
    console.log('Initializing Address Finder...')
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      fields: ["address_components", "geometry"],
      types: ["address"]
    });
    this.autocomplete.addListener('place_changed', this.placeSelected.bind(this));
  }

  placeSelected() {
    // use values from autocomplete
    const place = this.autocomplete.getPlace();
    window.place = place;
    const latitude = place.geometry.location.lat();
    const longitude = place.geometry.location.lng();
    const zipcode = place.address_components.find(component => component.types == 'postal_code')['long_name'];

    const weatherFetchUrl = '/weather/' + zipcode + '?lat=' + latitude + '&lng=' + longitude
    fetch(weatherFetchUrl, { headers: { Accept: "text/vnd.turbo-stream.html" } })
      .then(response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
  }
}
