INSERT INTO
    components (
        name,
        type_id,
        brand,
        model,
        net_price,
        currency_id,
        tax_class_id,
        description
    )
VALUES
    -- # 117
    (
        'Test RAM 16GB Kit',
        3,
        'TestBrand',
        'RAM-16',
        0.00,
        1,
        1,
        'Dummy RAM module for compatibility testing'
    ),
    -- # 118
    (
        'Test RAM 32GB Kit',
        3,
        'TestBrand',
        'RAM-32',
        0.00,
        1,
        1,
        'Dummy RAM module for performance testing'
    ),
    -- # 119
    (
        'Test RAM 64GB Kit',
        3,
        'TestBrand',
        'RAM-64',
        0.00,
        1,
        1,
        'Dummy RAM module for extreme configuration testing'
    );