import { selectedComponents } from "../state/selectionState.js";

export async function sendConfig() {

    const selected = Array.from(selectedComponents);

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
    const clientOutput = document.getElementById("output");
    const config = configurationBuild.data;
    let html = "";

    html += config.compatibility.is_valid
        ? "✅ Configuration is VALID\n\n"
        : "❌ Configuration is NOT valid\n\n";

    config.compatibility.checks.forEach(check => {
        check.rules_checked.forEach(rule => {
            html += rule.passed
                ? `✔ ${rule.description}\n`
                : `❌ ${rule.description}\n`;
        });
    });

    html += "\n--------------------\n";
    html += `Total Price: ${config.pricing.gross_total.toFixed(2)} ${config.pricing.currency}`;

    clientOutput.textContent = html;
}

window.sendConfig = sendConfig;