import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["input", "result", "span"];

  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [-24, 42], // starting center in [lng, lat]
      zoom: 1 // starting zoom
    })
    this.#addMarkersToMap()
    // this.#fitMapToMarkers()
    this.#geolocalisation()

    console.log("logging span target", this.spanTarget)
  }

  #markerColor(marker) {
    console.log(marker.category)
    switch (marker.category) {
      case 'Accident':
        return "#cc0000";
      case 'Dangerous junction':
        return "#f78b1c";
      case 'Damage road':
        return "#f3bf1f";
      case 'Works':
        return "#2986cc";
        console.log('Mangoes and papayas are $2.79 a pound.');
      default:
        "#ffffff"
    }

  }


  getAddress(address) {
    console.log(address)
    // this.spanTarget.innerHTML = address
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this
      new mapboxgl.Marker({
        color: this.#markerColor(marker),
      })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2 })
  }
  #geolocalisation() {
    // this.map.addControl(
    //   new mapboxgl.GeolocateControl({
    //     positionOptions: {
    //       enableHighAccuracy: true
    //     },
    //     // When active the map will receive updates to the device's location as it changes.
    //     trackUserLocation: true,
    //     // Draw an arrow next to the location dot to indicate which direction the device is heading.
    //     showUserHeading: true
    //     })
    //   );
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true
      });

      geolocate.on('geolocate', function(e) {
        let lon = e.coords.longitude;
        let lat = e.coords.latitude
        let position = [lon, lat];
        console.log(position);
        fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${position[0]},${position[1]}.json?access_token=pk.eyJ1IjoiYm9yaXNtd2FuZ2EiLCJhIjoiY2xhMmVrd3YwMGVnZjNwbXozMjZqenZyOCJ9.Lbbgio2LZjf4VtXKhwqMrQ`)
          .then(response => response.json())
          // .then(data => this.getAddress(data.features[0].place_name));
          .then(data =>  localStorage.setItem('address', data.features[0].place_name));
      });



      this.map.addControl(geolocate);
      this.map.on('load', () => {
      geolocate.trigger();
      });
  }



}
