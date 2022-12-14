import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["input", "result"];

  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    console.log("hohoiho")

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/tommrl/clb52vxw5001a15ruez0osuqv",
      center: [-24, 42], // starting center in [lng, lat]
      zoom: 1 // starting zoom
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                        mapboxgl: mapboxgl }), "top-left")
    this.#geolocalisation("top-left")
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
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "20px"
      customMarker.style.height = "20px"
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
        let key = "pk.eyJ1IjoidG9tbXJsIiwiYSI6ImNsYTJqanh2ODBobzczcHBoY2VseTBiOHEifQ.Qp_zstoBsFRoqB3rBWPMHA"
        let position = [lon, lat];        
        sessionStorage.setItem('position', position)
        // console.log(sessionStorage.getItem('position'));
        fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${position[0]},${position[1]}.json?access_token=${key}`)
          .then(response => response.json())
          // .then(data => this.getAddress(data.features[0].place_name));
          .then(data =>  sessionStorage.setItem('address', data.features[0].place_name));
      });

      // fetch('/spots', {
      //   method: 'POST',
      //   data: { position: sessionStorage.getItem('address') },
      // })
      // .then(response => response.json())
      // .then(data => {
      //   // Handle the response from the server
      //   console(data)
      // });


      this.map.addControl(geolocate);
      this.map.on('load', () => {
      geolocate.trigger();
      });
     this.map.on('dblclick', function(e) {
      const link = "<%= link_to 'REPORT', new_spot_path, class: 'new-spot-button'%>".html_safe
		    const coordinates = e.lngLat;
        const key = "pk.eyJ1IjoidG9tbXJsIiwiYSI6ImNsYTJqanh2ODBobzczcHBoY2VseTBiOHEifQ.Qp_zstoBsFRoqB3rBWPMHA";
        sessionStorage.setItem('newLocation', Object.values(coordinates));
        const long= parseFloat(sessionStorage.getItem("newLocation").split(",")[0]);
        const lat= parseFloat(sessionStorage.getItem("newLocation").split(",")[1]);
        fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${parseFloat(sessionStorage.getItem("newLocation").split(",")[0])},${parseFloat(sessionStorage.getItem("newLocation").split(",")[1])}.json?access_token=${key}`)
          .then(response => response.json())
          .then(data =>  sessionStorage.setItem('newAddress', data.features[0].place_name));
          console.log(sessionStorage.getItem('newAddress'));
        new mapboxgl.Popup()
		      .setLngLat(coordinates)
          .setHTML("you want to report something here? <br/>" + "<a href='spots/new'>REPORT</a>" )
          .setMaxWidth("500px")
          .addTo(this);
        	});
    }



}
