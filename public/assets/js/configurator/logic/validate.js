import { selectedComponents } from "../state/selectionState.js";
import { validateConfig } from "../api/validateConfig.js";
import { applyValidationUI } from "../ui/validationUI.js";

export async function validateLive() {

    const selected = Array.from(selectedComponents);

    if (selected.length < 2) {
        document.querySelectorAll(".component-card")
            .forEach(card => {
                card.classList.remove("valid", "invalid");
                card.title = "";
            });
        return;
    }

    const data = await validateConfig(selected);

    if (data.status !== "success") {
        console.error(data.message);
        return;
    }

    applyValidationUI(data.data);
}