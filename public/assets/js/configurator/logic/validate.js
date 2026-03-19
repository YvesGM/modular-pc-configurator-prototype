import { selectedComponents } from "../state/selectionState.js";
import { validateConfig } from "../api/validateConfig.js";

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

function applyValidationUI(config) {

    const allCards = document.querySelectorAll(".component-card");

    allCards.forEach(card => {
        card.classList.remove("valid", "invalid");
        card.title = "";

        const errorDiv = card.querySelector(".card-errors");
        if (errorDiv) errorDiv.innerHTML = "";
    });

    let invalidIds = new Set();
    let errorMap = {};

    config.compatibility.checks.forEach(check => {

        check.rules_checked.forEach(rule => {

            if (!rule.passed) {

                invalidIds.add(rule.component_a_id);
                invalidIds.add(rule.component_b_id);

                if (!errorMap[rule.component_a_id]) {
                    errorMap[rule.component_a_id] = [];
                }

                if (!errorMap[rule.component_b_id]) {
                    errorMap[rule.component_b_id] = [];
                }

                errorMap[rule.component_a_id].push(rule.description);
                errorMap[rule.component_b_id].push(rule.description);
            }
        });
    });

    // markieren
    allCards.forEach(card => {

        const id = parseInt(card.dataset.id);

        if (!selectedComponents.has(id)) return;

        const errorDiv = card.querySelector(".card-errors");

        if (invalidIds.has(id)) {

            card.classList.add("invalid");

            if (errorMap[id] && errorDiv) {

                errorMap[id].forEach(err => {

                    const el = document.createElement("div");
                    el.className = "error-line";
                    el.textContent = "❌ " + err;

                    errorDiv.appendChild(el);
                });
            }

        } else {
            card.classList.add("valid");
        }
    });

}