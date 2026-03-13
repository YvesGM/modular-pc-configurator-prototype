-- CPU <-> Motherboard "socket"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='cpu'),
    (SELECT id FROM component_types WHERE name='motherboard'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    'equals',
    'CPU socket must match motherboard socket'
);

-- CPU <-> Air Cooler "socket"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='cpu'),
    (SELECT id FROM component_types WHERE name='air_cooler'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    'equals',
    'CPU socket must be supported by air cooler'
);

-- CPU <-> Liquid Cooler "socket"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='cpu'),
    (SELECT id FROM component_types WHERE name='liquid_cooler'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='socket'),
    'equals',
    'CPU socket must be supported by liquid cooler'
);

-- GPU <-> Case "gpu_length <= max_gpu_length"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='gpu'),
    (SELECT id FROM component_types WHERE name='case'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='gpu_length'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='max_gpu_length'),
    'less_equal',
    'GPU length must fit inside the case'
);

-- RAM <-> Motherboard "memory"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='ram'),
    (SELECT id FROM component_types WHERE name='motherboard'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='memory_type'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='memory_support'),
    'equals',
    'RAM type must be supported by motherboard'
);

-- Motherboard <-> Case "form_factor"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='motherboard'),
    (SELECT id FROM component_types WHERE name='case'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='form_factor'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='form_factor'),
    'equals',
    'Motherboard form factor must match case support'
);

-- PSU <-> Case "form_faktor"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='atx_power_supply'),
    (SELECT id FROM component_types WHERE name='case'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='form_factor'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='form_factor'),
    'equals',
    'PSU form factor must match case support'
);

-- Air Cooler <-> Case "cooler_height <= max_cooler_height"
INSERT INTO compatibility_rules
(component_type_a, component_type_b, attribute_a, attribute_b, rule_type, description)
VALUES
(
    (SELECT id FROM component_types WHERE name='air_cooler'),
    (SELECT id FROM component_types WHERE name='case'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='cooler_height'),
    (SELECT id FROM attribute_definitions WHERE attribute_name='max_cooler_height'),
    'less_equal',
    'Air cooler height must fit inside the case'
);

