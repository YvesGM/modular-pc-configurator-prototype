import { SELECTEDCOMPONENTS } from "../../../../init/globalStates.js";
import { validateConfig } from "../../../api/validation/validateConfig.js";
import { applyValidationUI } from "../../../ui/validationUi.js";

export async function validateLive() {

    const selectedComps = Array.from(SELECTEDCOMPONENTS);

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