# Development Log – Modular PC Configurator Prototype
This document tracks the architectural planning and early development decisions of the project.
The goal of this log is to document the reasoning behind structural decisions and to provide transparency for the development process.

---

# V1 - Intitial Architecture Planning

## Project Context
The project was created as a prototype to explore the architecture of a modular hardware configurator system.
The focus of this prototype is not to replicate an existing production configurator, but to demonstrate a scalable and maintainable system design.

Key architectural goals include:
- modular system design
- centralized compatibility validation
- maintainable code structure
- clear separation of concerns
- extensibility for future system integrations

---

# Phase 1 – Project Definition

## Objectives
The primary goal of this project is to design a **maintainable configurator architecture** capable of validating compatibility between hardware components.

The system should:
- allow users to configure a hardware system
- prevent invalid configurations
- dynamically validate component compatibility
- provide a scalable architecture for future extensions

---

## User Groups
Two user groups were defined during early planning.

### Beginner Users
Beginner users typically have limited hardware knowledge.

For this group the configurator should:
- provide a simplified configuration flow
- hide complex hardware parameters
- automatically choose compatible system components when possible

This concept is implemented as **Simple Mode**.

### Advanced Users
Advanced users often want full control over system configuration.

For this group the configurator should:
- allow full component selection
- expose hardware specifications
- allow manual tuning of system configurations

This concept is implemented as **Advanced Mode**.

---

## Component Scope
To keep the prototype focused while still representing realistic hardware constraints, the following component groups were defined.

### Core Components
These components define the capabilities of the system.
- CPU
- GPU
- RAM
- Motherboard
- Power Supply (PSU)

### System Components
These components define system structure and thermal management.
- Case
- Cooling
- Fans

### Accessories
Optional components that can be attached to the system.
- Cables

---

# Phase 2 – System Design
During Phase 2 the architectural structure of the project was defined.
The goal was to create a **modular system that separates responsibilities clearly**.

---

## Architectural Principles
The architecture follows several principles commonly used in modern backend frameworks.

### Separation of Concerns
The system separates responsibilities into different layers:
- presentation layer
- business logic layer
- data access layer

### Modular Structure
Each functional responsibility is separated into its own module.

Key modules include:
- components
- configurator services
- repositories
- database layer

---

## Service Layer
The service layer is responsible for implementing the main business logic.
Three primary services were defined.

### ConfiguratorService
Central orchestration layer responsible for handling configuration workflows.

Responsibilities include:
- loading components
- coordinating validation logic
- preparing configuration results

### CompatibilityService
Responsible for validating component compatibility.

Example responsibilities:
- CPU <-> motherboard compatibility
- RAM slot validation
- PSU power checks
- physical dimension constraints

### PricingService
Responsible for calculating the total configuration price based on selected components.

---

## Repository Layer
Repositories abstract all database interactions.
Instead of writing SQL queries directly inside services, repositories provide structured access to stored data.

Planned repositories include:
- `ComponentRepository`
- `RuleRepository`

This design ensures that database logic remains isolated from business logic.

---

## Database Layer
A dedicated database layer was planned in order to manage database connections centrally.

The file `Database.php` will later handle:
- database connections
- configuration loading
- connection reuse

---

# Phase 3 – Database Design

## Objectives
During Phase 3 the data model of the configurator was implemented.
The goal was to design a **flexible and extensible schema** capable of representing hardware components and their relationships.

Instead of modeling every component type with dedicated database tables, the system follows a **generic component and attribute model**.
This approach allows the configurator to support new component types and hardware properties without requiring structural database changes.

---

## Component Model
Hardware components are stored in a centralized `components` table.
Each component is assigned to a `component_type`, which itself belongs to a `component_category`.
This hierarchical structure allows the system to group components logically while keeping the data model flexible.

Structure overview:
- `component_categories`
    - `component_types`
        - `components`

This design enables the configurator to dynamically retrieve available components for each configuration step.

---

## Attribute System
To support the wide variety of hardware specifications, the system uses a dynamic attribute model.
Instead of storing hardware specifications as fixed database columns, attributes are stored in two tables:
- attribute_definitions
- component_attributes

`attribute_definitions` contains the list of supported hardware attributes, such as:
- socket
- memory type
- GPU length
- PSU wattage
- motherboard form factor
- radiator size

`component_attributes` stores the actual attribute values for each component.
This approach allows the system to support new hardware attributes without modifying the database schema.

---

## Compatibility Rule System
A central design goal of the configurator is centralized compatibility validation.
Instead of hardcoding compatibility checks in the application logic, the system stores compatibility relationships inside the database.

Compatibility rules are stored in the table:
- `compatibility_rules`

Each rule defines a relationship between:
- two component types
- two attributes
- a comparison rule

Example rule types include:
- `equals`
- `less_equal`
- `greater_equal`

This structure allows the backend to evaluate compatibility dynamically.

Example rule logic:
- CPU socket must match motherboard socket support
- GPU length must not exceed case maximum GPU length
- PSU wattage must meet or exceed GPU recommended PSU wattage
- RAM speed must not exceed motherboard supported RAM speed

This rule-based system enables the configurator to remain flexible while centralizing hardware validation logic.

---

## Pricing Model Preparation
Although price calculation is implemented later in the backend, Phase 3 already prepared the pricing data model.

The following tables were introduced:
- `currencies`
- `tax_classes`
- `tax_rates`
- `promotions`
- `promotion_components`

This structure allows the system to calculate configuration prices dynamically based on:
- component base price
- tax rules
- active promotions

The pricing model is intentionally separated from compatibility logic to maintain clear separation of concerns.

---

# Phase 4 - Basic Backend Implementation

## Objectives
Phase 4 prepares the technical foundation required for implementing the backend logic of the configurator.
At this stage the focus is **not on implementing application logic**, but on preparing the structural elements that will later allow the backend to interact with the database and execute configurator logic.
The goal is to ensure that the project can be initialized quickly and that the required infrastructure for further development is already defined.

---

## Project Structure Preparation
During this phase the backend folder structure was prepared in order to separate responsibilities between different parts of the system.

The project structure introduces dedicated modules for:
- database access
- repositories
- configurator services
- component definitions

The following core backend modules were defined:
- `database`
- `repository`
- `configurator`
- `components`

These modules will later contain the implementation of the backend logic.
At this stage the files primarily act as structural placeholders for the upcoming development phases.

---

## Database Initialization System
To simplify project setup, the database structure was organized into a modular SQL dataset.
The `database/` directory contains the complete schema and dataset required to initialize the configurator database.

This allows the backend environment to be created within seconds by importing the provided SQL files.
The dataset includes:
- database schema
- component categories
- component types
- attribute definitions
- hardware components
- compatibility rules
- pricing structures

This approach ensures that every developer or reviewer of the project can immediately reproduce the same test environment. 

## Focus
It is important to note that this phase focuses solely on preparing the development environment and database foundation.
No backend logic has been implemented yet.

In particular, the following elements are still pending:
- database connection implementation
- repository logic
- compatibility evaluation engine
- configurator workflow logic
- price calculation logic

These elements will be implemented in the following development phases.

--- 

## Result of Phase 4
At the end of Phase 4 the project provides:
- a complete database schema
- a fully populated test dataset
- a prepared backend project structure
- clearly defined architectural modules

This foundation enables the next phase of development, where the actual configurator logic will be implemented.

---