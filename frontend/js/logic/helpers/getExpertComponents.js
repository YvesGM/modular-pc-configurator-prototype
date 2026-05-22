import fetchExpertComponents from "../../api/fetchComponentsExpert.js";
import { COMPONENTMAP, FRONTENDCACHE } from "../globalStates.js";

export async function getExpertList() {

    const expertComponents = await fetchExpertComponents();

    if (expertComponents.status !== "success") {
        console.error(expertComponents.message);
        return;
    }

    FRONTENDCACHE.length = 0;
    FRONTENDCACHE.push(...expertComponents.data);

    FRONTENDCACHE.forEach(component => {
        COMPONENTMAP[component.id] = component;
    });
}