export default async function fetchExpertComponents() {
    try {
        const expertComponents = await fetch(`/modular-pc-configurator-prototyp/public/frontend/expert-mode/api/components/componentsExpert.php`);

        if (!expertComponents.ok) {
            return { 
                status: "error", 
                message: `HTTP-Fehler der Expertenkomponenten: ${expertComponents.status}`
            };
        }

        return await expertComponents.json();

    } catch (error) {
        return { 
            status: "error", 
            message: "Fehler beim Abrufen der Expertenkomponenten"
        };
    }
}