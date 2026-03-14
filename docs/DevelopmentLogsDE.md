# Entwicklungsprotokoll – Modularer PC-Konfigurator Prototyp
Dieses Dokument umfasst die architektonische Planung sowie die frühen Entwicklungsentscheidungen des Projekts.
Ziel dieses Protokolls ist es, die Überlegungen hinter strukturellen Entscheidungen festzuhalten und den Entwicklungsprozess transparent darzustellen.

---

# V1 – Erste Architekturplanung

## Projektkontext
Dieses Projekt wurde als Prototyp erstellt, um die Architektur eines modularen Hardware-Konfigurators zu untersuchen.
Der Fokus dieses Prototyps liegt darauf, ein skalierbares und wartbares Systemdesign zu demonstrieren.

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
- `ComponentRepository`
- `RuleRepository`

Dieses Design stellt sicher, dass Datenbanklogik klar von der Geschäftslogik getrennt bleibt.

---

## Datenbank-Schicht
Zusätzlich wurde eine eigene Datenbankschicht geplant, um Datenbankverbindungen zentral zu verwalten.

Die Datei `Database.php` wird später folgende Aufgaben übernehmen:
- Aufbau der Datenbankverbindung
- Laden der Konfiguration
- Wiederverwendung bestehender Verbindungen

--- 

# Phase 3 – Datenbankdesign

## Ziele
In Phase 3 wurde das Datenmodell des Konfigurators entworfen und umgesetzt.
Das Ziel bestand darin, ein **flexibles und erweiterbares Datenbankschema** zu entwickeln, das Hardwarekomponenten und deren Beziehungen zueinander abbilden kann.

Anstatt für jede Komponentenart eigene Tabellenstrukturen zu definieren, verwendet das System ein **generisches Komponenten- und Attributmodell**.
Dieser Ansatz ermöglicht es dem Konfigurator, neue Komponentenarten oder Hardwareeigenschaften zu unterstützen, ohne strukturelle Änderungen an der Datenbank durchführen zu müssen.

---

## Komponentenmodell
Hardwarekomponenten werden zentral in der Tabelle `components` gespeichert.
Jede Komponente ist einem `component_type` zugeordnet, der wiederum zu einer `component_category` gehört.
Diese hierarchische Struktur ermöglicht es, Komponenten logisch zu gruppieren und gleichzeitig ein flexibles Datenmodell beizubehalten.

Strukturübersicht:
- `component_categories`
    - `component_types`
        - `components`

Dieses Design ermöglicht es dem Konfigurator, die verfügbaren Komponenten für jeden Konfigurationsschritt dynamisch abzurufen.

---

## Attributsystem
Um die große Vielfalt an Hardwareeigenschaften abzubilden, verwendet das System ein dynamisches Attributmodell.
Anstatt Hardwareeigenschaften als feste Datenbankspalten zu definieren, werden Attribute in zwei Tabellen gespeichert:
- attribute_definitions
- component_attributes

Die Tabelle `attribute_definitions` enthält die Liste aller unterstützten Hardwareattribute, zum Beispiel:
- Socket
- Speicher-Typ
- GPU-Länge
- Netzteil-Leistung
- Mainboard-Formfaktor
- Radiatorgröße

Die Tabelle `component_attributes` speichert die tatsächlichen Attributwerte für jede Komponente.
Dieser Ansatz erlaubt es, neue Hardwareattribute zu unterstützen, ohne das Datenbankschema ändern zu müssen.

---

## Kompatibilitätsregelsystem
Ein zentrales Ziel des Konfigurators ist eine **zentralisierte Validierung der Hardwarekompatibilität**.
Anstatt Kompatibilitätsprüfungen direkt im Anwendungscode zu implementieren, werden die Beziehungen zwischen Komponenten in der Datenbank gespeichert.

Die Kompatibilitätsregeln befinden sich in der Tabelle:
- `compatibility_rules`

Jede Regel beschreibt eine Beziehung zwischen:
- zwei Komponententypen
- zwei Attributen
- einer Vergleichslogik

Beispiele für Regeltypen sind:
- `equals`
- `less_equal`
- `greater_equal`

Diese Struktur ermöglicht es dem Backend, Kompatibilität dynamisch auszuwerten.

Beispiele für solche Regeln:
- Der CPU-Sockel muss mit dem Sockel des Mainboards übereinstimmen
- Die Länge der GPU darf die maximal unterstützte GPU-Länge des Gehäuses nicht überschreiten
- Die Netzteilleistung muss mindestens der empfohlenen Leistung für die GPU entsprechen
- Die RAM-Geschwindigkeit darf die vom Mainboard unterstützte maximale RAM-Geschwindigkeit nicht überschreiten

Dieses regelbasierte System ermöglicht es dem Konfigurator, flexibel zu bleiben und gleichzeitig die Hardwarevalidierung zentral zu steuern.

---

## Vorbereitung des Preismodells
Obwohl die Preisberechnung erst später im Backend implementiert wird, wurde das Datenmodell für die Preislogik bereits in Phase 3 vorbereitet.

Dafür wurden folgende Tabellen eingeführt:
- `currencies`
- `tax_classes`
- `tax_rates`
- `promotions`
- `promotion_components`

Diese Struktur ermöglicht es dem System, Konfigurationspreise dynamisch zu berechnen, basierend auf:
- dem Grundpreis der Komponenten
- Steuerregeln
- aktiven Aktionen oder Rabatten

Das Preismodell ist bewusst von der Kompatibilitätslogik getrennt, um eine klare Trennung der Verantwortlichkeiten im System zu gewährleisten.

---

# Phase 4 - Basic Backend Implementation

## Objectives
Phase 4 dient der Vorbereitung der technischen Grundlage für die spätere Implementierung der Backend-Logik des Konfigurators.
Der Fokus dieser Phase liegt **nicht auf der Implementierung von Anwendungscode**, sondern auf der Vorbereitung der strukturellen Komponenten, die später die Interaktion zwischen Backend und Datenbank ermöglichen.
Ziel dieser Phase ist es, sicherzustellen, dass das Projekt schnell initialisiert werden kann und die notwendige Infrastruktur für die weitere Entwicklung bereits definiert ist.

---

## Vorbereitung der Projektstruktur
In dieser Phase wurde die Backend-Ordnerstruktur vorbereitet, um verschiedene Verantwortungsbereiche des Systems klar voneinander zu trennen.

Die Projektstruktur führt dedizierte Module für folgende Bereiche ein:
- Datenbankzugriff
- Repositories
- Konfigurator-Services
- Komponentenstrukturen

Folgende zentrale Backendmodule wurden definiert:
- `database`
- `repository`
- `configurator`
- `components`

Diese Module werden in späteren Entwicklungsphasen die eigentliche Backend-Logik enthalten.
Zum aktuellen Zeitpunkt dienen die Dateien jedoch hauptsächlich als strukturelle Platzhalter für die kommende Implementierung.

---

## Datenbank-Initialisierungssystem
Um die Einrichtung des Projekts zu vereinfachen, wurde die Datenbankstruktur als modularer SQL-Datensatz organisiert.
Das Verzeichnis `database/` enthält das vollständige Schema sowie alle notwendigen Datensätze zur Initialisierung der Konfigurator-Datenbank.
Dadurch kann die Backend-Umgebung innerhalb weniger Sekunden erstellt werden, indem die bereitgestellten SQL-Dateien importiert werden.

Der Datensatz umfasst unter anderem:
- das vollständige Datenbankschema
- Komponenten-Kategorien
- Komponenten-Typen
- Attributdefinitionen
- Hardwarekomponenten
- Kompatibilitätsregeln
- Preisstrukturen

Dieser Ansatz stellt sicher, dass jeder Entwickler oder Betrachter des Projekts jederzeit eine identische Testumgebung reproduzieren kann.

## Fokus
Es ist wichtig zu betonen, dass sich diese Phase ausschließlich auf die Vorbereitung der Entwicklungsumgebung und der Datenbankbasis konzentriert.
Es wurde **noch keine Backend-Logik implementiert**.

Insbesondere fehlen aktuell noch folgende Elemente:
- Implementierung der Datenbankverbindung
- Repository-Logik
- Kompatibilitätsprüfungs-Engine
- Konfigurator-Workflow-Logik
- Preisberechnungslogik

Diese Komponenten werden in den folgenden Entwicklungsphasen umgesetzt.

--- 

## Ergebnis von Phase 4
Am Ende von Phase 4 verfügt das Projekt über:
- ein vollständiges Datenbankschema
- einen vollständig befüllten Testdatensatz
- eine vorbereitete Backend-Projektstruktur
- klar definierte Architekturmodule

Diese Grundlage ermöglicht den Übergang in die nächste Entwicklungsphase, in der die eigentliche Konfiguratorlogik implementiert wird.

---

# Phase 5 – Backend-Interaktionsdesign

## Ziele
Phase 5 konzentriert sich auf die Definition des **Runtime-Interaktionsflusses zwischen Frontend-Anfragen, Backend-Services und der Datenbankschicht**.

Während frühere Phasen die Projektstruktur und das Datenbankmodell etablierten, definiert diese Phase **wie Daten während der Laufzeit durch das System fließen**.

Das Ziel ist sicherzustellen, dass das Backend des Konfigurators:
- unnötige Datenbankabfragen minimiert
- Geschäftslogik in der Service-Schicht zentralisiert
- eine klare Trennung zwischen Präsentation, Logik und Datenzugriff beibehält

---

## Request Flow Architecture
Der Konfigurator-Backend folgt einem **strukturierten Request-Processing-Fluss**.
Frontend-Anfragen werden zunächst von der Controller-Schicht empfangen, die als Einstiegspunkt für die Backend-Anwendung fungiert.
Der Controller koordiniert die Kommunikation zwischen dem Frontend und den internen Backend-Modulen.

Allgemeiner Request-Fluss:

```
  Frontend-Anfrage
       ↓
   Controller
       ↓
  Service-Schicht
       ↓
 Repository-Schicht
       ↓
    Datenbank
```

Das verarbeitete Ergebnis reist dann durch die gleichen Schichten zurück, bis es zum Frontend zurückgegeben wird.

---

## Controller-Schicht
Controller fungieren als **Einstiegspunkt für Frontend-Anfragen**.

Aufgaben:
- Frontend-Anfragen empfangen
- geeignete Service-Methoden auslösen
- strukturierte Antworten für das Frontend vorbereiten

Controller enthalten **keine Geschäftslogik**.
Ihr Zweck ist rein Orchestrierung.

---

## Service-Schicht
Die Service-Schicht enthält die **zentrale Geschäftslogik des Konfigurators**.
Services koordinieren mehrere Repositories und Komponentendefinitionen, um gültige Konfigurationsergebnisse zu produzieren.

Beispiele für Aufgaben:
- Bewertung von Kompatibilitätsregeln
- Filterung verfügbarer Komponenten
- Validierung ausgewählter Konfigurationen
- Vorbereitung von Preisberechnungen

Die Service-Schicht fungiert als die **zentrale Entscheidungsmaschine** des Konfigurators.

---

## Repository-Schicht
Repositories bieten **strukturierten Zugriff auf Datenbankdaten**.

Anstatt Datenbankabfragen bei jeder Anfrage wiederholt auszuführen, erlauben Repositories Daten zu:
- einmal abrufen
- vorübergehend im Speicher speichern
- über mehrere Service-Aufrufe hinweg wiederzuverwenden

Dieser Ansatz reduziert die Datenbankbelastung und verbessert die Laufzeitleistung.

Repositories sind verantwortlich für:
- Laden von Komponenten
- Abrufen von Kompatibilitätsregeln
- Zugriff auf Attributdefinitionen
- Bereitstellung strukturierter Datenzugriff für Services

---

## Daten-Caching-Strategie
Um unnötige Datenbankzugriffe zu minimieren, können Repositories häufig verwendete Daten während der Laufzeit zwischenspeichern.

Beispiele umfassen:
- Komponentenlisten
- Attributdefinitionen
- Kompatibilitätsregeln

Einmal geladen, können diese Datensätze von der Service-Schicht wiederverwendet werden, ohne zusätzliche Datenbankabfragen zu erfordern.

Datenbankabfragen werden daher nur ausgeführt, **wenn neue Daten abgerufen werden müssen**.

---

## Ergebnis von Phase 5
Am Ende von Phase 5 bietet das Projekt:
- einen definierten Runtime-Request-Fluss
- ein strukturiertes Backend-Interaktionsmodell
- Trennung zwischen Controllern, Services, Repositories und Datenbank
- eine Grundlage für die Implementierung der Kompatibilitäts-Engine und Preislogik

Diese Architektur bereitet das System für die nächste Entwicklungsphase vor, in der die **aktuelle Konfigurator-Logik und die Kompatibilitäts-Evaluierungs-Engine implementiert werden**.

---

