export default async function fetchExpertComponents() {
    const expertComponents = await fetch(`./modular-pc-configurator-prototyp/backend/endpoints/componentsExpert.php`);
    
    return await expertComponents.json();
}