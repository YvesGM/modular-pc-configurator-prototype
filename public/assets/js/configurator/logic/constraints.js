import { selectedComponents, componentMap } from "../state/selectionState.js";

export function getDynamicConstraints() {
    let constraints = {
        maxHdd: null,
        maxGpuLength: null
    };

    selectedComponents.forEach(id => {
        const comp = componentMap[id];

        if (comp.component_type === "case") {
            const attrs = comp.attributes || {};

            if (attrs.drive_bays) {
                let value = attrs.drive_bays;
                if (Array.isArray(value)) {
                    value = value[0];
                }
                constraints.maxHdd = parseInt(value);
            }

            if (attrs.max_gpu_length) {
                let value = attrs.max_gpu_length;

                if (Array.isArray(value)) {
                    value = value[0];
                }

                constraints.maxGpuLength = parseInt(value);
            }
        }
    });

    return constraints;
}