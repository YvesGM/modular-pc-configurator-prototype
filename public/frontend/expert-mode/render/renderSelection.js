
import { SELECTEDCOMPONENTS, COMPONENTMAP } from "../../init/globalStates.js";
import { removeComponent } from "../engine/logic/selection/selection.js";

export function renderSelectedComponents() {

    const container = document.getElementById("selected-container");
    container.innerHTML = "";

    const groupedComponents = {};

    SELECTEDCOMPONENTS.forEach(id => {
        const component = COMPONENTMAP[id];

        if (!groupedComponents[component.component_type]) {
            groupedComponents[component.component_type] = [];
        }

        groupedComponents[component.component_type].push(component);
    });

    for (const componentType in groupedComponents) {

        const typeSection = document.createElement("div");
        typeSection.className = "selected_type_section";

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
            btn.classList.add("delete_button")
            btn.onclick = () => removeComponent(comp.id);

            item.appendChild(label);
            item.appendChild(btn);
            
            typeSection.appendChild(item);
        });

        container.appendChild(typeSection);
    }

}