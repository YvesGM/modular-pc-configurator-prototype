
import { selectedComponents, componentMap } from "../state/selectionState.js";
import { removeComponent } from "../logic/selection.js";

export function renderSelectedComponents() {

    const container = document.getElementById("selected-container");
    container.innerHTML = "";

    const groupedComponents = {};

    // Gruppieren nach Typ
    selectedComponents.forEach(id => {
        const component = componentMap[id];

        if (!groupedComponents[component.component_type]) {
            groupedComponents[component.component_type] = [];
        }

        groupedComponents[component.component_type].push(component);
    });

    // UI bauen
    for (const componentType in groupedComponents) {

        const typeSection = document.createElement("div");
        typeSection.className = "selected_section";

        const title = document.createElement("h4");
        title.textContent = componentType.toUpperCase();

        typeSection.appendChild(title);

        groupedComponents[componentType].forEach(comp => {

            const item = document.createElement("div");
            item.className = "selected_item";

            const label = document.createElement("span");
            label.textContent = comp.name;

            const btn = document.createElement("button");
            btn.textContent = "❌";
            btn.onclick = () => removeComponent(comp.id);

            item.appendChild(label);
            item.appendChild(btn);
        });

        container.appendChild(typeSection);
    }

}