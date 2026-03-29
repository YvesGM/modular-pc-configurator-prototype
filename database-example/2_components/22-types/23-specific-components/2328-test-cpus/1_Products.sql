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
    -- # 111
    (
        'Test CPU Alpha',
        23,
        'TestBrand',
        'Alpha-1000',
        0.00,
        1,
        1,
        'Dummy CPU used for testing system compatibility and UI rendering'
    ),
    -- # 112
    (
        'Test CPU Beta',
        23,
        'TestBrand',
        'Beta-2000',
        0.00,
        1,
        1,
        'Dummy CPU used for testing filtering and compatibility rules'
    ),
    -- # 113
    (
        'Test CPU Gamma',
        23,
        'TestBrand',
        'Gamma-3000',
        0.00,
        1,
        1,
        'Dummy CPU used for testing advanced configurator scenarios'
    );