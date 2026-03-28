import { SELECTEDCOMPONENTS } from "../../../init/globalStates.js";
import { renderResults } from "../../templates/resultsTemplate.js";

export async function sendConfig() {

    const selected = Array.from(SELECTEDCOMPONENTS);

    const res = await fetch("configure.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            componentIds: selected,
            currency: "EUR"
        })
    });

    const configurationBuild = await res.json();
    const config = configurationBuild.data;
    const clientOutput = document.getElementById("output");
    renderResults(config, clientOutput);

}

window.sendConfig = sendConfig;

export async function sendSimpleConfig(input) {
    const res = await fetch("simpleModeConfigure.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(input)
    });

    return res.json();
}

window.sendSimpleConfig = sendSimpleConfig;