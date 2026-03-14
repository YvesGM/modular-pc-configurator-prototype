-- Case <-> PSU "form_factor/supported size"
-- ATX
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'case'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'atx_power_supply'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'psu_support'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'psu_form_factor'
        ),
        'equals',
        'Case must support the PSU form factor of the selected ATX power supply'
    );

-- SFX
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'case'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'sfx_power_supply'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'psu_support'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'psu_form_factor'
        ),
        'equals',
        'Case must support the PSU form factor of the selected SFX power supply'
    );

-- Case <-> Motherboard "form_factor/supported size"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'case'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'supported_motherboard_sizes'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'motherboard_form_factor'
        ),
        'equals',
        'Case must support the selected motherboard form factor'
    );

-- Motherboard <-> CPU "socket"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'cpu'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket_support'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket'
        ),
        'equals',
        'Motherboard socket support must match the CPU socket'
    );

-- CPU <-> Cooler "socket"
-- Air
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'cpu'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'air_cooler'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket_support'
        ),
        'equals',
        'Air cooler must support the socket of the selected CPU'
    );

-- Liquid
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'cpu'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'liquid_cooler'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'socket_support'
        ),
        'equals',
        'Liquid cooler must support the socket of the selected CPU'
    );

-- Motherboard <-> RAM "memory_type"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'ram'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'memory_type'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'memory_type'
        ),
        'equals',
        'Motherboard memory type must match the selected RAM type'
    );

-- Motherboard <-> Fan "connections"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'fan_controller'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'fan_header_type'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'fan_connector'
        ),
        'equals',
        'Motherboard fan header type must match the fan controller connector type'
    );

-- Motherboard <-> Ethernet "PCI-Versions"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'ethernet_card'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        'equals',
        'Motherboard PCIe version must match the PCIe version required by the selected Ethernet card'
    );

-- Motherboard <-> Wi_fi "PCI-Versions"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'wi-fi_card'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        'equals',
        'Motherboard PCIe version must match the PCIe version required by the selected Wi-Fi card'
    );

-- Motherboard <-> RGB "connections"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'rgb_lighting'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'rgb_header_type'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'rgb_connector'
        ),
        'equals',
        'Motherboard RGB header type must match the RGB connector type of the selected lighting component'
    );

-- Motherboard <-> PCIe Expansion "PCI-Versions"
INSERT INTO
    compatibility_rules (
        component_type_a,
        component_type_b,
        attribute_a,
        attribute_b,
        rule_type,
        description
    )
VALUES
    (
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'motherboard'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'pcie_expansion_card'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'pcie_version'
        ),
        'equals',
        'Motherboard PCIe version must match the PCIe version required by the selected expansion card'
    );