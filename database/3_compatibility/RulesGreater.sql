-- PSU <-> GPU "wattage >= gpu_power_draw_recomended_psu"
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
                name = 'atx_power_supply'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'gpu'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'wattage'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'gpu_power_draw_recommended_psu'
        ),
        'greater_equal',
        'ATX power supply wattage must meet or exceed the recommended PSU wattage for the selected GPU'
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
                name = 'sfx_power_supply'
        ),
        (
            SELECT
                id
            FROM
                component_types
            WHERE
                name = 'gpu'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'wattage'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'gpu_power_draw_recommended_psu'
        ),
        'greater_equal',
        'SFX power supply wattage must meet or exceed the recommended PSU wattage for the selected GPU'
    );

-- Motherboard <-> RAM "ram_max_speed >= speed"
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
                attribute_name = 'ram_max_speed'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'speed'
        ),
        'greater_equal',
        'Motherboard maximum RAM speed must meet or exceed the speed of the selected RAM kit'
    );

-- Motherboard <-> RAM "max_memory >= memory_size"
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
                attribute_name = 'max_memory'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'memory_size'
        ),
        'greater_equal',
        'Motherboard maximum memory capacity must meet or exceed the capacity of the selected RAM kit'
    );

-- Motherboard <-> RAM "ram_slots >= modules"
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
                attribute_name = 'ram_slots'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'modules'
        ),
        'greater_equal',
        'Motherboard RAM slot count must meet or exceed the number of RAM modules in the selected kit'
    );