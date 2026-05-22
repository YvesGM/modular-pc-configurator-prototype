export default function emtemplate() {
    let configuratorContainer = document.getElementById("configurator-container");
    configuratorContainer.innerHTML = `
        
    <div class="component_section">
            <label for="component-list">Expert Mode</label>
            <div class="section_divider"></div>
            <div class="component_list" id="component-list"></div>
        </div>
        
        <div class="section_divider"></div>
        
        <div class="selected_section">
            <h3>Selected Components</h3>
            <div id="selected-container" class="selected_container"></div>
        </div>
        <button onclick="sendConfig()" class="check_button">Check Configuration</button>
        
        <div class="section_divider"></div>

        <div id="output" class="output_box"></div>
    `;
};