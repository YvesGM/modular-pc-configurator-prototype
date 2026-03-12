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

root/
|
|__ public/
|   |__ index.php
|   |__ configure.php
|   |__ assets/
|   |   |__ css/
|   |__ |__ js/
|
|__ src/
|   |__ components/
|   |   |__ core/
|   |   |   |__ CPU.php
|   |   |   |__ GPU.php
|   |   |   |__ RAM.php
|   |   |   |__ Motherboard.php
|   |   |   |__ PSU.php
|   |   |__ system/
|   |   |   |__ Case.php
|   |   |   |__ Cooling.php
|   |   |   |__ Fans.php
|   |   |__ accessories/
|   |   |__ |__ Cables.php
|   |  
|   |__ configurator/
|   |   |__ ConfiguratorService.php
|   |   |__ CompatibilityService.php
|   |   |__ PricingService.php
|   |  
|   |__ repository/
|   |   |__ ComponentRepository.php
|   |   |__ RuleRepository.php
|   |  
|   |__ database/
|   |__ |__ Database.php
|     
|__ config/
|   |__ config.php
|     
|__ database/
|   |__ schema.sql
|
|__ README.md
|__ docs/


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
- Verbindung zur Datenbank herstellen
- Datenzugriff und Repositories vorbereiten
- erste Datensätze erstellen

### Phase 5 – Konfigurator-Logik
- Komponenten laden
- Kompatibilität prüfen
- Systemlimits überprüfen
- Preis berechnen

### Phase 6 – UI / Benutzerfluss
- Landingpage
- Auswahl zwischen Simple und Advanced Mode
- Konfigurator-Seite
- Fehler- und Hinweislogik
- Ergebnis- / Übersichtsbereich

### Phase 7 – Refactoring & Dokumentation
- Namenskonventionen vereinheitlichen
- Logik zentralisieren
- mögliche Erweiterungen dokumentieren