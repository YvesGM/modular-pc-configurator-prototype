import startTemplate from "./logic/templates/startTemplate.js";
import { getExpertList } from "../js/logic/helpers/getExpertComponents.js";
import { setConfiguratorMode } from "./logic/render/renderConfigurator.js";


window.onload = async () => {
    startTemplate();

    // const simpleButton = document.getElementById("simple-btn");
    const expertButton = document.getElementById("expert-btn");

    // simpleButton.onclick = () => { 
    //     setConfiguratorMode("simple") 
    //     alert("aktuell noch keine funktion zugewiesen")
    // };

    expertButton.onclick = async () => { 
        await getExpertList();
        setConfiguratorMode("expert"); };

};