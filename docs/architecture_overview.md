# Diagram Viewer - Architettura Controller-First

## **🎯 PRINCIPIO FONDAMENTALE**

> **TUTTI gli eventi devono essere prima processati dal Controller** (scrolling compreso) e il controller può decidere di:
> 1. **Trasformare** questi eventi in comandi specifici per il DiagramViewer
> 2. **Scartare** l'evento  
> 3. **Chiedere al DiagramViewer** di processare lui l'evento tramite il comando `handleAsUsual`

## **🏗️ ARCHITETTURA GENERALE**

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   UI Events     │───▶│  DiagramViewer   │───▶│    Controller   │
│ (mouse, touch,  │    │                  │    │                 │
│  keyboard)      │    │                  │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │                        │
                                │                        │
                                ▼                        ▼
                       ┌──────────────────┐    ┌─────────────────┐
                       │  DiagramEvents   │    │ DiagramCommands │
                       │                  │    │                 │
                       └──────────────────┘    └─────────────────┘
```

## **🔄 FLUSSO DEGLI EVENTI**

### **1. CAPTURE E TRADUZIONE**
- **DiagramViewer** riceve eventi fisici (mouse, touch, keyboard)
- **DiagramEventTranslator** converte questi eventi in `DiagramEventUnion`
- Gli eventi vengono arricchiti con hit-testing, coordinate logiche, e metadati

### **2. PROCESSING DEL CONTROLLER**
- **Controller** riceve tutti gli eventi tramite `eventsSink`
- **Controller** decide cosa fare con ogni evento:
  - **Selezione**: Mostra overlay, calcola oggetti intersecati
  - **Drag di oggetti**: Modifica il modello, aggiorna posizioni
  - **Browsing (pan/zoom)**: Invia `handleAsUsual` al viewer
  - **Altro**: Trasforma in comandi specifici o scarta

### **3. ESECUZIONE DEI COMANDI**
- **Controller** invia comandi tramite `commandStream`
- **DiagramViewer** esegue i comandi ricevuti
- **Comando `handleAsUsual`**: Il viewer processa l'evento con la sua logica interna

## **📋 COMANDI DISPONIBILI**

### **Comandi di Trasformazione**
- `setTransform`: Applica una trasformazione specifica
- `applyDefaultPanZoom`: Comportamento predefinito per un evento
- `elasticBounceBack`: Ritorno elastico ai limiti validi

### **Comandi di Rendering**
- `redraw`: Aggiorna la visualizzazione con nuovi oggetti
- `showSelectionOverlay`: Mostra rettangolo di selezione
- `updateSelectionRect`: Aggiorna rettangolo di selezione
- `hideSelectionOverlay`: Nasconde rettangolo di selezione

### **Comandi di Browsing**
- `handleAsUsual`: **NUOVO** - Delega l'evento al viewer per processing interno
- `autoScrollStep`: Passo di auto-scroll
- `stopAutoScroll`: Ferma auto-scroll

### **Comandi di Drag & Drop**
- `showDragOverlay`: Mostra ghost dell'oggetto trascinato
- `updateDragOverlay`: Aggiorna posizione del ghost
- `hideDragOverlay`: Nasconde ghost

## **🔒 MUTUA ESCLUSIVITÀ**

### **Principio**
- **Selezione** e **Browsing (pan/zoom)** non possono verificarsi simultaneamente
- Il controller gestisce questa esclusività inviando comandi appropriati

### **Implementazione**
```dart
// Nel controller
if (shouldSelect && event.hitList.isEmpty) {
  // MODALITÀ SELEZIONE
  _commandController.add(DiagramCommand.showSelectionOverlay(...));
} else if (event.hitList.isNotEmpty) {
  // MODALITÀ DRAG OGGETTO
  _handleObjectDrag(event);
} else {
  // MODALITÀ BROWSING - Delega al viewer
  _commandController.add(DiagramCommand.handleAsUsual(
    originalEvent: DiagramEventUnion.dragBegin(event)
  ));
}
```

## **🎮 COMANDO `handleAsUsual`**

### **Scopo**
Permette al controller di delegare eventi di browsing (pan/zoom/inertia) al DiagramViewer senza dover implementare la logica specifica.

### **Utilizzo**
```dart
// Controller delega evento di browsing
_commandController.add(DiagramCommand.handleAsUsual(
  originalEvent: DiagramEventUnion.dragBegin(dragEvent)
));
```

### **Processing nel Viewer**
```dart
handleAsUsual: (originalEvent) {
  // Processa l'evento usando la logica interna del viewer
  _handleEventAsUsual(originalEvent);
},
```

### **Metodi Implementati**
- `_handleDragBeginAsUsual`: Avvia gestione drag con EventManagementBloc
- `_handleDragContinueAsUsual`: Applica pan con capping dei limiti
- `_handleDragEndAsUsual`: Gestisce inertia e pulisce stato

## **🚫 COSA NON FARE**

### **❌ ERRORE COMUNE**
```dart
// SBAGLIATO: Bypassare il controller
transformBloc.add(TransformEvent.pan(delta: delta));
```

### **✅ CORRETTO**
```dart
// CORRETTO: Passare dal controller
_commandController.add(DiagramCommand.handleAsUsual(
  originalEvent: DiagramEventUnion.dragContinue(dragEvent)
));
```

## **🔧 IMPLEMENTAZIONE TECNICA**

### **DiagramViewerContent**
- Implementa `_handleEventAsUsual` per processare eventi delegati
- Mantiene separazione delle responsabilità
- Usa la logica esistente di pan/zoom/inertia

### **ExampleDiagramController**
- Gestisce selezione vs browsing
- Invia `handleAsUsual` per eventi di browsing
- Mantiene mutua esclusività

### **Test Suite**
- Verifica mutua esclusività
- Testa comando `handleAsUsual`
- Garantisce stabilità dell'architettura

## **📈 VANTAGGI DELL'ARCHITETTURA**

1. **Separazione delle Responsabilità**: Controller per business logic, Viewer per rendering
2. **Mutua Esclusività**: Selezione e browsing non interferiscono
3. **Estensibilità**: Facile aggiungere nuovi tipi di eventi e comandi
4. **Testabilità**: Logica di business isolata e testabile
5. **Manutenibilità**: Codice organizzato e comprensibile

## **🔮 FUTURE ESTENSIONI**

### **Auto-Scroll Generalizzato**
- Supporto per DnD durante selezione
- Creazione connessioni con drag prolungato
- Qualsiasi operazione che richiede movimento continuo

### **Comandi Avanzati**
- `handleAsUsual` per altri tipi di eventi
- Comandi per gestione stato avanzata
- Integrazione con sistemi esterni

---

**Nota**: Questa architettura è stata progettata per evitare la confusione che si è verificata in passato. **TUTTI gli eventi passano sempre dal controller**, che decide come processarli.

