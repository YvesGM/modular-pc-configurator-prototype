import { loadComponents } from "./logic/loader.js";
import { setConfiguratorMode } from "./logic/render.js";

window.onload = async () => {
    await loadComponents();
    document.getElementById("expert-btn").onclick = () => setConfiguratorMode("expert");
    document.getElementById("simple-btn").onclick = () => setConfiguratorMode("simple");
};