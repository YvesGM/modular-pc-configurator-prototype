-- Case <-> GPU "gpu_length <= max_gpu_length"
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
                name = 'gpu'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'max_gpu_length'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'gpu_length'
        ),
        'less_equal',
        'GPU length must not exceed the maximum GPU length supported by the case'
    );

-- Case <-> Air-Cooler "cooler_height <= max_cooler_height"
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
                name = 'air_cooler'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'max_cooler_height'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'cooler_height'
        ),
        'less_equal',
        'Air cooler height must not exceed the maximum cooler height supported by the case'
    );

-- Case <-> Liquid-Cooler "radiator_size <= max_radiator_sizes"
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
                name = 'liquid_cooler'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'max_radiator_sizes'
        ),
        (
            SELECT
                id
            FROM
                attribute_definitions
            WHERE
                attribute_name = 'radiator_size'
        ),
        'less_equal',
        'Liquid cooler radiator size must not exceed the maximum radiator size supported by the case'
    );