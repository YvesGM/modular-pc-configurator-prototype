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
    -- #96
    (
        'Microsoft Windows 11 Home',
        20,
        'Microsoft',
        'Windows 11 Home',
        129.99,
        1,
        1,
        'Consumer operating system designed for gaming and everyday desktop computing'
    ),
    -- #97
    (
        'Microsoft Windows 11 Pro',
        20,
        'Microsoft',
        'Windows 11 Pro',
        199.99,
        1,
        1,
        'Professional edition of Windows 11 offering advanced security and management features'
    ),
    -- #98
    (
        'Ubuntu Desktop 24.04 LTS',
        20,
        'Canonical',
        'Ubuntu 24.04 LTS',
        0.00,
        1,
        1,
        'Popular Linux distribution designed for desktop systems with long term support'
    ),
    -- #99
    (
        'Fedora Workstation',
        20,
        'Fedora Project',
        'Fedora Workstation',
        0.00,
        1,
        1,
        'Cutting edge Linux distribution focused on developers and modern desktop environments'
    ),
    -- # 100
    (
        'Windows 10 Pro',
        20,
        'Microsoft',
        'Windows 10 Pro',
        149.99,
        1,
        1,
        'Professional Windows operating system widely used in business environments'
    );