const BASE_URL = "/modular-pc-configurator-prototyp/public"

export default async function fetchComponentsExpert() {
    const fetchedComponents = await fetch(`${BASE_URL}/frontend/expert-mode/api/components/componentsExpert.php`);
    return await fetchedComponents.json();
}