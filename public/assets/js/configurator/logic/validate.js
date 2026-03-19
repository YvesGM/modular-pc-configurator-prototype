import { selectedComponents } from "../state/selectionState.js";
import { validateConfig } from "../api/validateConfig.js";
import { applyValidationUI } from "../ui/validationUI.js";

export async function validateLive() {

    const selectedComps = Array.from(selectedComponents);

    if (selectedComps.length < 2) {
        document.querySelectorAll(".component_card")
            .forEach(card => {
                card.classList.remove("valid", "invalid");
                card.title = "";
            });
        return;
    }

    const data = await validateConfig(selectedComps);

    if (data.status !== "success") {
        console.error(data.message);
        return;
    }

    applyValidationUI(data.data);
}