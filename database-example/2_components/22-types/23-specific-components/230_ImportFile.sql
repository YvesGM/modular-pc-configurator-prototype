-- Attributes
INSERT INTO
    attribute_definitions (attribute_name, attribute_unit)
VALUES
    -- CPU #1-#7
    ('socket', NULL),
    ('socket_support', NULL),
    ('cores', NULL),
    ('core_clock', 'MHz'),
    ('cache_size', 'MB'),
    ('tdp', 'W'),
    ('max_memory_speed', 'MHz'),
    -- GPU #8-#14
    ('gpu_memory_type', NULL),
    ('gpu_memory', 'GB'),
    ('gpu_clock', NULL),
    ('gpu_length', 'mm'),
    ('gpu_power_connector', NULL),
    ('gpu_slot_width', 'mm'),
    ('gpu_power_draw_recommended_psu', 'W'),
    -- Memory #15-#20
    ('memory_type', NULL),
    ('memory_channels', NULL),
    ('memory_form_factor', NULL),
    ('memory_size', 'GB'),
    ('modules', NULL),
    ('speed', 'MHz'),
    -- Motherboard #21-#34
    ('chipset', NULL),
    ('ram_slots', NULL),
    ('ram_max_speed', 'MHz'),
    ('max_memory', 'GB'),
    ('m2_slots', NULL),
    ('sata_ports', NULL),
    ('pcie_x16_slots', NULL),
    ('pcie_version', NULL),
    ('ethernet_speed', 'Gbps'),
    ('wifi', NULL),
    ('motherboard_form_factor', NULL),
    ('rgb_header_type', NULL),
    ('fan_header_type', NULL),
    ('fan_header_count', NULL),
    -- Case #35-#42
    ('case_type', NULL),
    ('supported_motherboard_sizes', NULL),
    ('max_gpu_length', 'mm'),
    ('max_cooler_height', 'mm'),
    ('max_radiator_sizes', 'mm'),
    ('radiator_mount_positions', NULL),
    ('psu_support', NULL),
    ('drive_bays', NULL),
    -- PSU #43-#46
    ('wattage', 'W'),
    ('efficiency_rating', NULL),
    ('modularity', NULL),
    ('psu_form_factor', NULL),
    -- Cooling #47-#55
    ('cooling_type', NULL),
    ('cooler_height', 'mm'),
    ('number_of_fans', NULL),
    ('fan_size', 'mm'),
    ('rpm', 'RPM'),
    ('radiator_size', 'mm'),
    ('pump_speed', 'RPM'),
    ('noise_level', 'dB(A)'),
    ('heatsink_material', NULL),
    -- Storage #56-#60
    ('capacity', NULL),
    ('interface', NULL),
    ('read_speed', 'MB/s'),
    ('write_speed', 'MB/s'),
    ('storage_form_factor', NULL),
    -- Physical #61-#66
    ('material', NULL),
    ('weight', 'kg'),
    ('dimensions', 'mm'),
    ('rgb_lighting', NULL),
    ('rgb_connector', NULL),
    ('fan_connector', NULL),
    -- Monitors #67-#75
    ('screen_size', 'inch'),
    ('resolution', NULL),
    ('refresh_rate', 'Hz'),
    ('panel_type', NULL),
    ('response_time', 'ms'),
    ('display_connector', NULL),
    ('aspect_ratio', NULL),
    ('curved', NULL),
    ('adaptive_sync', NULL),
    -- Keyboards #76-#79
    ('keyboard_switch_type', NULL),
    ('keyboard_layout', NULL),
    ('keyboard_connection', NULL),
    ('keyboard_backlight_type', NULL),
    -- Mices #80-#84
    ('mouse_sensor_type', NULL),
    ('mouse_dpi', 'DPI'),
    ('mouse_buttons', NULL),
    ('mouse_connection', NULL),
    ('mouse_weight_adjustable', NULL),
    -- OS #85-#89
    ('os_family', NULL),
    ('os_version', NULL),
    ('os_architecture', NULL),
    ('license_type', NULL),
    ('supported_platform', NULL),
    -- Driver #90-#94
    ('driver_type', NULL),
    ('driver_version', NULL),
    ('supported_os', NULL),
    ('supported_architecture', NULL),
    ('driver_interface', NULL),
    -- Utilities #95-#97
    ('utility_type', NULL),
    ('utility_category', NULL),
    ('developer', NULL),
    -- Testing #98
    ('test_brand', NULL);

-- Pricing
INSERT INTO
    currencies (code, symbol, name)
VALUES
    -- #1
    ('EUR', '€', 'Euro'),
    -- #2
    ('USD', '$', 'US-Dollar');

INSERT INTO
    tax_classes (name, description)
VALUES
    -- #1
    ('standard', 'Standard tax rate'),
    -- #2
    ('reduced', 'Reduced tax rate'),
    -- #3
    ('tax_free', 'Tax free products');

INSERT INTO
    tax_rates (tax_class_id, country_code, rate)
VALUES
    -- #1
    (1, 'DE', 19.00),
    -- #2
    (2, 'DE', 7.00),
    -- #3
    (3, 'DE', 0.00);

INSERT INTO
    promotions (
        name,
        discount_type,
        discount_value,
        start_date,
        end_date
    )
VALUES
    (
        'Spring-Sale',
        'percentage',
        20,
        '2026-04-01',
        '2026-04-30'
    );

-- Components
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
    -- #1
    (
        'Intel Core i9-13900K',
        1,
        'Intel',
        'i9-13900K',
        599.99,
        1,
        1,
        'High-performance desktop processor with 24 cores and 32 threads, designed for gaming and content creation'
    ),
    -- #2
    (
        'AMD Ryzen 7 5800X',
        1,
        'AMD',
        '5800X',
        199.99,
        1,
        1,
        '8-core desktop processor with 16 threads, offering excellent performance for gaming and multitasking'
    ),
    -- #3
    (
        'Intel Core i7-13700K',
        1,
        'Intel',
        'i7-13700K',
        409.99,
        1,
        1,
        'High performance Intel CPU with 16 cores and 24 threads, designed for gaming and content creation'
    ),
    -- #4
    (
        'AMD Ryzen 5 7600X',
        1,
        'AMD',
        '7600X',
        239.99,
        1,
        1,
        'Modern 6-core Zen 4 desktop processor with strong single-core performance for gaming and productivity'
    ),
    -- #5
    (
        'Intel Core i5-13600K',
        1,
        'Intel',
        'i5-13600K',
        319.99,
        1,
        1,
        '14-core hybrid Intel processor with excellent gaming performance and strong multi-thread capability'
    ),
    -- #6
    (
        'NVIDIA GeForce RTX 4090',
        2,
        'NVIDIA',
        'RTX 4090',
        1499.99,
        1,
        1,
        'Flagship graphics card with advanced ray tracing capabilities and AI-powered features for ultimate gaming performance'
    ),
    -- #7
    (
        'NVIDIA GeForce RTX 4070',
        2,
        'NVIDIA',
        'RTX 4070',
        599.99,
        1,
        1,
        'Mid range graphics card with excellent performance for 1440p gaming and support for ray tracing and AI features'
    ),
    -- #8 
    (
        'AMD RX 7800 XT',
        2,
        'AMD',
        'RX 7800 XT',
        499.99,
        1,
        1,
        'AMD RDNA3 graphics card with strong performance for 1440p gaming and support for ray tracing and advanced features'
    ),
    -- #9
    (
        'EVGA GeForce RTX 3080 FTW3 Ultra Gaming',
        2,
        'EVGA',
        'GeForce RTX 3080 FTW3 Ultra Gaming',
        699.99,
        1,
        1,
        'High-performance graphics card with advanced cooling solution and factory overclocking for enhanced gaming performance'
    ),
    -- #10
    (
        'AMD Radeon RX 6700 XT',
        2,
        'AMD',
        'RX 6700 XT',
        379.99,
        1,
        1,
        'RDNA2 graphics card delivering strong 1440p gaming performance with efficient power consumption and modern graphics features'
    ),
    -- #11
    (
        'G.Skill Trident Z RGB 16GB (2 x 8GB) DDR4-3600',
        3,
        'G.Skill',
        'Trident Z RGB 16GB (2 x 8GB) DDR4-3600',
        129.99,
        1,
        1,
        'High-performance DDR4 memory kit with customizable RGB lighting, designed for gaming and high-end systems'
    ),
    -- #12
    (
        'Corsair Vengeance LPX 32GB (2 x 16GB) DDR4-3200',
        3,
        'Corsair',
        'Vengeance LPX 32GB (2 x 16GB) DDR4-3200',
        159.99,
        1,
        1,
        'High-performance DDR4 memory kit with a low-profile design, ideal for gaming and multitasking'
    ),
    -- #13
    (
        'Kingston Fury Beast 16GB (2 x 8GB) DDR4-3200',
        3,
        'Kingston',
        'Fury Beast 16GB (2 x 8GB) DDR4-3200',
        89.99,
        1,
        1,
        'Reliable DDR4 memory kit offering solid performance and stability for gaming and everyday desktop systems'
    ),
    -- #14
    (
        'Corsair Vengeance DDR5 32GB (2 x 16GB) DDR5-5600',
        3,
        'Corsair',
        'Vengeance DDR5 32GB (2 x 16GB) DDR5-5600',
        219.99,
        1,
        1,
        'Next generation DDR5 memory kit delivering high bandwidth and improved efficiency for modern platforms'
    ),
    -- #15
    (
        'G.Skill Trident Z5 RGB 32GB (2 x 16GB) DDR5-6000',
        3,
        'G.Skill',
        'Trident Z5 RGB 32GB (2 x 16GB) DDR5-6000',
        259.99,
        1,
        1,
        'High-performance DDR5 memory kit with RGB lighting designed for enthusiast gaming systems'
    ),
    -- #16
    (
        'ASUS ROG Strix Z690-E Gaming WiFi',
        4,
        'ASUS',
        'ROG Strix Z690-E Gaming WiFi',
        399.99,
        1,
        1,
        'High-end gaming motherboard with support for Intel 12th Gen processors, DDR5 memory, and advanced connectivity options'
    ),
    -- #17
    (
        'MSI MPG B550 Gaming Edge WiFi',
        4,
        'MSI',
        'MPG B550 Gaming Edge WiFi',
        179.99,
        1,
        1,
        'Mid-range gaming motherboard with support for AMD Ryzen processors, DDR4 memory, and built-in Wi-Fi connectivity'
    ),
    -- #18
    (
        'Gigabyte B660M DS3H DDR4',
        4,
        'Gigabyte',
        'B660M DS3H DDR4',
        109.99,
        1,
        1,
        'Budget-friendly motherboard with support for Intel 12th Gen processors, DDR4 memory, and essential connectivity options'
    ),
    -- #19
    (
        'ASUS TUF Gaming X670E-Plus WiFi',
        4,
        'ASUS',
        'TUF Gaming X670E-Plus WiFi',
        329.99,
        1,
        1,
        'High-performance AM5 motherboard supporting AMD Ryzen 7000 processors with DDR5 memory and PCIe 5.0 connectivity'
    ),
    -- #20
    (
        'ASRock B450M Pro4',
        4,
        'ASRock',
        'B450M Pro4',
        89.99,
        1,
        1,
        'Affordable AM4 motherboard supporting DDR4 memory and suitable for mainstream Ryzen systems'
    ),
    -- #21
    (
        'NZXT H510 Elite',
        5,
        'NZXT',
        'H510 Elite',
        149.99,
        1,
        1,
        'Premium mid-tower case with tempered glass panels, RGB lighting, and excellent cable management features'
    ),
    -- #22
    (
        'Lian Li PC-O11 Dynamic',
        5,
        'Lian Li',
        'PC-O11 Dynamic',
        129.99,
        1,
        1,
        'High-end mid-tower case with a unique design, excellent airflow, and support for large radiators'
    ),
    -- #23
    (
        'Fractal Design Meshify C',
        5,
        'Fractal Design',
        'Meshify C',
        89.99,
        1,
        1,
        'Compact mid-tower case with a mesh front panel for improved airflow and a sleek design'
    ),
    -- #24
    (
        'Corsair 4000D Airflow',
        5,
        'Corsair',
        '4000D Airflow',
        104.99,
        1,
        1,
        'High airflow mid-tower case designed for efficient cooling and modern gaming builds'
    ),
    -- #25
    (
        'Cooler Master MasterBox Q300L',
        5,
        'Cooler Master',
        'MasterBox Q300L',
        59.99,
        1,
        1,
        'Compact micro-ATX case with modular I/O panel and optimized airflow design'
    ),
    -- #26
    (
        'Noctua NH-D15',
        6,
        'Noctua',
        'NH-D15',
        89.99,
        1,
        1,
        'High-performance air cooler with dual fans and a large heatsink for excellent cooling performance and low noise levels'
    ),
    -- #27
    (
        'be quiet! Dark Rock Pro 4',
        6,
        'be quiet!',
        'Dark Rock Pro 4',
        89.99,
        1,
        1,
        'Premium air cooler with dual fans and a large heatsink for excellent cooling performance and low noise levels'
    ),
    -- #28
    (
        'Cooler Master Hyper 212 Black Edition',
        6,
        'Cooler Master',
        'Hyper 212 Black Edition',
        39.99,
        1,
        1,
        'Affordable air cooler with a single fan and a solid heatsink design for effective cooling performance'
    ),
    -- #29
    (
        'DeepCool AK620',
        6,
        'DeepCool',
        'AK620',
        64.99,
        1,
        1,
        'High-performance dual tower air cooler with two 120mm fans designed for strong thermal performance'
    ),
    -- #30
    (
        'Scythe Fuma 2 Rev.B',
        6,
        'Scythe',
        'Fuma 2 Rev.B',
        69.99,
        1,
        1,
        'Dual tower air cooler with optimized airflow and quiet operation for high-performance systems'
    ),
    -- #31
    (
        'Corsair iCUE H150i Elite Capellix',
        7,
        'Corsair',
        'iCUE H150i Elite Capellix',
        199.99,
        1,
        1,
        'Premium all-in-one liquid cooler with a 360mm radiator, RGB lighting, and excellent cooling performance'
    ),
    -- #32
    (
        'NZXT Kraken X73',
        7,
        'NZXT',
        'Kraken X73',
        179.99,
        1,
        1,
        'High-performance all-in-one liquid cooler with a 360mm radiator, customizable RGB lighting, and advanced cooling features'
    ),
    -- #33
    (
        'Arctic Liquid Freezer II 280',
        7,
        'Arctic',
        'Liquid Freezer II 280',
        119.99,
        1,
        1,
        'High-performance 280mm AIO liquid cooler with excellent thermal efficiency and quiet operation'
    ),
    -- #34
    (
        'Cooler Master MasterLiquid ML240L V2 RGB',
        7,
        'Cooler Master',
        'MasterLiquid ML240L V2 RGB',
        99.99,
        1,
        1,
        'Affordable 240mm liquid cooler with RGB lighting and solid cooling performance'
    ),
    -- #35
    (
        'be quiet! Pure Loop 2 FX 360',
        7,
        'be quiet!',
        'Pure Loop 2 FX 360',
        149.99,
        1,
        1,
        'High-performance 360mm AIO liquid cooler with ARGB fans and quiet pump design'
    ),
    -- #36
    (
        'Western Digital Black 2TB HDD',
        8,
        'Western Digital',
        'Black 2TB HDD',
        89.99,
        1,
        1,
        'High-performance hard disk drive with a large storage capacity of 2TB, suitable for gaming and mass storage'
    ),
    -- #37
    (
        'Seagate Barracuda 2TB HDD',
        8,
        'Seagate',
        'Barracuda 2TB HDD',
        54.99,
        1,
        1,
        'Reliable hard disk drive with a large storage capacity of 2TB, suitable for mass storage and backup purposes'
    ),
    -- #38
    (
        'Seagate IronWolf 4TB HDD',
        8,
        'Seagate',
        'IronWolf 4TB HDD',
        109.99,
        1,
        1,
        'NAS optimized hard disk drive with 4TB capacity designed for reliability and continuous operation'
    ),
    -- #39
    (
        'Western Digital Blue 1TB HDD',
        8,
        'Western Digital',
        'Blue 1TB HDD',
        39.99,
        1,
        1,
        'Affordable and reliable 1TB hard disk drive suitable for everyday storage and desktop systems'
    ),
    -- #40
    (
        'Toshiba X300 4TB HDD',
        8,
        'Toshiba',
        'X300 4TB HDD',
        119.99,
        1,
        1,
        'High-performance 4TB hard disk drive designed for gaming systems and large storage workloads'
    ),
    -- #41
    (
        'Samsung 970 EVO Plus 1TB NVMe SSD',
        9,
        'Samsung',
        '970 EVO Plus 1TB NVMe SSD',
        169.99,
        1,
        1,
        'Fast NVMe solid-state drive with high read/write speeds, perfect for gaming and content creation'
    ),
    -- #42
    (
        'Western Digital Blue 1TB SSD',
        9,
        'Western Digital',
        'Blue 1TB SSD',
        109.99,
        1,
        1,
        'Affordable solid-state drive with a capacity of 1TB, offering improved performance and reliability compared to traditional hard drives'
    ),
    -- #43
    (
        'Samsung 980 Pro 2TB NVMe SSD',
        9,
        'Samsung',
        '980 Pro 2TB NVMe SSD',
        219.99,
        1,
        1,
        'High-performance PCIe 4.0 NVMe SSD designed for gaming systems and professional workloads'
    ),
    -- #44
    (
        'Crucial MX500 1TB SATA SSD',
        9,
        'Crucial',
        'MX500 1TB SATA SSD',
        89.99,
        1,
        1,
        'Reliable SATA solid-state drive offering excellent value and performance for everyday computing'
    ),
    -- #45
    (
        'Samsung 990 Pro 2TB NVMe SSD',
        9,
        'Samsung',
        '990 Pro 2TB NVMe SSD',
        259.99,
        1,
        1,
        'Flagship PCIe 4.0 NVMe SSD with extremely high read and write speeds for demanding applications'
    ),
    -- #46
    (
        'Corsair RM850x 850W 80+ Gold',
        10,
        'Corsair',
        'RM850x 850W 80+ Gold',
        129.99,
        1,
        1,
        'High-quality power supply unit with 850 watts of power, fully modular design, and 80 Plus Gold efficiency rating'
    ),
    -- #47
    (
        'EVGA SuperNOVA 750 G5 750W 80+ Gold',
        10,
        'EVGA',
        'SuperNOVA 750 G5 750W 80+ Gold',
        119.99,
        1,
        1,
        'Reliable power supply unit with 750 watts of power, fully modular design, and 80 Plus Gold efficiency rating'
    ),
    -- #48
    (
        'Seasonic Focus GX-650 650W 80+ Gold',
        10,
        'Seasonic',
        'Focus GX-650 650W 80+ Gold',
        109.99,
        1,
        1,
        'High-quality power supply unit with 650 watts of power, fully modular design, and 80 Plus Gold efficiency rating'
    ),
    -- #49
    (
        'be quiet! Straight Power 11 850W 80+ Gold',
        10,
        'be quiet!',
        'Straight Power 11 850W 80+ Gold',
        139.99,
        1,
        1,
        'Premium 850 watt power supply with silent operation, modular cables and 80 Plus Gold efficiency'
    ),
    -- #50
    (
        'Corsair CX650M 650W 80+ Bronze',
        10,
        'Corsair',
        'CX650M 650W 80+ Bronze',
        79.99,
        1,
        1,
        'Affordable semi modular 650 watt power supply suitable for mainstream gaming systems'
    ),
    -- #51
    (
        'Corsair SF750 750W 80+ Platinum',
        10,
        'Corsair',
        'SF750 750W 80+ Platinum',
        169.99,
        1,
        1,
        'High-end SFX power supply with 750W output, fully modular cables and 80 Plus Platinum efficiency'
    ),
    -- #52
    (
        'Corsair SF600 600W 80+ Gold',
        10,
        'Corsair',
        'SF600 600W 80+ Gold',
        139.99,
        1,
        1,
        'Compact SFX power supply with 600W capacity and fully modular cables designed for small form factor systems'
    ),
    -- #53
    (
        'SilverStone SX700-LPT 700W 80+ Platinum',
        10,
        'SilverStone',
        'SX700-LPT 700W 80+ Platinum',
        159.99,
        1,
        1,
        'SFX-L power supply with 700W output, high efficiency and quiet operation for compact builds'
    ),
    -- #54
    (
        'Cooler Master V650 SFX Gold 650W',
        10,
        'Cooler Master',
        'V650 SFX Gold 650W',
        149.99,
        1,
        1,
        'High quality SFX power supply with 650W capacity and fully modular cables designed for mini ITX systems'
    ),
    -- #55
    (
        'be quiet! SFX Power 3 450W 80+ Bronze',
        10,
        'be quiet!',
        'SFX Power 3 450W 80+ Bronze',
        89.99,
        1,
        1,
        'Compact SFX power supply with 450W output and quiet cooling suitable for small form factor PCs'
    ),
    -- #56
    (
        'TP-Link TG-3468 Gigabit PCIe Network Adapter',
        11,
        'TP-Link',
        'TG-3468',
        14.99,
        1,
        1,
        'Gigabit Ethernet PCIe network adapter for desktop PCs providing reliable wired network connectivity'
    ),
    -- #57
    (
        'Intel EXPI9301CT Gigabit PCIe Network Adapter',
        11,
        'Intel',
        'EXPI9301CT',
        34.99,
        1,
        1,
        'Reliable Intel Gigabit Ethernet PCIe adapter designed for stable and efficient network connectivity'
    ),
    -- #58
    (
        'ASUS XG-C100C 10G Network Adapter',
        11,
        'ASUS',
        'XG-C100C',
        109.99,
        1,
        1,
        'High performance 10 Gigabit PCIe network adapter for high bandwidth networking and professional workloads'
    ),
    -- #59
    (
        'TP-Link TX201 2.5G PCIe Network Adapter',
        11,
        'TP-Link',
        'TX201',
        39.99,
        1,
        1,
        '2.5 Gigabit Ethernet PCIe adapter offering faster network speeds for modern home and office networks'
    ),
    -- #60
    (
        'Intel X550-T2 10G Dual Port Network Adapter',
        11,
        'Intel',
        'X550-T2',
        299.99,
        1,
        1,
        'Professional dual-port 10 Gigabit Ethernet PCIe network adapter designed for high performance networking'
    ),
    -- #61
    (
        'TP-Link Archer TX3000E WiFi 6 PCIe Adapter',
        12,
        'TP-Link',
        'Archer TX3000E',
        49.99,
        1,
        1,
        'WiFi 6 PCIe network adapter providing high speed wireless connectivity and Bluetooth support'
    ),
    -- #62
    (
        'ASUS PCE-AX58BT WiFi 6 PCIe Adapter',
        12,
        'ASUS',
        'PCE-AX58BT',
        59.99,
        1,
        1,
        'Dual band WiFi 6 PCIe adapter with Bluetooth support designed for modern gaming systems'
    ),
    -- #63
    (
        'Intel AX200 WiFi 6 M.2 Adapter',
        12,
        'Intel',
        'AX200',
        29.99,
        1,
        1,
        'Compact WiFi 6 adapter offering reliable wireless connectivity and Bluetooth support'
    ),
    -- #64
    (
        'TP-Link Archer TXE75E WiFi 6E PCIe Adapter',
        12,
        'TP-Link',
        'Archer TXE75E',
        79.99,
        1,
        1,
        'High performance WiFi 6E PCIe adapter supporting the 6GHz band for ultra fast wireless networking'
    ),
    -- #65
    (
        'Gigabyte GC-WBAX210 WiFi 6E PCIe Adapter',
        12,
        'Gigabyte',
        'GC-WBAX210',
        69.99,
        1,
        1,
        'PCIe WiFi 6E adapter with Bluetooth 5 support designed for high speed wireless connectivity'
    ),
    -- #66
    (
        'Phanteks Neon Digital RGB LED Strip 400mm',
        13,
        'Phanteks',
        'Neon Digital RGB 400mm',
        24.99,
        1,
        1,
        'Flexible addressable RGB LED strip designed for smooth lighting diffusion inside PC cases'
    ),
    -- #67
    (
        'Corsair iCUE LS100 RGB LED Strip 450mm',
        13,
        'Corsair',
        'LS100 RGB Strip 450mm',
        39.99,
        1,
        1,
        'High quality RGB LED strip with addressable lighting designed for PC interior lighting'
    ),
    -- #68
    (
        'NZXT Hue 2 RGB LED Strip',
        13,
        'NZXT',
        'Hue 2 RGB Strip',
        29.99,
        1,
        1,
        'Addressable RGB lighting strip designed to enhance PC case lighting aesthetics'
    ),
    -- #69
    (
        'Cooler Master Addressable RGB LED Strip',
        13,
        'Cooler Master',
        'ARGB LED Strip',
        19.99,
        1,
        1,
        'Flexible ARGB LED strip compatible with most motherboard RGB headers'
    ),
    -- #70
    (
        'DeepCool RGB 200 Pro LED Strip',
        13,
        'DeepCool',
        'RGB 200 Pro',
        17.99,
        1,
        1,
        'Compact RGB LED strip for internal PC lighting with smooth diffusion'
    ),
    -- #71
    (
        'Corsair Commander Core XT Fan Controller',
        14,
        'Corsair',
        'Commander Core XT',
        59.99,
        1,
        1,
        'Advanced PWM fan controller with support for multiple fans and RGB synchronization for Corsair iCUE systems'
    ),
    -- #72
    (
        'NZXT RGB & Fan Controller',
        14,
        'NZXT',
        'RGB & Fan Controller',
        49.99,
        1,
        1,
        'Fan and RGB controller hub allowing control of multiple PWM fans and lighting devices'
    ),
    -- #73
    (
        'DeepCool FH-10 Fan Hub',
        14,
        'DeepCool',
        'FH-10',
        19.99,
        1,
        1,
        'Compact PWM fan hub supporting up to ten fans with synchronized speed control'
    ),
    -- #74
    (
        'SilverStone CPF04 PWM Fan Hub',
        14,
        'SilverStone',
        'CPF04',
        17.99,
        1,
        1,
        'PWM fan hub allowing up to eight fans to be controlled from a single motherboard header'
    ),
    -- #75
    (
        'Cooler Master ARGB & PWM Fan Hub',
        14,
        'Cooler Master',
        'ARGB & PWM Fan Hub',
        29.99,
        1,
        1,
        'Combined RGB and PWM fan controller hub designed for modern gaming systems'
    ),
    -- #76
    (
        'Elgato 4K60 Pro MK.2 Capture Card',
        16,
        'Elgato',
        '4K60 Pro MK.2',
        249.99,
        1,
        1,
        'High performance PCIe capture card designed for recording and streaming gameplay in 4K resolution'
    ),
    -- #77
    (
        'ASUS Hyper M.2 X16 PCIe Expansion Card',
        16,
        'ASUS',
        'Hyper M.2 X16',
        79.99,
        1,
        1,
        'PCIe expansion card allowing installation of multiple NVMe SSD drives using PCIe lanes'
    ),
    -- #78
    (
        'StarTech USB 3.2 PCIe Expansion Card',
        16,
        'StarTech',
        'PEXUSB312C3',
        49.99,
        1,
        1,
        'PCIe expansion card adding multiple USB 3.2 high speed ports to desktop systems'
    ),
    -- #79
    (
        'Blackmagic DeckLink Mini Recorder',
        16,
        'Blackmagic Design',
        'DeckLink Mini Recorder',
        145.99,
        1,
        1,
        'Professional PCIe video capture card designed for high quality HDMI and SDI video input'
    ),
    -- #80
    (
        'SilverStone ECM24 M.2 PCIe Adapter',
        16,
        'SilverStone',
        'ECM24',
        24.99,
        1,
        1,
        'PCIe adapter card allowing installation of NVMe M.2 storage drives in desktop systems'
    ),
    -- #81
    (
        'ASUS TUF Gaming VG27AQ',
        15,
        'ASUS',
        'VG27AQ',
        379.99,
        1,
        1,
        '27 inch gaming monitor with IPS panel, high refresh rate and adaptive sync support'
    ),
    -- #82
    (
        'LG UltraGear 27GP850-B',
        15,
        'LG',
        '27GP850-B',
        429.99,
        1,
        1,
        '27 inch QHD gaming monitor with Nano IPS panel and excellent color accuracy'
    ),
    -- #83
    (
        'Samsung Odyssey G5 32',
        15,
        'Samsung',
        'Odyssey G5 32',
        329.99,
        1,
        1,
        '32 inch curved gaming monitor with high refresh rate designed for immersive gaming'
    ),
    -- #84
    (
        'Dell UltraSharp U2723QE',
        15,
        'Dell',
        'U2723QE',
        579.99,
        1,
        1,
        'Professional 27 inch monitor designed for productivity and color accurate work'
    ),
    -- #85
    (
        'AOC 24G2SP Gaming Monitor',
        15,
        'AOC',
        '24G2SP',
        219.99,
        1,
        1,
        '24 inch gaming monitor offering fast refresh rate and responsive performance'
    ),
    -- #86
    (
        'Corsair K95 RGB Platinum Mechanical Keyboard',
        17,
        'Corsair',
        'K95 RGB Platinum',
        199.99,
        1,
        1,
        'High-end mechanical gaming keyboard with customizable RGB lighting and dedicated macro keys'
    ),
    -- #87
    (
        'Logitech G Pro X Mechanical Keyboard',
        17,
        'Logitech',
        'G Pro X',
        149.99,
        1,
        1,
        'Compact mechanical gaming keyboard with hot-swappable switches and professional esports design'
    ),
    -- #88
    (
        'Razer BlackWidow V3 Mechanical Keyboard',
        17,
        'Razer',
        'BlackWidow V3',
        139.99,
        1,
        1,
        'Mechanical gaming keyboard with RGB lighting and durable aluminum top plate'
    ),
    -- #89
    (
        'SteelSeries Apex Pro Gaming Keyboard',
        17,
        'SteelSeries',
        'Apex Pro',
        209.99,
        1,
        1,
        'Premium gaming keyboard with adjustable mechanical switches and RGB illumination'
    ),
    -- #90
    (
        'HyperX Alloy Core RGB Keyboard',
        17,
        'HyperX',
        'Alloy Core RGB',
        69.99,
        1,
        1,
        'Affordable gaming keyboard with RGB lighting and durable frame designed for everyday gaming'
    ),
    -- #91
    (
        'Logitech G Pro X Superlight',
        18,
        'Logitech',
        'G Pro X Superlight',
        159.99,
        1,
        1,
        'Ultra lightweight esports gaming mouse with HERO sensor and wireless LIGHTSPEED connectivity'
    ),
    -- #92
    (
        'Razer DeathAdder V3 Pro',
        18,
        'Razer',
        'DeathAdder V3 Pro',
        149.99,
        1,
        1,
        'Ergonomic wireless gaming mouse with Focus Pro optical sensor designed for competitive gaming'
    ),
    -- #93
    (
        'SteelSeries Rival 5 Gaming Mouse',
        18,
        'SteelSeries',
        'Rival 5',
        69.99,
        1,
        1,
        'Versatile gaming mouse with multiple programmable buttons and precision optical sensor'
    ),
    -- #94
    (
        'Corsair M65 RGB Elite',
        18,
        'Corsair',
        'M65 RGB Elite',
        79.99,
        1,
        1,
        'Durable aluminum gaming mouse with adjustable weight system and high precision sensor'
    ),
    -- #95
    (
        'HyperX Pulsefire Haste',
        18,
        'HyperX',
        'Pulsefire Haste',
        59.99,
        1,
        1,
        'Lightweight honeycomb gaming mouse designed for fast and precise gameplay'
    ),
    -- #96
    (
        'Microsoft Windows 11 Home',
        19,
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
        19,
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
        19,
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
        19,
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
        19,
        'Microsoft',
        'Windows 10 Pro',
        149.99,
        1,
        1,
        'Professional Windows operating system widely used in business environments'
    ),
    -- # 101
    (
        'NVIDIA GeForce Game Ready Driver',
        20,
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
        20,
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
        20,
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
        20,
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
        20,
        'Intel',
        'PROSet Ethernet Driver',
        0.00,
        1,
        1,
        'Network driver for Intel ethernet controllers and adapters'
    ),
    -- # 106
    (
        'CPU-Z System Utility',
        21,
        'CPUID',
        'CPU-Z',
        0.00,
        1,
        1,
        'Hardware information utility for CPU, motherboard and memory analysis'
    ),
    -- # 107
    (
        'HWMonitor System Monitor',
        21,
        'CPUID',
        'HWMonitor',
        0.00,
        1,
        1,
        'Monitoring software displaying temperatures, voltages and fan speeds'
    ),
    -- # 108
    (
        'MSI Afterburner',
        21,
        'MSI',
        'Afterburner',
        0.00,
        1,
        1,
        'GPU overclocking and monitoring tool supporting many graphics cards'
    ),
    -- # 109
    (
        'CrystalDiskInfo',
        21,
        'Crystal Dew World',
        'CrystalDiskInfo',
        0.00,
        1,
        1,
        'Disk monitoring utility displaying SMART data and health status'
    ),
    -- # 110
    (
        '3DMark Benchmark Suite',
        21,
        'UL Solutions',
        '3DMark',
        29.99,
        1,
        1,
        'Benchmarking software used to measure GPU and CPU performance'
    ),
    -- # 111
    (
        'Test CPU Alpha',
        1,
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
        1,
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
        1,
        'TestBrand',
        'Gamma-3000',
        0.00,
        1,
        1,
        'Dummy CPU used for testing advanced configurator scenarios'
    ),
    -- # 114
    (
        'Test GPU Alpha',
        2,
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
        2,
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
        2,
        'TestBrand',
        'GPU-C3',
        0.00,
        1,
        1,
        'Dummy GPU for stress testing configuration rules'
    ),
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

-- Attributes
INSERT INTO
    component_attributes (component_id, attribute_id, attribute_value)
VALUES
    -- #1
    (1, 1, 'LGA1700'),
    (1, 3, '24'),
    (1, 4, '3000'),
    (1, 5, '36'),
    (1, 6, '125'),
    (1, 7, '5600'),
    -- #2
    (2, 1, 'AM4'),
    (2, 3, '8'),
    (2, 4, '3800'),
    (2, 5, '32'),
    (2, 6, '105'),
    (2, 7, '3200'),
    -- #3 
    (3, 1, 'LGA1700'),
    (3, 3, '16'),
    (3, 4, '3400'),
    (3, 5, '30'),
    (3, 6, '125'),
    (3, 7, '5600'),
    -- #4
    (4, 1, 'AM5'),
    (4, 3, '6'),
    (4, 4, '4700'),
    (4, 5, '32'),
    (4, 6, '105'),
    (4, 7, '5200'),
    -- #5
    (5, 1, 'LGA1700'),
    (5, 3, '14'),
    (5, 4, '3500'),
    (5, 5, '24'),
    (5, 6, '125'),
    (5, 7, '5600'),
    -- #6
    (6, 8, 'GDDR6X'),
    (6, 9, '24'),
    (6, 10, '2235'),
    (6, 11, '336'),
    (6, 12, '16-pin'),
    (6, 6, '450'),
    (6, 13, '3.5'),
    (6, 14, '1000'),
    -- #7
    (7, 8, 'GDDR6'),
    (7, 9, '12'),
    (7, 10, '1920'),
    (7, 11, '244'),
    (7, 12, '8-pin'),
    (7, 6, '200'),
    (7, 13, '2'),
    (7, 14, '650'),
    -- #8
    (8, 8, 'GDDR6'),
    (8, 9, '16'),
    (8, 10, '2010'),
    (8, 11, '267'),
    (8, 12, '2x8-pin'),
    (8, 6, '263'),
    (8, 13, '2.5'),
    (8, 14, '700'),
    -- #9 
    (9, 8, 'GDDR6X'),
    (9, 9, '10'),
    (9, 10, '1710'),
    (9, 11, '300'),
    (9, 12, '3x8-pin'),
    (9, 6, '320'),
    (9, 13, '3'),
    (9, 14, '750'),
    -- #10
    (10, 8, 'GDDR6'),
    (10, 9, '12'),
    (10, 10, '2321'),
    (10, 11, '267'),
    (10, 12, '2x8-pin'),
    (10, 6, '230'),
    (10, 13, '2.5'),
    (10, 14, '650'),
    -- #11
    (11, 15, 'DDR4'),
    (11, 16, '2'),
    (11, 17, 'DIMM'),
    (11, 18, '16'),
    (11, 19, '2'),
    (11, 20, '3600'),
    -- #12
    (12, 15, 'DDR4'),
    (12, 16, '2'),
    (12, 17, 'DIMM'),
    (12, 18, '32'),
    (12, 19, '2'),
    (12, 20, '3200'),
    -- #13
    (13, 15, 'DDR4'),
    (13, 16, '2'),
    (13, 17, 'DIMM'),
    (13, 18, '16'),
    (13, 19, '2'),
    (13, 20, '3200'),
    -- #14
    (14, 15, 'DDR5'),
    (14, 16, '2'),
    (14, 17, 'DIMM'),
    (14, 18, '32'),
    (14, 19, '2'),
    (14, 20, '5600'),
    -- #15
    (15, 15, 'DDR5'),
    (15, 16, '2'),
    (15, 17, 'DIMM'),
    (15, 18, '32'),
    (15, 19, '2'),
    (15, 20, '6000'),
    -- #16
    (16, 2, 'LGA1700'),
    (16, 21, 'Intel Z690'),
    (16, 15, 'DDR5'),
    (16, 22, '4'),
    (16, 23, '6400'),
    (16, 24, '128'),
    (16, 25, '5'),
    (16, 26, '6'),
    (16, 27, '2'),
    (16, 28, '5.0'),
    (16, 29, '2.5'),
    (16, 30, 'WiFi 6E'),
    (16, 31, 'ATX'),
    (16, 32, '5V ARGB 3-pin'),
    (16, 32, '12V RGB 4-pin'),
    (16, 33, 'PWM 4-pin'),
    (16, 34, '7'),
    -- #17    
    (17, 2, 'AM4'),
    (17, 21, 'AMD B550'),
    (17, 15, 'DDR4'),
    (17, 22, '4'),
    (17, 23, '5100'),
    (17, 24, '128'),
    (17, 25, '2'),
    (17, 26, '6'),
    (17, 27, '1'),
    (17, 28, '4.0'),
    (17, 29, '2.5'),
    (17, 30, 'WiFi 6'),
    (17, 31, 'ATX'),
    (17, 32, '5V ARGB 3-pin'),
    (17, 32, '12V RGB 4-pin'),
    (17, 33, 'PWM 4-pin'),
    (17, 34, '6'),
    -- #18
    (18, 2, 'LGA1700'),
    (18, 21, 'Intel B660'),
    (18, 15, 'DDR4'),
    (18, 22, '4'),
    (18, 23, '4800'),
    (18, 24, '128'),
    (18, 25, '2'),
    (18, 26, '4'),
    (18, 27, '1'),
    (18, 28, '4.0'),
    (18, 29, '1'),
    (18, 30, 'None'),
    (18, 31, 'Micro-ATX'),
    (18, 32, '12V RGB 4-pin'),
    (18, 33, 'PWM 4-pin'),
    (18, 34, '5'),
    -- #19
    (19, 2, 'AM5'),
    (19, 21, 'AMD X670E'),
    (19, 15, 'DDR5'),
    (19, 22, '4'),
    (19, 23, '6400'),
    (19, 24, '192'),
    (19, 25, '4'),
    (19, 26, '6'),
    (19, 27, '2'),
    (19, 28, '5.0'),
    (19, 29, '2.5'),
    (19, 30, 'WiFi 6E'),
    (19, 31, 'ATX'),
    (19, 32, '5V ARGB 3-pin'),
    (19, 32, '12V RGB 4-pin'),
    (19, 33, 'PWM 4-pin'),
    (19, 34, '7'),
    -- #20
    (20, 2, 'AM4'),
    (20, 21, 'AMD B450'),
    (20, 15, 'DDR4'),
    (20, 22, '4'),
    (20, 23, '3466'),
    (20, 24, '64'),
    (20, 25, '1'),
    (20, 26, '4'),
    (20, 27, '1'),
    (20, 28, '3.0'),
    (20, 29, '1'),
    (20, 30, 'None'),
    (20, 31, 'Micro-ATX'),
    (20, 32, '12V RGB 4-pin'),
    (20, 33, 'PWM 4-pin'),
    (20, 34, '4'),
    -- #21
    (21, 35, 'Mid Tower'),
    (21, 36, 'ATX'),
    (21, 36, 'Micro-ATX'),
    (21, 36, 'Mini-ITX'),
    (21, 37, '381'),
    (21, 38, '165'),
    (21, 39, '280'),
    (21, 40, 'front, top'),
    (21, 41, 'ATX'),
    (21, 42, '4'),
    (21, 61, 'Steel / Tempered Glass'),
    (21, 62, '6.6'),
    (21, 63, '210 x 460 x 428'),
    (21, 64, TRUE),
    -- #22
    (22, 35, 'Mid Tower'),
    (22, 36, 'ATX'),
    (22, 36, 'Micro-ATX'),
    (22, 36, 'Mini-ITX'),
    (22, 37, '420'),
    (22, 38, '155'),
    (22, 39, '360'),
    (22, 40, 'top, side, bottom'),
    (22, 41, 'ATX'),
    (22, 42, '6'),
    (22, 61, 'Aluminum / Tempered Glass'),
    (22, 62, '7.5'),
    (22, 63, '272 x 446 x 445'),
    (22, 64, FALSE),
    -- #23
    (23, 35, 'Mid Tower'),
    (23, 36, 'ATX'),
    (23, 36, 'Micro-ATX'),
    (23, 36, 'Mini-ITX'),
    (23, 37, '315'),
    (23, 38, '172'),
    (23, 39, '360'),
    (23, 40, 'front, top'),
    (23, 41, 'ATX'),
    (23, 42, '3'),
    (23, 61, 'Steel / Tempered Glass'),
    (23, 62, '5.4'),
    (23, 63, '217 x 395 x 440'),
    (23, 64, FALSE),
    -- #24
    (24, 35, 'Mid Tower'),
    (24, 36, 'ATX'),
    (24, 36, 'Micro-ATX'),
    (24, 36, 'Mini-ITX'),
    (24, 37, '360'),
    (24, 38, '170'),
    (24, 39, '360'),
    (24, 40, 'front, top'),
    (24, 41, 'ATX'),
    (24, 42, '4'),
    (24, 61, 'Steel / Tempered Glass'),
    (24, 62, '7.8'),
    (24, 63, '230 x 466 x 453'),
    (24, 64, FALSE),
    -- #25
    (25, 35, 'Mini Tower'),
    (25, 36, 'Micro-ATX'),
    (25, 36, 'Mini-ITX'),
    (25, 37, '360'),
    (25, 38, '159'),
    (25, 39, '240'),
    (25, 40, 'front'),
    (25, 41, 'ATX'),
    (25, 42, '2'),
    (25, 61, 'Steel / Acrylic'),
    (25, 62, '3.6'),
    (25, 63, '230 x 387 x 378'),
    (25, 64, FALSE),
    -- #26
    (26, 2, 'LGA1851'),
    (26, 2, 'LGA1700'),
    (26, 2, 'LGA1200'),
    (26, 2, 'LGA1156'),
    (26, 2, 'LGA1155'),
    (26, 2, 'LGA1151'),
    (26, 2, 'LGA1150'),
    (26, 2, 'AM4'),
    (26, 2, 'AM5'),
    (26, 47, 'Air'),
    (26, 48, '165'),
    (26, 49, '2'),
    (26, 50, '140'),
    (26, 54, '19.2'),
    (26, 55, 'Aluminum'),
    -- #27
    (27, 2, 'LGA2066'),
    (27, 2, 'LGA2011'),
    (27, 2, 'LGA1366'),
    (27, 2, 'FM2'),
    (27, 2, 'FM1'),
    (27, 2, 'AM3'),
    (27, 2, 'AM2'),
    (27, 2, 'AM4'),
    (27, 47, 'Air'),
    (27, 48, '163'),
    (27, 49, '2'),
    (27, 50, '120'),
    (27, 54, '24.3'),
    (27, 55, 'Aluminum'),
    -- #28
    (28, 2, 'LGA1700'),
    (28, 2, 'LGA1200'),
    (28, 2, 'LGA1156'),
    (28, 2, 'LGA1155'),
    (28, 2, 'LGA1151'),
    (28, 2, 'LGA1150'),
    (28, 2, 'AM4'),
    (28, 2, 'AM5'),
    (28, 47, 'Air'),
    (28, 48, '159'),
    (28, 49, '1'),
    (28, 50, '120'),
    (28, 54, '26.9'),
    (28, 55, 'Aluminum'),
    -- #29
    (29, 2, 'LGA1700'),
    (29, 2, 'LGA1200'),
    (29, 2, 'LGA1156'),
    (29, 2, 'LGA1155'),
    (29, 2, 'LGA1151'),
    (29, 2, 'LGA1150'),
    (29, 2, 'AM4'),
    (29, 2, 'AM5'),
    (29, 47, 'Air'),
    (29, 48, '160'),
    (29, 49, '2'),
    (29, 50, '120'),
    (29, 54, '28'),
    (29, 55, 'Aluminum'),
    -- #30
    (30, 2, 'LGA1700'),
    (30, 2, 'LGA1200'),
    (30, 2, 'LGA1156'),
    (30, 2, 'LGA1155'),
    (30, 2, 'LGA1151'),
    (30, 2, 'LGA1150'),
    (30, 2, 'AM4'),
    (30, 2, 'AM5'),
    (30, 47, 'Air'),
    (30, 48, '155'),
    (30, 49, '2'),
    (30, 50, '120'),
    (30, 54, '25'),
    (30, 55, 'Aluminum'),
    -- #31
    (31, 2, 'LGA1700'),
    (31, 2, 'LGA1200'),
    (31, 2, 'LGA1156'),
    (31, 2, 'LGA1155'),
    (31, 2, 'LGA1151'),
    (31, 2, 'LGA1150'),
    (31, 2, 'AM4'),
    (31, 2, 'AM5'),
    (31, 47, 'Liquid'),
    (31, 49, '3'),
    (31, 50, '120'),
    (31, 52, '360'),
    (31, 51, '2400'),
    (31, 53, '2800'),
    (31, 54, '36'),
    (31, 64, TRUE),
    -- #32
    (32, 2, 'LGA1700'),
    (32, 2, 'LGA1200'),
    (32, 2, 'LGA1156'),
    (32, 2, 'LGA1155'),
    (32, 2, 'LGA1151'),
    (32, 2, 'LGA1150'),
    (32, 2, 'AM4'),
    (32, 2, 'AM5'),
    (32, 47, 'Liquid'),
    (32, 49, '3'),
    (32, 50, '120'),
    (32, 52, '360'),
    (32, 51, '2200'),
    (32, 53, '2800'),
    (32, 54, '35'),
    (32, 64, TRUE),
    -- #33
    (33, 2, 'LGA1700'),
    (33, 2, 'LGA1200'),
    (33, 2, 'LGA1156'),
    (33, 2, 'LGA1155'),
    (33, 2, 'LGA1151'),
    (33, 2, 'LGA1150'),
    (33, 2, 'AM4'),
    (33, 2, 'AM5'),
    (33, 47, 'Liquid'),
    (33, 49, '2'),
    (33, 50, '140'),
    (33, 52, '280'),
    (33, 51, '1700'),
    (33, 53, '2000'),
    (33, 54, '30'),
    (33, 64, FALSE),
    -- #34
    (34, 2, 'LGA1700'),
    (34, 2, 'LGA1200'),
    (34, 2, 'LGA1156'),
    (34, 2, 'LGA1155'),
    (34, 2, 'LGA1151'),
    (34, 2, 'LGA1150'),
    (34, 2, 'AM4'),
    (34, 2, 'AM5'),
    (34, 47, 'Liquid'),
    (34, 49, '2'),
    (34, 50, '120'),
    (34, 52, '240'),
    (34, 51, '1800'),
    (34, 53, '2300'),
    (34, 54, '27'),
    (34, 64, TRUE),
    -- #35
    (35, 2, 'LGA1700'),
    (35, 2, 'LGA1200'),
    (35, 2, 'LGA1156'),
    (35, 2, 'LGA1155'),
    (35, 2, 'LGA1151'),
    (35, 2, 'LGA1150'),
    (35, 2, 'AM4'),
    (35, 2, 'AM5'),
    (35, 47, 'Liquid'),
    (35, 49, '3'),
    (35, 50, '120'),
    (35, 52, '360'),
    (35, 51, '2000'),
    (35, 53, '2500'),
    (35, 54, '34'),
    (35, 64, TRUE),
    -- #36
    (36, 56, '2TB'),
    (36, 57, 'SATA 6Gb/s'),
    (36, 58, '227'),
    (36, 59, '227'),
    (36, 60, '3.5 inch'),
    (36, 62, '0.72'),
    (36, 64, FALSE),
    -- #37
    (37, 56, '2TB'),
    (37, 57, 'SATA 6Gb/s'),
    (37, 58, '210'),
    (37, 59, '210'),
    (37, 60, '3.5 inch'),
    (37, 62, '0.49'),
    (37, 64, FALSE),
    -- #38
    (38, 56, '4TB'),
    (38, 57, 'SATA 6Gb/s'),
    (38, 58, '210'),
    (38, 59, '210'),
    (38, 60, '3.5 inch'),
    (38, 62, '0.65'),
    (38, 64, FALSE),
    -- #39
    (39, 56, '1TB'),
    (39, 57, 'SATA 6Gb/s'),
    (39, 58, '150'),
    (39, 59, '150'),
    (39, 60, '3.5 inch'),
    (39, 62, '0.45'),
    (39, 64, FALSE),
    -- #40
    (40, 56, '4TB'),
    (40, 57, 'SATA 6Gb/s'),
    (40, 58, '220'),
    (40, 59, '220'),
    (40, 60, '3.5 inch'),
    (40, 62, '0.72'),
    (40, 64, FALSE),
    -- #41
    (41, 56, '1TB'),
    (41, 57, 'NVMe PCIe 3.0 x4'),
    (41, 58, '3500'),
    (41, 59, '3300'),
    (41, 60, 'M.2 2280'),
    (41, 64, FALSE),
    -- #42
    (42, 56, '1TB'),
    (42, 57, 'SATA III'),
    (42, 58, '560'),
    (42, 59, '530'),
    (42, 60, '2.5 inch'),
    (42, 64, FALSE),
    -- #43
    (43, 56, '2TB'),
    (43, 57, 'NVMe PCIe 4.0 x4'),
    (43, 58, '7000'),
    (43, 59, '5100'),
    (43, 60, 'M.2 2280'),
    (43, 64, FALSE),
    -- #44
    (44, 56, '1TB'),
    (44, 57, 'SATA III'),
    (44, 58, '560'),
    (44, 59, '510'),
    (44, 60, '2.5 inch'),
    (44, 64, FALSE),
    -- #45
    (45, 56, '2TB'),
    (45, 57, 'NVMe PCIe 4.0 x4'),
    (45, 58, '7450'),
    (45, 59, '6900'),
    (45, 60, 'M.2 2280'),
    (45, 64, FALSE),
    -- #46
    (46, 43, '850'),
    (46, 44, '80 Plus Gold'),
    (46, 45, 'Fully Modular'),
    (46, 46, 'ATX'),
    -- #47
    (47, 43, '750'),
    (47, 44, '80 Plus Gold'),
    (47, 45, 'Fully Modular'),
    (47, 46, 'ATX'),
    -- #48
    (48, 43, '650'),
    (48, 44, '80 Plus Gold'),
    (48, 45, 'Fully Modular'),
    (48, 46, 'ATX'),
    -- #49
    (49, 43, '850'),
    (49, 44, '80 Plus Gold'),
    (49, 45, 'Fully Modular'),
    (49, 46, 'ATX'),
    -- #50
    (50, 43, '650'),
    (50, 44, '80 Plus Bronze'),
    (50, 45, 'Semi Modular'),
    (50, 46, 'ATX'),
    -- #51
    (51, 43, '750'),
    (51, 44, '80 Plus Platinum'),
    (51, 45, 'Fully Modular'),
    (51, 46, 'SFX'),
    -- #52
    (52, 43, '600'),
    (52, 44, '80 Plus Gold'),
    (52, 45, 'Fully Modular'),
    (52, 46, 'SFX'),
    -- #53
    (53, 43, '700'),
    (53, 44, '80 Plus Platinum'),
    (53, 45, 'Fully Modular'),
    (53, 46, 'SFX-L'),
    -- #54
    (54, 43, '650'),
    (54, 44, '80 Plus Gold'),
    (54, 45, 'Fully Modular'),
    (54, 46, 'SFX'),
    -- #55
    (55, 43, '450'),
    (55, 44, '80 Plus Bronze'),
    (55, 45, 'Non Modular'),
    (55, 46, 'SFX'),
    -- #56
    (56, 28, '1'),
    (56, 27, '2.0'),
    (56, 26, '1'),
    (56, 64, FALSE),
    -- #57
    (57, 28, '1'),
    (57, 27, '2.0'),
    (57, 26, '1'),
    (57, 64, FALSE),
    -- #58
    (58, 28, '10'),
    (58, 27, '3.0'),
    (58, 26, '1'),
    (58, 64, FALSE),
    -- #59
    (59, 28, '2.5'),
    (59, 27, '3.0'),
    (59, 26, '1'),
    (59, 64, FALSE),
    -- #60
    (60, 28, '10'),
    (60, 27, '3.0'),
    (60, 26, '1'),
    (60, 64, FALSE),
    -- #61
    (61, 30, 'WiFi 6'),
    (61, 27, '3.0'),
    (61, 26, '1'),
    (61, 64, FALSE),
    -- #62
    (62, 30, 'WiFi 6'),
    (62, 27, '3.0'),
    (62, 26, '1'),
    (62, 64, FALSE),
    -- #63
    (63, 30, 'WiFi 6'),
    (63, 27, '3.0'),
    (63, 26, '1'),
    (63, 64, FALSE),
    -- #64
    (64, 30, 'WiFi 6E'),
    (64, 27, '3.0'),
    (64, 26, '1'),
    (64, 64, FALSE),
    -- #65
    (65, 30, 'WiFi 6E'),
    (65, 27, '3.0'),
    (65, 26, '1'),
    (65, 64, FALSE),
    -- #66
    (66, 64, TRUE),
    (66, 61, 'Silicone'),
    (66, 63, '400 x 10 x 5'),
    (66, 65, '5V ARGB 3-pin'),
    -- #67
    (67, 64, TRUE),
    (67, 61, 'Silicone'),
    (67, 63, '450 x 10 x 5'),
    (67, 65, 'Proprietary'),
    -- #68
    (68, 64, TRUE),
    (68, 61, 'Plastic / Silicone'),
    (68, 63, '300 x 10 x 5'),
    (68, 65, 'Proprietary'),
    -- #69
    (69, 64, TRUE),
    (69, 61, 'Silicone'),
    (69, 63, '300 x 10 x 5'),
    (69, 65, '5V ARGB 3-pin'),
    -- #70
    (70, 64, TRUE),
    (70, 61, 'Plastic / Silicone'),
    (70, 63, '200 x 10 x 5'),
    (70, 65, '12V RGB 4-pin'),
    -- #71
    (71, 48, '6'),
    (71, 61, 'Plastic'),
    (71, 63, '90 x 60 x 15'),
    (71, 64, TRUE),
    (71, 65, 'Corsair RGB'),
    (71, 66, 'PWM 4-pin'),
    -- #72
    (72, 48, '5'),
    (72, 61, 'Plastic'),
    (72, 63, '85 x 60 x 15'),
    (72, 64, TRUE),
    (72, 65, 'NZXT RGB'),
    (72, 66, 'PWM 4-pin'),
    -- #73
    (73, 48, '10'),
    (73, 61, 'Plastic'),
    (73, 63, '100 x 60 x 15'),
    (73, 64, FALSE),
    (73, 66, 'PWM 4-pin'),
    -- #74
    (74, 48, '8'),
    (74, 61, 'Plastic'),
    (74, 63, '95 x 45 x 15'),
    (74, 64, FALSE),
    (74, 66, 'PWM 4-pin'),
    -- #75
    (75, 48, '6'),
    (75, 61, 'Plastic'),
    (75, 63, '100 x 55 x 15'),
    (75, 64, TRUE),
    (75, 65, '5V ARGB 3-pin'),
    (75, 66, 'PWM 4-pin'),
    -- #76
    (76, 27, '1'),
    (76, 28, '2.0'),
    (76, 61, 'Metal'),
    (76, 62, '0.15'),
    (76, 63, '120 x 90 x 20'),
    (76, 64, FALSE),
    -- #77
    (77, 27, '1'),
    (77, 28, '3.0'),
    (77, 61, 'Metal'),
    (77, 62, '0.20'),
    (77, 63, '130 x 100 x 25'),
    (77, 64, FALSE),
    -- #78
    (78, 27, '1'),
    (78, 28, '3.0'),
    (78, 61, 'Metal'),
    (78, 62, '0.12'),
    (78, 63, '115 x 80 x 20'),
    (78, 64, FALSE),
    -- #79
    (79, 27, '1'),
    (79, 28, '2.0'),
    (79, 61, 'Metal'),
    (79, 62, '0.18'),
    (79, 63, '120 x 90 x 20'),
    (79, 64, FALSE),
    -- #80
    (80, 27, '1'),
    (80, 28, '3.0'),
    (80, 61, 'Metal'),
    (80, 62, '0.10'),
    (80, 63, '110 x 70 x 18'),
    (80, 64, FALSE),
    -- #81
    (81, 67, '27'),
    (81, 68, '2560x1440'),
    (81, 69, '165'),
    (81, 70, 'IPS'),
    (81, 71, '1'),
    (81, 72, 'DisplayPort 1.2'),
    (81, 72, 'HDMI 2.0'),
    (81, 73, '16:9'),
    (81, 74, FALSE),
    (81, 75, 'G-Sync Compatible'),
    (81, 61, 'Plastic / Metal'),
    (81, 62, '5.8'),
    (81, 63, '620 x 380 x 210'),
    (81, 64, FALSE),
    -- #82
    (82, 67, '27'),
    (82, 68, '2560x1440'),
    (82, 69, '180'),
    (82, 70, 'Nano IPS'),
    (82, 71, '1'),
    (82, 72, 'DisplayPort 1.4'),
    (82, 72, 'HDMI 2.0'),
    (82, 73, '16:9'),
    (82, 74, FALSE),
    (82, 75, 'FreeSync Premium'),
    (82, 61, 'Plastic'),
    (82, 62, '6.1'),
    (82, 63, '614 x 575 x 291'),
    (82, 64, TRUE),
    -- #83
    (83, 67, '32'),
    (83, 68, '2560x1440'),
    (83, 69, '165'),
    (83, 70, 'VA'),
    (83, 71, '1'),
    (83, 72, 'DisplayPort 1.2'),
    (83, 72, 'HDMI 2.0'),
    (83, 73, '16:9'),
    (83, 74, TRUE),
    (83, 75, 'FreeSync'),
    (83, 61, 'Plastic'),
    (83, 62, '7.2'),
    (83, 63, '710 x 533 x 272'),
    (83, 64, TRUE),
    -- #84
    (84, 67, '27'),
    (84, 68, '3840x2160'),
    (84, 69, '60'),
    (84, 70, 'IPS Black'),
    (84, 71, '5'),
    (84, 72, 'DisplayPort 1.4'),
    (84, 72, 'HDMI 2.0'),
    (84, 72, 'USB-C'),
    (84, 73, '16:9'),
    (84, 74, FALSE),
    (84, 75, 'None'),
    (84, 61, 'Plastic / Metal'),
    (84, 62, '6.6'),
    (84, 63, '611 x 385 x 200'),
    (84, 64, FALSE),
    -- #85
    (85, 67, '24'),
    (85, 68, '1920x1080'),
    (85, 69, '165'),
    (85, 70, 'IPS'),
    (85, 71, '1'),
    (85, 72, 'DisplayPort 1.2'),
    (85, 72, 'HDMI 2.0'),
    (85, 73, '16:9'),
    (85, 74, FALSE),
    (85, 75, 'FreeSync'),
    (85, 61, 'Plastic'),
    (85, 62, '4.9'),
    (85, 63, '539 x 504 x 227'),
    (85, 64, TRUE),
    -- #86
    (86, 76, 'Cherry MX Speed'),
    (86, 77, 'Full Size'),
    (86, 78, 'USB'),
    (86, 79, 'RGB'),
    (86, 61, 'Aluminum / Plastic'),
    (86, 62, '1.32'),
    (86, 63, '465 x 171 x 36'),
    (86, 64, TRUE),
    -- #87
    (87, 76, 'Hot-Swappable GX'),
    (87, 77, 'TKL'),
    (87, 78, 'USB'),
    (87, 79, 'RGB'),
    (87, 61, 'Plastic'),
    (87, 62, '0.98'),
    (87, 63, '361 x 153 x 34'),
    (87, 64, TRUE),
    -- #88
    (88, 76, 'Razer Green'),
    (88, 77, 'Full Size'),
    (88, 78, 'USB'),
    (88, 79, 'RGB'),
    (88, 61, 'Aluminum / Plastic'),
    (88, 62, '1.25'),
    (88, 63, '450 x 160 x 42'),
    (88, 64, TRUE),
    -- #89
    (89, 76, 'OmniPoint Adjustable'),
    (89, 77, 'Full Size'),
    (89, 78, 'USB'),
    (89, 79, 'RGB'),
    (89, 61, 'Aluminum / Plastic'),
    (89, 62, '0.97'),
    (89, 63, '436 x 139 x 40'),
    (89, 64, TRUE),
    -- #90
    (90, 76, 'Membrane'),
    (90, 77, 'Full Size'),
    (90, 78, 'USB'),
    (90, 79, 'RGB Zones'),
    (90, 61, 'Plastic'),
    (90, 62, '1.12'),
    (90, 63, '443 x 175 x 36'),
    (90, 64, TRUE),
    -- #91
    (91, 80, 'Optical HERO'),
    (91, 81, '25600'),
    (91, 82, '5'),
    (91, 83, 'Wireless'),
    (91, 84, FALSE),
    (91, 61, 'Plastic'),
    (91, 62, '0.063'),
    (91, 63, '125 x 63 x 40'),
    (91, 64, FALSE),
    -- #92
    (92, 80, 'Optical Focus Pro'),
    (92, 81, '30000'),
    (92, 82, '5'),
    (92, 83, 'Wireless'),
    (92, 84, FALSE),
    (92, 61, 'Plastic'),
    (92, 62, '0.063'),
    (92, 63, '128 x 68 x 44'),
    (92, 64, TRUE),
    -- #93
    (93, 80, 'Optical TrueMove Air'),
    (93, 81, '18000'),
    (93, 82, '9'),
    (93, 83, 'USB'),
    (93, 84, FALSE),
    (93, 61, 'Plastic'),
    (93, 62, '0.085'),
    (93, 63, '128 x 68 x 43'),
    (93, 64, TRUE),
    -- #94
    (94, 80, 'Optical PixArt PMW3391'),
    (94, 81, '18000'),
    (94, 82, '8'),
    (94, 83, 'USB'),
    (94, 84, TRUE),
    (94, 61, 'Aluminum / Plastic'),
    (94, 62, '0.097'),
    (94, 63, '118 x 72 x 39'),
    (94, 64, TRUE),
    -- #95
    (95, 80, 'Optical PixArt 3335'),
    (95, 81, '16000'),
    (95, 82, '6'),
    (95, 83, 'USB'),
    (95, 84, FALSE),
    (95, 61, 'Plastic'),
    (95, 62, '0.059'),
    (95, 63, '124 x 66 x 38'),
    (95, 64, TRUE),
    -- #96
    (96, 85, 'Windows'),
    (96, 86, '11 Home'),
    (96, 87, 'x64'),
    (96, 88, 'Retail License'),
    (96, 89, 'Desktop PC'),
    -- #97
    (97, 85, 'Windows'),
    (97, 86, '11 Pro'),
    (97, 87, 'x64'),
    (97, 88, 'Retail License'),
    (97, 89, 'Desktop PC'),
    -- #98
    (98, 85, 'Linux'),
    (98, 86, '24.04 LTS'),
    (98, 87, 'x64'),
    (98, 88, 'Open Source'),
    (98, 89, 'Desktop PC'),
    -- #99
    (99, 85, 'Linux'),
    (99, 86, 'Workstation'),
    (99, 87, 'x64'),
    (99, 88, 'Open Source'),
    (99, 89, 'Desktop PC'),
    -- # 100
    (100, 85, 'Windows'),
    (100, 86, '10 Pro'),
    (100, 87, 'x64'),
    (100, 88, 'Retail License'),
    (100, 89, 'Desktop PC'),
    -- # 101
    (101, 90, 'GPU'),
    (101, 91, '551.86'),
    (101, 92, 'Windows'),
    (101, 93, 'x64'),
    (101, 94, 'PCIe'),
    -- # 102
    (102, 90, 'GPU'),
    (102, 91, '24.3.1'),
    (102, 92, 'Windows'),
    (102, 93, 'x64'),
    (102, 94, 'PCIe'),
    -- # 103
    (103, 90, 'Chipset'),
    (103, 91, '10.1.20020'),
    (103, 92, 'Windows'),
    (103, 93, 'x64'),
    (103, 94, 'Motherboard'),
    -- # 104
    (104, 90, 'Audio'),
    (104, 91, '6.0.9475'),
    (104, 92, 'Windows'),
    (104, 93, 'x64'),
    (104, 94, 'HD Audio'),
    -- # 105
    (105, 90, 'Ethernet'),
    (105, 91, '29.1'),
    (105, 92, 'Windows'),
    (105, 93, 'x64'),
    (105, 94, 'PCIe'),
    -- # 106
    (106, 95, 'hardware_info'),
    (106, 96, 'system_monitoring'),
    (106, 93, 'Windows'),
    (106, 94, 'x64'),
    (106, 97, 'CPUID'),
    -- # 107
    (107, 95, 'monitoring'),
    (107, 96, 'hardware_monitor'),
    (107, 93, 'Windows'),
    (107, 94, 'x64'),
    (107, 97, 'CPUID'),
    -- # 108
    (108, 95, 'gpu_tuning'),
    (108, 96, 'overclocking'),
    (108, 93, 'Windows'),
    (108, 94, 'x64'),
    (108, 97, 'MSI'),
    -- # 109
    (109, 95, 'storage_monitoring'),
    (109, 96, 'disk_health'),
    (109, 93, 'Windows'),
    (109, 94, 'x64'),
    (109, 97, 'Crystal Dew World'),
    -- # 110
    (110, 95, 'benchmark'),
    (110, 96, 'performance_test'),
    (110, 93, 'Windows'),
    (110, 94, 'x64'),
    (110, 97, 'UL Solutions'),
    -- # 111
    (111, 1, 'TEST_SOCKET_A'),
    (111, 3, '8'),
    (111, 4, '3200'),
    (111, 5, '16'),
    (111, 6, '65'),
    (111, 7, '4800'),
    (111, 98, 'Test_CPU_1'),
    -- # 112
    (112, 1, 'TEST_SOCKET_B'),
    (112, 3, '12'),
    (112, 4, '3600'),
    (112, 5, '24'),
    (112, 6, '95'),
    (112, 7, '5600'),
    (112, 98, 'Test_CPU_2'),
    -- # 113
    (113, 1, 'TEST_SOCKET_A'),
    (113, 3, '16'),
    (113, 4, '4200'),
    (113, 5, '32'),
    (113, 6, '125'),
    (113, 7, '6000'),
    (113, 98, 'Test_CPU_3'),
    -- # 114
    (114, 8, 'GDDR6'),
    (114, 9, '8'),
    (114, 10, '1800'),
    (114, 11, '250'),
    (114, 12, '8-pin'),
    (114, 13, '2'),
    (114, 14, '550'),
    (114, 98, 'Test_GPU_1'),
    -- # 115
    (115, 8, 'GDDR6X'),
    (115, 9, '12'),
    (115, 10, '2100'),
    (115, 11, '300'),
    (115, 12, '2x8-pin'),
    (115, 13, '2.5'),
    (115, 14, '650'),
    (115, 98, 'Test_GPU_2'),
    -- # 116
    (116, 8, 'GDDR7'),
    (116, 9, '16'),
    (116, 10, '2500'),
    (116, 11, '320'),
    (116, 12, '16-pin'),
    (116, 13, '3'),
    (116, 14, '750'),
    (116, 98, 'Test_GPU_3'),
    -- # 117
    (117, 15, 'DDR4'),
    (117, 16, '2'),
    (117, 17, 'DIMM'),
    (117, 18, '16'),
    (117, 19, '2'),
    (117, 20, '3200'),
    (117, 98, 'Test_RAM_1'),
    -- # 118
    (118, 15, 'DDR5'),
    (118, 16, '2'),
    (118, 17, 'DIMM'),
    (118, 18, '32'),
    (118, 19, '2'),
    (118, 20, '5600'),
    (118, 98, 'Test_RAM_2'),
    -- # 119
    (119, 15, 'DDR5'),
    (119, 16, '4'),
    (119, 17, 'DIMM'),
    (119, 18, '64'),
    (119, 19, '4'),
    (119, 20, '6000'),
    (119, 98, 'Test_RAM_3');


