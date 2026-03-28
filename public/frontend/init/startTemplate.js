export default function startTemplate() {
    const configuratorRef = document.getElementById("configurator");
    configuratorRef.innerHTML = `
        <div class="mode_switch">
                <button id="expert-btn">Expert Mode</button>
                <button id="simple-btn">Simple Mode</button>
        </div>

        <div class="configurator_container" id="configurator-container">
        </div>
        `;
}