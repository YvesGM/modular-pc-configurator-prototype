import { selectedComponents, componentMap } from "../state/selectionState.js";
import { renderSelectedComponents } from "../ui/selectedUI.js";
import { selectionRules } from "./selectionRules.js";
import { getDynamicConstraints } from "./constraints.js";
import { validateLive } from "./validate.js";

export function toggleComponent(id, element, type) {
    const rule = selectionRules[type] || { mode: "single" };
    const constraints = getDynamicConstraints();

    if (type === "gpu") {

        if (constraints.maxGpuLength) {

            let gpuLength = componentMap[id].attributes?.gpu_length ?? 0;

            if (Array.isArray(gpuLength)) {
                gpuLength = gpuLength[0];
            }

            gpuLength = parseInt(gpuLength || 0);

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