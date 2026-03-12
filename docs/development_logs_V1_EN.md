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
- ComponentRepository
- RuleRepository

This design ensures that database logic remains isolated from business logic.

---

## Database Layer
A dedicated database layer was planned in order to manage database connections centrally.

The file `Database.php` will later handle:
- database connections
- configuration loading
- connection reuse


