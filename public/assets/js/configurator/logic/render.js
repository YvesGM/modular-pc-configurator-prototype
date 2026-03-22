import { componentsUI } from "../ui/componentsUI.js";

export function renderConfigurator(frontendData) {

    const compContainer = document.getElementById("component-container");
    if (!compContainer) {
        console.error("Container not found!");
        return;
    }
    compContainer.innerHTML = "";

    componentsUI(frontendData, compContainer);
}