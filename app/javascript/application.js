// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()
import "@37signals/lexxy"

import "./controllers"

// FlyonUI
// import "flyonui/flyonui"
import "flyonui/dist/dropdown"
import "flyonui/dist/accordion"
import "flyonui/dist/carousel"
import "flyonui/dist/remove-element"
import "flyonui/dist/tabs"
import "flyonui/dist/overlay"

document.addEventListener('turbo:load', function() {
    // Load plugins preline flyonui
    HSDropdown.autoInit();
    HSAccordion.autoInit();
    HSCarousel.autoInit();
    HSRemoveElement.autoInit();
    HSTabs.autoInit();
    HSOverlay.autoInit();
    window.HSStaticMethods?.autoInit();
    // HSOverlay.autoInit();
    // HSSelect.autoInit();


});