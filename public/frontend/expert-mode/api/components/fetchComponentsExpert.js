export default async function fetchComponentsExpert() {
    const fetchedComponents = await fetch(`/modular-pc-configurator-prototyp/public/frontend/expert-mode/api/components/componentsExpert.php`);
    return await fetchedComponents.json();
}