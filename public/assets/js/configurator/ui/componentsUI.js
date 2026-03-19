import { toggleComponent } from "../logic/selection.js";

export function componentsUI(components, container) {
    const groupedComponents = {};

    components.forEach(component => {
        if (!groupedComponents[component.component_type]) {
            groupedComponents[component.component_type] = [];
        }
        groupedComponents[component.component_type].push(component);
    });

    for (const componentType in groupedComponents) {

        const typeSection = document.createElement("div");
        typeSection.className = "component_section";

        typeSection.innerHTML = `<h3>${componentType.toUpperCase()}</h3>`;

        groupedComponents[componentType].forEach(component => {

            const componentCard = document.createElement("div");
            componentCard.className = "component_card";

            componentCard.innerHTML = `
                <div class="card_content">
                    <strong>${component.name}</strong><br>
                    <small>${component.brand}</small><br>
                    ${component.net_price} €
                </div>
                <div class="card_errors"></div>
            `;

            componentCard.dataset.type = component.component_type;
            componentCard.dataset.id = component.id;

            componentCard.onclick = () => toggleComponent(component.id, componentCard, component.component_type);

            typeSection.appendChild(componentCard);
        });

        container.appendChild(typeSection);
    }
}