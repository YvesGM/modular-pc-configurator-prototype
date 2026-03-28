export function renderResults(config, container) {

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

    container.innerHTML = html;
}