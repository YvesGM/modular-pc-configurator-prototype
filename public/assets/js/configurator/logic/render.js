import { componentsUI } from "../ui/componentsUI.js";

export function renderComponents(components) {

    const container = document.getElementById("component-container");
    if (!container) {
        console.error("Container not found!");
        return;
    }
    container.innerHTML = "";

    componentsUI(components, container);
}