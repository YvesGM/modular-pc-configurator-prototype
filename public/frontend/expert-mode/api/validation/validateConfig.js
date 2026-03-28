export async function validateConfig(componentIds) {
    const res = await fetch("configureExpert.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            componentIds,
            currency: "EUR"
        })
    });

    return await res.json();
}