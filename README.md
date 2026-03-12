⚠️ This project is a prototype for demonstrating configurator architecture and compatibility logic.
# Modular PC Configurator Prototype

## Overview
Prototype of a modular hardware configurator for pc components.

The system provides two configuration modes:
- **Simple Mode** - simplified configuration for beginners
- **Advanced Mode** - full control for experienced users

The Goal is to design a maintainable architecture with centralized compatibility logic and dynamic component validation.

--- 

## Tech-Stack
- HTML / CSS
- JavaScript
- PHP
- MySQL

---

## Planned Architecture
The configurator will be structured in a modular architecture:

```text
root/
│
├── public/
│   ├── index.php
│   ├── configure.php
│   └── assets/
│       ├── css/
│       └── js/
│
├── src/
│   ├── components/
│   │   ├── core/
│   │   │   ├── CPU.php
│   │   │   ├── GPU.php
│   │   │   ├── RAM.php
│   │   │   ├── Motherboard.php
│   │   │   └── PSU.php
│   │   │
│   │   ├── system/
│   │   │   ├── Case.php
│   │   │   ├── Cooling.php
│   │   │   └── Fans.php
│   │   │
│   │   └── accessories/
│   │       └── Cables.php
│   │
│   ├── configurator/
│   │   ├── ConfiguratorService.php
│   │   ├── CompatibilityService.php
│   │   └── PricingService.php
│   │
│   ├── repository/
│   │   ├── ComponentRepository.php
│   │   └── RuleRepository.php
│   │
│   └── database/
│       └── Database.php
│
├── config/
│   └── config.php
│
├── database/
│   └── schema.sql
│
├── README.md
├── README_DE.md
└── docs/


---

## Core Objective
- modular architecture
- centralized compatibility logic
- dynamic price calculation
- long-term maintainability
- clear seperation of data, logic and user interface (UI)

---

## Project specific Objectives

### Functional
- choose an basic system
- filter compatible components
- prevent invalid configurations
- dynamic price-rendering
- support simple & advanced configuration modes

### Technical
- practical implementation of PHP & MySQL
- modular folder and code structure
- centralized business logic
- clean compatibility rule desgin
- architecture prepared for intergation into larger systems

### Portfolio Goals
- clean project structure
- readable documentation
- documented development workflow
- demonstration of system design thinking

---

## Project Phases

### Phase 1 - Project-Defintion
- set objective + scope 
- definition of user-groups
- set features
- set components

### Phase 2 - System-Design
- data-modeling
- define folder-structure
- set responsibilities of modules
- definition of "Simple" and "Advanced" - Mode

### Phase 3 - Database-Design
- planning of tables
- define responsibilities
- design compatibility-rules
- planing of price model

### Phase 4 - Basic Backend
- set project structure
- set connection to database
- prepare data-access & repositiories
- set first datasets

### Phase 5 - Configurator-Logic
- load components
- test compatibility
- test limits
- calculate price

### Phase 6 - UI / User-flow
- Landingpage
- choose between simple/advanced
- Configurator-Page
- error- & message handling
- result/overview-area

### Phase 7 - Refactoring/Documentation
- unify namings
- centralize logic
- hold on to possible extensions