import { componentTypeSectionTemplate, componentCardTemplate } from "../templates/componentsTemplate.js";

import { toggleComponent } from "../engine/logic/selection/selection.js";

export default function renderExpertMode(componentList, compListContainer) {
    const groupedComponents = {};

    componentList.forEach(component => {
        if (!groupedComponents[component.component_type]) {
            groupedComponents[component.component_type] = [];
        }
        groupedComponents[component.component_type].push(component);
    });

    for (const componentType in groupedComponents) {

        const typeSection = componentTypeSectionTemplate(componentType);

        groupedComponents[componentType].forEach(component => {
            const componentCard = componentCardTemplate(component);
            
            componentCard.onclick = () => toggleComponent(component.id, componentCard, component.component_type);

            typeSection.appendChild(componentCard);
        });

        compListContainer.appendChild(typeSection);
    }
}