export const selectionRules = {
    cpu: { mode: "single" },
    motherboard: { mode: "single" },
    gpu: { mode: "single" },

    ram: { mode: "multiple", max: 4 },
    hdd: { mode: "multiple", max: 6 },
    fan: { mode: "multiple", max: 6 }
};