import { SELECTEDCOMPONENTS, COMPONENTMAP } from "../../../../init/globalStates.js";

export function getDynamicConstraints() {
    let constraints = {
        maxHdd: null,
        maxGpuLength: null,
        maxRam: null
    };

    SELECTEDCOMPONENTS.forEach(id => {
        const comp = COMPONENTMAP[id];

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
        
        if (comp.component_type === "motherboard") {
            const attrs = comp.attributes || {};

            if (attrs.ram_slots !== undefined) {
                let value = attrs.ram_slots;
                if (Array.isArray(value)) {
                    value = value[0];
                }
                constraints.maxRam = parseInt(value);
            }

        }
    });

    return constraints;
}