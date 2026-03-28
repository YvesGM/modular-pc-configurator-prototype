import { SELECTEDCOMPONENTS, COMPONENTMAP } from "../../../../init/globalStates.js";
import { selectionRules } from "../../configs/selectionRules.js";

import { renderSelectedComponents } from "../../../render/renderSelection.js";
import { getDynamicConstraints } from "../validation/constraints.js";
import { validateLive } from "../validation/validate.js";

export function toggleComponent(componentId, componentEl, componentType) {

    const rule = selectionRules[componentType] || { mode: "single" };
    const constraints = getDynamicConstraints();

    if (componentType === "gpu") {

        if (constraints.maxGpuLength) {

            let gpuLength = COMPONENTMAP[componentId].attributes?.gpu_length ?? 0;

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

    if (componentType === "ram") {
        const maxSlots = constraints.maxRam;

        if (maxSlots != null) {
            let totalModules = 0;

            for (const cid of SELECTEDCOMPONENTS) {
                const comp = COMPONENTMAP[cid];
                if (!comp) continue;

                if (comp.component_type === "ram") {
                    let modules = comp.attributes?.modules ?? 0;
                    if (Array.isArray(modules)) {
                        modules = modules[0];
                    }
                    totalModules += parseInt(modules) || 0;
                }
            }

            let newModules = COMPONENTMAP[componentId]?.attributes?.modules ?? 0;
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
        document.querySelectorAll(`.component_card[data-type="${componentType}"]`)
            .forEach(componentEl => componentEl.classList.remove("selected"));

        for (let compId of SELECTEDCOMPONENTS) {
            if (COMPONENTMAP[compId].component_type === componentType) {
                SELECTEDCOMPONENTS.delete(compId);
            }
        }

        SELECTEDCOMPONENTS.add(componentId);
        componentEl.classList.add("selected");
    }

    else if (rule.mode === "multiple") {

        if (SELECTEDCOMPONENTS.has(componentId)) {
            SELECTEDCOMPONENTS.delete(componentId);
            componentEl.classList.remove("selected");
            renderSelectedComponents();
            validateLive();
            return;
        }

        const currentCount = Array.from(SELECTEDCOMPONENTS)
            .filter(cid => COMPONENTMAP[cid].component_type === componentType).length;

        let maxAllowed = rule.max;
        if (componentType === "hdd" && constraints.maxHdd !== null) {
            maxAllowed = constraints.maxHdd;
        }

        if (componentType !== "ram" && maxAllowed && currentCount >= maxAllowed) {
            alert(`Max ${maxAllowed} ${componentType} allowed`);
            return;
        }

        SELECTEDCOMPONENTS.add(id);
        componentEl.classList.add("selected");
    }

    renderSelectedComponents();
    validateLive();

}

export function removeComponent(componentId) {

    SELECTEDCOMPONENTS.delete(componentId);
    document.querySelectorAll(".component_card").forEach(card => {
        if (parseInt(card.dataset.id) === componentId) {
            card.classList.remove("selected", "valid", "invalid");
        }
    });

    renderSelectedComponents();
    validateLive();
}