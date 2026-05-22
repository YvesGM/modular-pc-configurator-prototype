export async function validateConfig(componentIds) {
    const fetchedValidation = await fetch(`/modular-pc-configurator-prototyp/public/frontend/expert-mode/api/validation/validateExpert.php`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            componentIds,
            currency: "EUR"
        })
    });

    if (!fetchedValidation.ok) {
        console.error("Request failed:", fetchedValidation.status);
        return;
    }

    return await fetchedValidation.json();
}