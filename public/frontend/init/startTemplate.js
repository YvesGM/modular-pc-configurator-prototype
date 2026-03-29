export default function startTemplate() {
        const configuratorRef = document.getElementById("configurator");
        configuratorRef.innerHTML = `
        <div class="mode_switch">
                <button id="simple-btn" class="mode_button">Simple Mode</button>
                <button id="expert-btn" class="mode_button">Expert Mode</button>
        </div>

        <div class="configurator_container" id="configurator-container">
        </div>
        `;
}