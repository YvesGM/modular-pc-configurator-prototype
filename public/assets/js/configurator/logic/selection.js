import { selectedComponents, componentMap } from "../state/selectionState.js";
import { selectionRules } from "./selectionRules.js";
import { getDynamicConstraints } from "./constraints.js";
import { validateLive } from "./validate.js";

export function toggleComponent(id, element, type) {
    const rule = selectionRules[type] || { mode: "single" };
    const constraints = getDynamicConstraints();

    if (type === "gpu") {

        if (constraints.maxGpuLength) {

            const gpuLength = parseInt(componentMap[id].attributes?.gpu_length[0] || 0);

            if (gpuLength > constraints.maxGpuLength) {
                alert("GPU too long for selected case");
                return;
            }
        }
    }

    if (rule.mode === "single") {
        document.querySelectorAll(`.component-card[data-type="${type}"]`)
            .forEach(el => el.classList.remove("selected"));

        for (let compId of selectedComponents) {
            if (componentMap[compId].component_type === type) {
                selectedComponents.delete(compId);
            }
        }

        selectedComponents.add(id);
        element.classList.add("selected");
    }

    else if (rule.mode === "multiple") {

        if (selectedComponents.has(id)) {
            selectedComponents.delete(id);
            element.classList.remove("selected");
            renderSelectedComponents();
            validateLive();
            return;
        }

        const currentCount = Array.from(selectedComponents)
            .filter(cid => componentMap[cid].component_type === type).length;

        let maxAllowed = rule.max;

        // dynamisch überschreiben
        if (type === "hdd" && constraints.maxHdd !== null) {
            maxAllowed = constraints.maxHdd;
        }

        if (maxAllowed && currentCount >= maxAllowed) {
            alert(`Max ${maxAllowed} ${type} allowed`);
            return;
        }

        selectedComponents.add(id);
        element.classList.add("selected");
    }

    renderSelectedComponents();
    validateLive();
}

function renderSelectedComponents() {

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

            item.innerHTML = `
                ${comp.name}
                <button onclick="removeComponent(${comp.id})">❌</button>
            `;

            section.appendChild(item);
        });

        container.appendChild(section);
    }

}

export function removeComponent(id) {

    selectedComponents.delete(id);

    document.querySelectorAll(".component-card").forEach(card => {
        if (parseInt(card.dataset.id) === id) {
            card.classList.remove("selected", "valid", "invalid");
        }
    });

    renderSelectedComponents();
    validateLive();
}