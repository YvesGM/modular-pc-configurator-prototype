import { fetchData } from "../api/fetchData.js";
import { componentMap } from "../state/selectionState.js";
import { renderConfigurator } from "./render.js";

export async function loadComponents() {

    const fetchedData = await fetchData();

    if ((fetchedData.status) !== "success") {
        console.error(fetchedData.message);
        return;
    }

    const frontendData = fetchedData.data;

    frontendData.forEach(comps => {
        componentMap[comps.id] = comps;
    });

    renderConfigurator(frontendData);
}