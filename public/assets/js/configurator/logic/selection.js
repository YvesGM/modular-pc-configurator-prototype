import { selectedComponents, componentMap } from "../state/selectionState.js";
import { renderSelectedComponents } from "../ui/selectedUI.js";
import { selectionRules } from "./selectionRules.js";
import { getDynamicConstraints } from "./constraints.js";
import { validateLive } from "./validate.js";

export function toggleComponent(id, componentEl, type) {
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

    if (type === "ram") {
        const maxSlots = constraints.maxRam;

        if (maxSlots != null) {
            let totalModules = 0;

            for (const cid of selectedComponents) {
                const comp = componentMap[cid];
                if (!comp) continue;

                if (comp.component_type === "ram") {
                    let modules = comp.attributes?.modules ?? 0;
                    if (Array.isArray(modules)) {
                        modules = modules[0];
                    }
                    totalModules += parseInt(modules) || 0;
                }
            }

            let newModules = componentMap[id]?.attributes?.modules ?? 0;
            if (Array.isArray(newModules)) {
                newModules = newModules[0];
            }

            newModules = parseInt(newModules) || 0;
            const futureTotal = totalModules + newModules;
            if (futureTotal > maxSlots) {
                alert(`Max ${maxSlots} RAM slots allowed`);
                return;
            }
        }
    }

    if (rule.mode === "single") {
        document.querySelectorAll(`.component_card[data-type="${type}"]`)
            .forEach(componentEl => componentEl.classList.remove("selected"));

        for (let compId of selectedComponents) {
            if (componentMap[compId].component_type === type) {
                selectedComponents.delete(compId);
            }
        }

        selectedComponents.add(id);
        componentEl.classList.add("selected");
    }

    else if (rule.mode === "multiple") {

        if (selectedComponents.has(id)) {
            selectedComponents.delete(id);
            componentEl.classList.remove("selected");
            renderSelectedComponents();
            validateLive();
            return;
        }

        const currentCount = Array.from(selectedComponents)
            .filter(cid => componentMap[cid].component_type === type).length;

        let maxAllowed = rule.max;
        if (type === "hdd" && constraints.maxHdd !== null) {
            maxAllowed = constraints.maxHdd;
        }

        if (type !== "ram" && maxAllowed && currentCount >= maxAllowed) {
            alert(`Max ${maxAllowed} ${type} allowed`);
            return;
        }

        selectedComponents.add(id);
        componentEl.classList.add("selected");
    }

    renderSelectedComponents();
    validateLive();

}

export function removeComponent(id) {

    selectedComponents.delete(id);
    document.querySelectorAll(".component_card").forEach(card => {
        if (parseInt(card.dataset.id) === id) {
            card.classList.remove("selected", "valid", "invalid");
        }
    });

    renderSelectedComponents();
    validateLive();
}