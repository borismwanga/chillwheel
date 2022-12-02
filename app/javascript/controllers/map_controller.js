import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

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
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                        mapboxgl: mapboxgl }))
    this.#geolocalisation()

    console.log("logging span target", this.spanTarget)
  }

  // #markerColor(marker) {
  //   console.log(marker.category)
  //   switch (marker.category) {
  //     case 'Accident':
  //       return "#cc0000";
  //     case 'Stolen bike':
  //       return "#f7932c";
  //     default:
  //       "#ffffff"
  //   }
  // }

  getAddress(address) {
    console.log(address)
    // this.spanTarget.innerHTML = address
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"
      customMarker.style.opacity = "50%"

      new mapboxgl.Marker(customMarker)
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
