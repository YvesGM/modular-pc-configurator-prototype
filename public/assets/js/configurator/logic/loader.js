import { fetchData } from "../api/fetchData.js";
import { componentMap } from "../state/selectionState.js";
import { renderConfigurator } from "./render.js";

let frontendDataCache = [];

export async function loadComponents() {

    const fetchedData = await fetchData();

    if (fetchedData.status !== "success") {
        console.error(fetchedData.message);
        return;
    }

    frontendDataCache = fetchedData.data;

    frontendDataCache.forEach(comps => {
        componentMap[comps.id] = comps;
    });

    renderConfigurator(frontendDataCache);
}

export function getFrontendDataCache() {
    return frontendDataCache;
}