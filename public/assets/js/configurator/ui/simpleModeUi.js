import { sendSimpleConfig } from "../api/sendConfig.js";
import { renderResults } from "./resultsUi.js";
import { selectedComponents } from "../state/selectionState.js";
import { renderSelectedComponents } from "./selectedUI.js";

export function renderSimpleModeUi(frontendData, container ) {

    container.innerHTML = `
        <div class="simple_mode">
            <h2>Simple Mode</h2>

            <select id="simple-usecase">
                <option value="gaming">Gaming</option>
                <option value="office">Office</option>
                <option value="workstation">Workstation</option>
            </select>

            <button id="simple-generate-btn">Generate</button>
        </div>
    `;

    const btn = container.querySelector("#simple-generate-btn");
    btn.addEventListener("click", () => handleSimpleMode(frontendData));
}

async function handleSimpleMode() {

    const useCase = document.getElementById("simple-usecase").value;

    const input = {
        useCase,
    };

    const result = await sendSimpleConfig(input);

    if (!result || result.status !== "success") {
        console.error(result);
        return;
    }

    const config = result.data;

    selectedComponents.clear();

    config.components.forEach(comp => {
        selectedComponents.add(comp.id);
    });

    renderSelectedComponents();

    const output = document.getElementById("output");
    renderResults(config, output);
}