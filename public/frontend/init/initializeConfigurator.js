import startTemplate from "./startTemplate.js";
import loadComponentsListExpert from "../expert-mode/storage/loadComponentsList.js";
import { setConfiguratorMode } from "./renderConfigurator.js";


window.onload = async () => {
    startTemplate();

    // const simpleButton = document.getElementById("simple-btn");
    const expertButton = document.getElementById("expert-btn");

    // simpleButton.onclick = () => { 
    //     setConfiguratorMode("simple") 
    //     alert("aktuell noch keine funktion zugewiesen")
    // };

    expertButton.onclick = async () => { 
        await loadComponentsListExpert();
        setConfiguratorMode("expert"); };

};