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

    html += ` 
        <div class="config_result ${config.compatibility.is_valid ? "valid" : "invalid"}">
            <div class="result_header">
                ${config.compatibility.is_valid ? "Configuration valid" : "Configuration invalid"}
            </div>

            <div class="result_checks"></div>
        </div>
    `;

    config.compatibility.checks.forEach(check => {
        check.rules_checked.forEach(rule => {
            html += `
                <div class="check_item ${rule.passed ? "pass" : "fail"}" >
                    <span class="check_icon">
                        ${rule.passed ? "✔" : "✖"}
                    </span>
                    <span class="check_text">${rule.description}</span>
                </div>
            `;
        });
    });

    html += `
        <div class="result_footer">
            <span>Total</span>
            <strong>${config.pricing.gross_total.toFixed(2)} ${config.pricing.currency}</strong>
        </div>
    `;

    clientOutput.innerHTML = html;

}

window.sendConfig = sendConfig;