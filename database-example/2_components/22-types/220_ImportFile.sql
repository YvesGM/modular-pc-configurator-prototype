INSERT INTO
    component_types (category_id, name, description)
VALUES
    -- #1
    (
        1,
        'cpu',
        'Central Processing Unit - the primary component responsible for executing instructions and processing data in a computer system'
    ),
    -- #2
    (
        1,
        'gpu',
        'Graphics Processing Unit - specialized hardware designed to accelerate graphics rendering and parallel processing tasks'
    ),
    -- #3
    (
        1,
        'ram',
        'Random Access Memory - volatile memory used for temporary data storage and fast access by the CPU'
    ),
    -- #4
    (
        2,
        'motherboard',
        'The main circuit board that connects and allows communication between all components of a computer system'
    ),
    -- #5
    (
        2,
        'case',
        'Enclosure that houses and protects the internal components of a computer system'
    ),
    -- #6
    (
        3,
        'air_cooler',
        'Cooling solution that uses fans and heatsinks to dissipate heat from components'
    ),
    -- #7
    (
        3,
        'liquid_cooler',
        'Cooling solution that uses liquid coolant and a radiator to dissipate heat from components'
    ),
    -- #8
    (
        4,
        'hdd',
        'Hard Disk Drive - traditional storage device that uses spinning disks to read/write data'
    ),
    -- #9
    (
        4,
        'ssd',
        'Solid State Drive - modern storage device that uses flash memory for faster data access and improved performance'
    ),
    -- #10
    (
        5,
        'atx_power_supply',
        'Standard power supply unit designed for desktop computers, providing various wattage options and connectors for different components'
    ),
    -- #11
    (
        5,
        'sfx_power_supply',
        'Compact power supply unit designed for small form factor (SFF) builds, offering high efficiency and modular cabling options'
    ),
    -- #12
    (
        6,
        'ethernet_card',
        'Network interface card (NIC) that provides wired network connectivity through an Ethernet port'
    ),
    -- #13
    (
        6,
        'wifi_card',
        'Network interface card (NIC) that provides wireless network connectivity through Wi-Fi standards'
    ),
    -- #14
    (
        7,
        'rgb_lighting',
        'Optional component that adds customizable lighting effects to a computer system for aesthetic purposes'
    ),
    -- #15
    (
        7,
        'fan_controller',
        'Device that allows users to adjust the speed of cooling fans for improved thermal management and noise control'
    ),
    -- #16
    (
        8,
        'pcie_expansion_card',
        'Additional hardware component that can be installed in a PCIe slot on the motherboard to provide extra functionality, such as additional USB ports, storage controllers, or network interfaces'
    ),
    -- #17
    (
        9,
        'monitor',
        'External display device used to visually output information from the computer system'
    ),
    -- #18
    (
        9,
        'keyboard',
        'Input device used for typing and interacting with the computer system'
    ),
    -- #19
    (
        9,
        'mouse',
        'Input device used for pointing, clicking, and navigating the computer system'
    ),
    -- #20
    (
        10,
        'operating_system',
        'Software that manages hardware resources and provides common services for computer programs'
    ),
    -- #21
    (
        10,
        'device_drivers',
        'Software components that allow the operating system to communicate with hardware devices and enable their functionality'
    ),
    -- #22
    (
        10,
        'utilities',
        'Software tools that provide additional functionality or enhance the user experience when using the computer system'
    ),
    -- #23
    (
        11,
        'test_cpu',
        'Temporary CPU used for testing and development purposes'
    ),
    -- #24
    (
        11,
        'test_gpu',
        'Temporary GPU used for testing and development purposes'
    ),
    -- #25
    (
        11,
        'test_ram',
        'Temporary RAM used for testing and development purposes'
    );