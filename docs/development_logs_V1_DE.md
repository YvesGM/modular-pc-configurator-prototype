# Entwicklungsprotokoll – Modularer PC-Konfigurator Prototyp
Dieses Dokument umfasst die architektonische Planung sowie die frühen Entwicklungsentscheidungen des Projekts.
Ziel dieses Protokolls ist es, die Überlegungen hinter strukturellen Entscheidungen festzuhalten und den Entwicklungsprozess transparent darzustellen.

---

# V1 – Erste Architekturplanung

## Projektkontext
Dieses Projekt wurde als Prototyp erstellt, um die Architektur eines modularen Hardware-Konfigurators zu untersuchen.
Der Fokus dieses Prototyps liegt nicht darauf, einen bestehenden Produktions-Konfigurator exakt nachzubilden, sondern darauf, ein skalierbares und wartbares Systemdesign zu demonstrieren.

Wichtige Architekturziele sind:
- modulares Systemdesign
- zentralisierte Kompatibilitätsprüfung
- wartbare Code-Struktur
- klare Trennung von Verantwortlichkeiten
- Erweiterbarkeit für zukünftige Systemintegrationen

---

# Phase 1 – Projektdefinition

## Ziele
Das primäre Ziel dieses Projekts ist die Entwicklung einer wartbaren Konfigurator-Architektur, die die Kompatibilität zwischen Hardwarekomponenten überprüfen kann.

Das System soll:
- Nutzern ermöglichen, ein Hardware-System zu konfigurieren
- ungültige Konfigurationen verhindern
- die Kompatibilität von Komponenten dynamisch prüfen
- eine skalierbare Architektur für zukünftige Erweiterungen bereitstellen

---

## Nutzergruppen
In der frühen Planungsphase wurden zwei Hauptnutzergruppen definiert.

### Einsteiger
Einsteiger verfügen in der Regel über begrenztes Wissen über Hardwarekomponenten.

Für diese Nutzergruppe sollte der Konfigurator:
- einen vereinfachten Konfigurationsablauf bieten
- einen vereinfachten Konfigurationsablauf bieten
- kompatible Systemkomponenten möglichst automatisch auswählen

Dieses Konzept wird als **Einfacher Modus** umgesetzt.

### Fortgeschrittene Nutzer
Fortgeschrittene Nutzer möchten häufig die volle Kontrolle über die Systemkonfiguration haben.

Für diese Nutzergruppe sollte der Konfigurator:
- die vollständige Auswahl aller Komponenten ermöglichen
- Hardware-Spezifikationen sichtbar machen
- eine manuelle Feinabstimmung der Konfiguration erlauben

Dieses Konzept wird als **Erweiterter Modus** umgesetzt.

---

## Umfang der Komponenten
Um den Prototyp fokussiert zu halten und gleichzeitig realistische Hardware-Abhängigkeiten darzustellen, wurden folgende Komponentengruppen definiert.

### Kernkomponenten
Diese Komponenten bestimmen die grundlegende Leistungsfähigkeit des Systems.
- CPU
- GPU
- RAM
- Mainboard
- Netzteil (PSU)

### Systemkomponenten
Diese Komponenten definieren die physische Struktur sowie das Kühlsystem des Rechners.
- Gehäuse
- Kühlung
- Lüfter

### Zubehör
Optionale Komponenten, die dem System hinzugefügt werden können.
- Kabel

---

# Phase 2 – Systemdesign
Während Phase 2 wurde die grundlegende Architekturstruktur des Projekts definiert.
Das Ziel war es, ein **modulares System mit klar getrennten Verantwortlichkeiten** zu entwickeln.

---

## Architekturprinzipien
Die Architektur folgt mehreren Prinzipien, die auch in modernen Backend-Frameworks häufig verwendet werden.

### Trennung der Verantwortlichkeiten/Beziehungen
Das System trennt verschiedene Verantwortungsbereiche in unterschiedliche Schichten:
- Präsentationsschicht (UI)
- Geschäftslogik-Schicht
- Datenzugriffsschicht

### Modulare Struktur
Jede funktionale Verantwortung wird in einem eigenen Modul organisiert.

Wichtige Module sind:
- Komponenten
- Konfigurator-Services
- Repositories
- Datenbankschicht

---

## Service-Schicht
Die Service-Schicht ist für die zentrale Geschäftslogik des Systems verantwortlich.
Es wurden drei Hauptservices definiert.

### ConfiguratorService (Konfigurations-Service)
Zentrale Orchestrierungsschicht für den Konfigurationsprozess.

Aufgaben:
- Laden von Komponenten
- Koordination der Validierungslogik
- Vorbereitung der Konfigurationsergebnisse

### CompatibilityService (Kompatibilitäts-Service)
Verantwortlich für die Überprüfung der Kompatibilität zwischen Komponenten.

Beispiele für Aufgaben:
- CPU <-> Mainboard Kompatibilität
- Überprüfung der RAM-Slots
- Überprüfung der Netzteil-Leistung
- Prüfung physischer Größenbeschränkungen

### PricingService (Preisberechnungs-Service)
Dieser Service berechnet den Gesamtpreis der Konfiguration basierend auf den ausgewählten Komponenten.

---

## Repository-Schicht
Repositories abstrahieren sämtliche Datenbankzugriffe.
Anstatt SQL-Abfragen direkt in Services zu schreiben, stellen Repositories eine strukturierte Schnittstelle für den Zugriff auf gespeicherte Daten bereit.

Geplante Repositories:
- ComponentRepository
- RuleRepository

Dieses Design stellt sicher, dass Datenbanklogik klar von der Geschäftslogik getrennt bleibt.

---

## Datenbank-Schicht
Zusätzlich wurde eine eigene Datenbankschicht geplant, um Datenbankverbindungen zentral zu verwalten.

Die Datei `Database.php` wird später folgende Aufgaben übernehmen:
- Aufbau der Datenbankverbindung
- Laden der Konfiguration
- Wiederverwendung bestehender Verbindungen


