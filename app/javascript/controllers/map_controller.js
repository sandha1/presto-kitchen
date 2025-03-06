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
      center: [1.888334, 46.603354],
      zoom: 4
    });

    this.addMarkersToMap();
  }

  addMarkersToMap() {
    console.log(this.markersValue);
    this.markersValue.forEach((marker) => {

        new mapboxgl.Marker()
          .setLngLat([marker.longitude, marker.latitude])
          .setPopup(new mapboxgl.Popup().setHTML(`<strong>${marker.name}</strong><br>${marker.address}`))
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
