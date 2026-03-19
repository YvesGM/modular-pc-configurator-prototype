import { toggleComponent } from "../logic/selection.js";

export function componentsUI(components, container) {
    const grouped = {};

    components.forEach(c => {
        if (!grouped[c.component_type]) {
            grouped[c.component_type] = [];
        }
        grouped[c.component_type].push(c);
    });

    for (const type in grouped) {

        const section = document.createElement("div");
        section.className = "component-section";

        section.innerHTML = `<h3>${type.toUpperCase()}</h3>`;

        grouped[type].forEach(c => {

            const card = document.createElement("div");
            card.className = "component-card";

            card.innerHTML = `
                <div class="card-content">
                    <strong>${c.name}</strong><br>
                    <small>${c.brand}</small><br>
                    ${c.net_price} €
                </div>
                <div class="card-errors"></div>
            `;

            card.dataset.type = c.component_type;
            card.dataset.id = c.id;

            card.onclick = () => toggleComponent(c.id, card, c.component_type);

            section.appendChild(card);
        });

        container.appendChild(section);
    }
}