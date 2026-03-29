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
    -- # 101
    (
        'NVIDIA GeForce Game Ready Driver',
        21,
        'NVIDIA',
        'Game Ready Driver',
        0.00,
        1,
        1,
        'Official NVIDIA driver providing optimized support for GeForce graphics cards'
    ),
    -- # 102
    (
        'AMD Adrenalin GPU Driver',
        21,
        'AMD',
        'Adrenalin Edition',
        0.00,
        1,
        1,
        'Official AMD graphics driver package for Radeon GPUs'
    ),
    -- # 103
    (
        'Intel Chipset Device Software',
        21,
        'Intel',
        'Chipset INF Utility',
        0.00,
        1,
        1,
        'Intel chipset driver package ensuring correct recognition of motherboard components'
    ),
    -- # 104
    (
        'Realtek High Definition Audio Driver',
        21,
        'Realtek',
        'HD Audio Driver',
        0.00,
        1,
        1,
        'Audio driver package for Realtek integrated motherboard audio controllers'
    ),
    -- # 105
    (
        'Intel Ethernet Adapter Driver',
        21,
        'Intel',
        'PROSet Ethernet Driver',
        0.00,
        1,
        1,
        'Network driver for Intel ethernet controllers and adapters'
    );