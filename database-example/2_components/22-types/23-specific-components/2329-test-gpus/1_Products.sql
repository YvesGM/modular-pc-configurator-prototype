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
    -- # 114
    (
        'Test GPU Alpha',
        24,
        'TestBrand',
        'GPU-A1',
        0.00,
        1,
        1,
        'Dummy GPU used for compatibility testing'
    ),
    -- # 115
    (
        'Test GPU Beta',
        24,
        'TestBrand',
        'GPU-B2',
        0.00,
        1,
        1,
        'Dummy GPU used for UI and configuration testing'
    ),
    -- # 116
    (
        'Test GPU Gamma',
        24,
        'TestBrand',
        'GPU-C3',
        0.00,
        1,
        1,
        'Dummy GPU for stress testing configuration rules'
    );