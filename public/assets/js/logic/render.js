import { componentsUI } from "../../../ui/modes/renderExpertMode.js";
import { renderSimpleModeUi } from "../../../frontend/simple-mode/simpleModeUi.js";

let currentMode = "expert";
let cachedData = [];

export function renderConfigurator(frontendData) {

    if (frontendData && frontendData.length > 0) {
        cachedData = frontendData;
    }

    const compContainer = document.getElementById("component-container");

    if (!compContainer) {
        console.error("Container not found!");
        return;
    }

    compContainer.innerHTML = "";

    if (currentMode === "simple") {
        renderSimpleModeUi(cachedData, compContainer);
        return;
    }

    componentsUI(cachedData, compContainer);
}

export function setConfiguratorMode(mode) {
    currentMode = mode;
    renderConfigurator(cachedData);
}