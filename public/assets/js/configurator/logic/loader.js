import { componentMap } from "../state/selectionState.js";
import { renderConfigurator } from "./render.js";
import { fetchComponents } from "../api/fetchComponents.js";

export async function loadComponents() {

    const componentData = await fetchComponents();

    if (componentData.status !== "success") {
        console.error(componentData.message);
        return;
    }

    const components = componentData.data;

    components.forEach(comps => {
        componentMap[comps.id] = comps;
    });

    renderConfigurator(components);
}