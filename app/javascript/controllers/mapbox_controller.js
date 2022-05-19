import { Controller } from '@hotwired/stimulus'
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  // static targets = [ 'test' ]
  static values ={
    apiKey: String,
    markers: Array
  }

  connect() {
    // console.log('Hello from mapbox_controller.js')
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
  })
    this.#addMarkersToMap()
    this.#fitMarkersToMap()

    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }))
  }

  #addMarkersToMap(){
    this.markersValue.forEach((marker)=>{
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // const customMarker = document.createElement("div")
      //   customMarker.className = "marker"
      //   customMarker.style.backgroundImage = `url('${marker.image_url}')`
      //   customMarker.style.backgroundSize = "contain"
      //   customMarker.style.width = "25px"
      //   customMarker.style.height = "25px"
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }
  #fitMarkersToMap() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, {padding:66, maxZoom:10, duration:3})
  }


}
