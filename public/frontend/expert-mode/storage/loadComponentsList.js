import fetchComponentsExpert from "../api/components/fetchComponentsExpert.js";
import { COMPONENTMAP, FRONTENDCACHE } from "../../init/globalStates.js";

export default async function loadComponentsListExpert() {

    const fetchedComponents = await fetchComponentsExpert();

    if (fetchedComponents.status !== "success") {
        console.error(fetchedComponents.message);
        return;
    }

    FRONTENDCACHE.length = 0;
    FRONTENDCACHE.push(...fetchedComponents.data);

    FRONTENDCACHE.forEach(component => {
        COMPONENTMAP[component.id] = component;
    });
}