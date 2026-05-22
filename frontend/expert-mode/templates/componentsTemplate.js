export function componentTypeSectionTemplate(componentType) {
    const typeSection = document.createElement("div");
    typeSection.className = "component_type_section";

    typeSection.innerHTML = `
    <h2>${componentType.toUpperCase()}</h2>
    `;

    return typeSection;
};

export function componentCardTemplate(component) {
    const componentCard = document.createElement("div");
    componentCard.className = "component_card";

    componentCard.innerHTML = `
        <div class="component_card_content">
            <strong>${component.name}</strong><br>
            <small>${component.brand}</small><br>
            ${component.net_price} ${component.currency_symbol}
        </div>
        <div class="card_errors"></div> 
    `;

    componentCard.dataset.type = component.component_type;
    componentCard.dataset.id = component.id;

    return componentCard
};