import { componentMap } from "../state/selectionState.js";
import { renderComponents } from "./render.js";
import { fetchComponents } from "../api/fetchComponents.js";

export async function loadComponents() {

    const data = await fetchComponents();

    if (data.status !== "success") {
        console.error(data.message);
        return;
    }

    const components = data.data;

    components.forEach(c => {
        componentMap[c.id] = c;
    });

    renderComponents(components);
}