
import { selectedComponents, componentMap } from "../state/selectionState.js";
import { removeComponent } from "../logic/selection.js";

export function renderSelectedComponents() {

    const container = document.getElementById("selected-container");
    container.innerHTML = "";

    const grouped = {};

    // Gruppieren nach Typ
    selectedComponents.forEach(id => {
        const comp = componentMap[id];

        if (!grouped[comp.component_type]) {
            grouped[comp.component_type] = [];
        }

        grouped[comp.component_type].push(comp);
    });

    // UI bauen
    for (const type in grouped) {

        const section = document.createElement("div");
        section.className = "selected-section";

        const title = document.createElement("h4");
        title.textContent = type.toUpperCase();

        section.appendChild(title);

        grouped[type].forEach(comp => {

            const item = document.createElement("div");
            item.className = "selected-item";

            const label = document.createElement("span");
            label.textContent = comp.name;

            const btn = document.createElement("button");
            btn.textContent = "❌";
            btn.onclick = () => removeComponent(comp.id);

            item.appendChild(label);
            item.appendChild(btn);
        });

        container.appendChild(section);
    }

}