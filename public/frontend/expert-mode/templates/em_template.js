export default function emtemplate() {
    let configuratorContainer = document.getElementById("configurator-container");
    configuratorContainer.innerHTML = `
        <div class="component_section">
            <label for="component-list">Components</label>
            <div class="component_list" id="component-list"></div>
        </div>
        
        <div class="selected_section">
            <h3>Selected Components</h3>
            <div id="selected-container" class="selected_container"></div>
        </div>

        <button onclick="sendConfig()">Check Configuration</button>
    `;
};