import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["mapContainer"]

  connect() {
    console.log("Stimulus connecté !");

    this.mapVisible = true;
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.mapContainerTarget,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [2.3522, 48.8566],
      zoom: 12
    });

    this.#addMarkersToMap();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  toggle() {
    console.log("Bouton cliqué !");

    this.mapVisible = !this.mapVisible;
    this.mapContainerTarget.style.display = this.mapVisible ? "block" : "none";

    if (this.mapVisible) {
      setTimeout(() => {
        this.map.resize();
      }, 300);
    }
  }
}
