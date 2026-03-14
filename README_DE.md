⚠️ Dieses Projekt ist ein Prototyp zur Demonstration der Architektur eines Konfigurators, sowie der Logik zur Kompatibilitätsprüfung von Hardwarekomponenten.

# Modularer PC-Konfigurator – Prototyp

## Übersicht
Prototyp eines modular aufgebauten Hardware-Konfigurators für PC-Komponenten.

Das System bietet zwei Konfigurationsmodi:
- **Einfacher Modus** - vereinfachte Konfiguration für Einsteiger
- **Erweiterter Modus** - vollständige Kontrolle für erfahrene Nutzer

Ziel des Projekts ist die Entwicklung einer wartbaren Architektur mit zentralisierter Kompatibilitätslogik sowie einer dynamischen Validierung von Hardwarekomponenten.

--- 

## Tech-Stack
- HTML / CSS
- JavaScript
- PHP
- MySQL

---

## Geplante Architektur
Der Konfigurator wird in einer modularen Architektur aufgebaut:

```
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
│   │
│   ├── controller/
│   │   └── ConfiguratorController.php
│   │
│   ├── components/
│   │   ├── core/
│   │   ├── system/
│   │   ├── cooling/
│   │   ├── storage/
│   │   ├── power-delivery/
│   │   ├── networking/
│   │   ├── accessories/
│   │   ├── expansion/
│   │   ├── peripherals/
│   │   ├── software/
│   │   └── testing/
│   │
│   ├── configurator/
│   │   ├── ConfiguratorService.php
│   │   ├── CompatibilityService.php
│   │   └── PricingService.php
│   │
│   ├── repository/
│   │   ├── ComponentRepository.php
│   │   ├── CompatibilityRepository.php
│   │   └── PricingRepository.php
│   │
│   └── database/
│       └── Connection.php
│           
├── config/
│   └── db-config/
│       └── DatabaseList.php
│   
├── database-example/
│   ├── 1_BasicTables.sql
│   │
│   ├── 2_components/
│   │   ├── 21_CategoryDatasets.sql
│   │   └── 22-types/
│   │       ├── 220_ImportFile.sql
│   │       └── 23-specific-components/
│   │           └── 230_ImportFile.sql
│   │
│   └── 3_compatibility/
│       ├── RulesEqual.sql
│       ├── RulesGreater.sql
│       └── RulesLess.sql
│
├── README.md
├── README_DE.md
└── docs/
    ├── DevelopmentLogsEN.md
    └── DevelopmentLogsDE.md
```

---

## Hauptziele
- modulare Architektur
- zentralisierte Kompatibilitätslogik
- dynamische Preisberechnung
- langfristige Wartbarkeit und Erweiterbarkeit
- klare Trennung von Daten, Logik und Benutzeroberfläche (UI)

---

## Project specific Objectives

### Functional
- Auswahl eines Basissystems ermöglichen
- kompatible Komponenten filtern
- ungültige Konfigurationen verhindern
- dynamische Preisberechnung
- Unterstützung eines einfachen und eines erweiterten Konfigurationsmodus

### Technical
- praktische Anwendung von PHP und MySQL
- modulare Ordner- und Code-Struktur
- zentralisierte Geschäftslogik
- saubere Gestaltung der Kompatibilitätsregeln
- Architektur vorbereitet für mögliche Integration in größere Systeme

### Portfolio Goals
- saubere Projektstruktur
- verständliche Dokumentation
- dokumentierter Entwicklungs-Workflow
- Demonstration von Systemdesign-Denken

---

## Projektphasen

### Phase 1 – Projektdefinition
- Ziel und Umfang festlegen
- Definition der Nutzergruppen
- Festlegung der Features
- Festlegung der Komponenten

### Phase 2 – Systemdesign
- Datenmodell entwerfen
- Ordnerstruktur definieren
- Verantwortlichkeiten der Module festlegen
- Definition von Simple Mode und Advanced Mode

### Phase 3 – Datenbankdesign
- Planung der Tabellen
- Definition der Beziehungen
- Gestaltung der Kompatibilitätsregeln
- Planung des Preismodells

### Phase 4 – Backend-Grundlagen
- Projektstruktur einrichten
- zentralisierte Datenbankverbindung implementieren
- Repository-Architektur vorbereiten
- Backend-Module vorbereiten
- Beispiel-Datenbankdatensatz initialisieren

### Phase 5 – Konfigurator-Logik
- Komponenten-Repositories implementieren
- Komponenten und Attribute aus der Datenbank laden
- Kompatibilitäts-Evaluierungs-Engine implementieren
- Konfigurationsbeschränkungen validieren
- kompatible Komponenten dynamisch filtern
- Preisberechnung implementieren

### Phase 6 – UI / Benutzerfluss
- Landingpage
- Auswahl zwischen einfachem und erweitertem Modus
- Konfigurator-Seite
- Fehler- und Nachrichtenbehandlung
- Ergebnis- / Übersichtsbereich

### Phase 7 – Refactoring & Dokumentation
- Namenskonventionen vereinheitlichen
- Logik zentralisieren
- mögliche Erweiterungen dokumentieren und berücksichtigen