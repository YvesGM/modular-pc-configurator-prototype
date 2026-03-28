import { FRONTENDCACHE } from "./globalStates.js";
import emtemplate from "../expert-mode/templates/em_template.js"
import renderExpertMode from "../expert-mode/render/renderExpertMode.js";
// import { renderSimpleModeUi } from "./simpleModeUi.js";

let currentMode = "";

export function renderConfigurator(frontendData) {

    // if (currentMode === "simple") {
    //     renderSimpleModeUi(frontendData, componentList);
    //     return;
    // };

    if (currentMode === "expert") {
        const compoList = loadExpertModeTemplate();
        renderExpertMode(frontendData, compoList);
        return;
    }
}

export function setConfiguratorMode(mode) {
    currentMode = mode;
    renderConfigurator(FRONTENDCACHE);
}

function loadExpertModeTemplate() {
    emtemplate();

    const componentList = document.getElementById("component-list");
    if (!componentList) {
        throw new Error("component-list not found");
    }
    componentList.innerHTML = "";
    
    return componentList;
}