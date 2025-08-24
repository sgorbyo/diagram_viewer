# Comando `handleAsUsual` - Guida Completa

## **🎯 SCOPO DEL COMANDO**

Il comando `DiagramCommand.handleAsUsual` è stato introdotto per implementare il principio architetturale **"controller-first"**. Permette al controller di delegare eventi di browsing (pan/zoom/inertia) al DiagramViewer senza dover implementare la logica specifica.

## **🔧 IMPLEMENTAZIONE TECNICA**

### **Definizione del Comando**
```dart
/// Tell the DiagramViewer to handle this event using its default
/// pan/zoom/inertia logic. This is used when the controller decides
/// that an event should be processed by the viewer's built-in browsing
/// mechanisms rather than being transformed into a specific command.
///
/// [originalEvent] - The original DiagramEventUnion that should be
/// processed by the viewer's default handling
const factory DiagramCommand.handleAsUsual({
  required DiagramEventUnion originalEvent,
}) = _HandleAsUsualCommand;
```

### **Struttura del Comando**
- **Tipo**: `_HandleAsUsualCommand`
- **Parametro**: `originalEvent` di tipo `DiagramEventUnion`
- **Scopo**: Delega l'evento al viewer per processing interno

## **📋 UTILIZZO NEL CONTROLLER**

### **Esempio di Implementazione**
```dart
void _handleDiagramEvent(DiagramEventUnion event) {
  event.when(
    dragBegin: (dragEvent) {
      // Check if this should be a selection operation
      final bool shouldSelect = _selectionModeEnabled ||
          (dragEvent.metadata['pressedKeys'] as List<dynamic>?)
                  ?.contains('Shift') == true;

      if (shouldSelect && dragEvent.hitList.isEmpty) {
        // MODALITÀ SELEZIONE
        _isSelecting = true;
        _selectionStartPosition = dragEvent.logicalPosition;
        
        _commandController.add(DiagramCommand.showSelectionOverlay(
          startPosition: dragEvent.logicalPosition,
        ));
      } else if (dragEvent.hitList.isNotEmpty) {
        // MODALITÀ DRAG OGGETTO
        _startObjectDrag(dragEvent.hitList.first);
      } else {
        // MODALITÀ BROWSING - Delega al viewer
        _commandController.add(DiagramCommand.handleAsUsual(
          originalEvent: DiagramEventUnion.dragBegin(dragEvent),
        ));
      }
    },
    // ... altri eventi
  );
}
```

### **Logica di Decisione**
1. **Selezione Attiva**: `shouldSelect && hitList.isEmpty`
   - Invia comandi di selezione
   - Mostra overlay di selezione
2. **Drag di Oggetto**: `hitList.isNotEmpty`
   - Gestisce il drag dell'oggetto
   - Aggiorna il modello
3. **Browsing**: `!shouldSelect && hitList.isEmpty`
   - Invia `handleAsUsual`
   - Delega al viewer per pan/zoom

## **🎮 PROCESSING NEL VIEWER**

### **Handler del Comando**
```dart
handleAsUsual: (originalEvent) {
  // Process the event using the viewer's default pan/zoom/inertia logic
  _handleEventAsUsual(originalEvent);
},
```

### **Metodo `_handleEventAsUsual`**
```dart
void _handleEventAsUsual(DiagramEventUnion event) {
  event.when(
    dragBegin: (dragEvent) {
      _handleDragBeginAsUsual(dragEvent);
    },
    dragContinue: (dragEvent) {
      _handleDragContinueAsUsual(dragEvent);
    },
    dragEnd: (dragEvent) {
      _handleDragEndAsUsual(dragEvent);
    },
    // ... altri tipi di eventi
  );
}
```

## **🔧 METODI IMPLEMENTATI**

### **1. `_handleDragBeginAsUsual`**
```dart
void _handleDragBeginAsUsual(DiagramDragBegin dragEvent) {
  final transformBloc = context.read<TransformBloc>();
  final eventBloc = context.read<EventManagementBloc>();
  
  // Check if we're already in an active pointer state
  if (eventBloc.state is PointerActiveState) {
    return; // Already handling a drag
  }
  
  // Start pointer event for default pan/zoom behavior
  eventBloc.add(EventManagementEvent.startPointerEvent(
    rawEvent: const PointerDownEvent(
      pointer: 0,
      position: Offset.zero,
      kind: PointerDeviceKind.touch,
    ),
    logicalPosition: dragEvent.logicalPosition,
    hitResults: dragEvent.hitList.map((obj) => HitTestResult(
      object: obj,
      distanceFromCenter: 0.0,
      hitPoint: dragEvent.logicalPosition,
    )).toList(),
    pressedKeys: dragEvent.metadata['pressedKeys'] as Set<LogicalKeyboardKey>? ?? {},
  ));
  
  // Store the start position for pan calculations
  _lastPointerLocalPosition = dragEvent.screenPosition;
  _lastPointerMoveTime = DateTime.now();
}
```

**Funzionalità**:
- Avvia gestione drag con `EventManagementBloc`
- Memorizza posizione iniziale per calcoli di pan
- Gestisce stato del pointer

### **2. `_handleDragContinueAsUsual`**
```dart
void _handleDragContinueAsUsual(DiagramDragContinue dragEvent) {
  final transformBloc = context.read<TransformBloc>();
  final eventBloc = context.read<EventManagementBloc>();
  
  // Check if we're in an active pointer state
  if (eventBloc.state is! PointerActiveState) {
    return; // Not in a drag session
  }
  
  // Calculate delta for pan
  if (_lastPointerLocalPosition != null) {
    final delta = dragEvent.screenPosition - _lastPointerLocalPosition!;
    
    // Create a new transform with the delta applied
    final currentTransform = transformBloc.state.transform;
    final newTransform = Transform2D(
      scale: currentTransform.scale,
      translation: currentTransform.translation + delta,
      rotation: currentTransform.rotation,
    );
    
    // Cap the transform to valid bounds
    final cappedTransform = Transform2DUtils.capTransform(
      transform: newTransform,
      diagramRect: transformBloc.state.diagramRect,
      size: transformBloc.state.viewportSize,
      dynamic: false, // No overscroll for programmatic pan
    );
    
    // Apply the pan
    transformBloc.add(TransformEvent.updateTransform(transform: cappedTransform));
    
    // Update stored position
    _lastPointerLocalPosition = dragEvent.screenPosition;
    
    // Update velocity sampling for inertia
    _updateVelocitySampling(delta);
  }
}
```

**Funzionalità**:
- Calcola delta di movimento
- Applica pan con capping dei limiti
- Campiona velocità per inertia
- Aggiorna posizione memorizzata

### **3. `_handleDragEndAsUsual`**
```dart
void _handleDragEndAsUsual(DiagramDragEnd dragEvent) {
  final transformBloc = context.read<TransformBloc>();
  final eventBloc = context.read<EventManagementBloc>();
  
  // Check if we're in an active pointer state
  if (eventBloc.state is! PointerActiveState) {
    return; // Not in a drag session
  }
  
  // End the pointer event
  eventBloc.add(EventManagementEvent.endPointerEvent(
    rawEvent: const PointerUpEvent(
      pointer: 0,
      position: Offset.zero,
      kind: PointerDeviceKind.touch,
    ),
    pressedKeys: {},
  ));
  
  // Calculate final velocity for inertia
  if (_recentPointerDeltas.isNotEmpty && _recentPointerDeltaMs.isNotEmpty) {
    final velocity = _calculateFinalVelocity();
    
    // Start inertia if velocity is significant
    if (velocity.distance > 50.0) { // 50 px/s threshold
      _startInertia(velocity, transformBloc);
    }
  }
  
  // Clear stored data
  _clearDragState();
}
```

**Funzionalità**:
- Termina gestione drag con `EventManagementBloc`
- Calcola velocità finale per inertia
- Avvia inertia se velocità significativa
- Pulisce stato memorizzato

## **📊 CAMPIONAMENTO VELOCITÀ**

### **Struttura Dati**
```dart
// Recent pointer movement samples for velocity estimation
final List<Offset> _recentPointerDeltas = <Offset>[]; // px
final List<int> _recentPointerDeltaMs = <int>[]; // ms per sample
Offset? _lastPointerLocalPosition;
DateTime? _lastPointerMoveTime;
```

### **Aggiornamento Velocità**
```dart
void _updateVelocitySampling(Offset delta) {
  if (_lastPointerMoveTime != null) {
    final now = DateTime.now();
    final duration = now.difference(_lastPointerMoveTime!);
    
    if (duration.inMilliseconds > 0) {
      _recentPointerDeltas.add(delta);
      _recentPointerDeltaMs.add(duration.inMilliseconds);
      
      // Keep only recent samples
      if (_recentPointerDeltas.length > 10) {
        _recentPointerDeltas.removeAt(0);
        _recentPointerDeltaMs.removeAt(0);
      }
    }
    _lastPointerMoveTime = now;
  }
}
```

### **Calcolo Velocità Finale**
```dart
Offset _calculateFinalVelocity() {
  final totalDelta = _recentPointerDeltas.reduce((a, b) => a + b);
  final totalTime = _recentPointerDeltaMs.reduce((a, b) => a + b);
  
  if (totalTime > 0) {
    return Offset(
      totalDelta.dx / (totalTime / 1000.0),
      totalDelta.dy / (totalTime / 1000.0),
    );
  }
  
  return Offset.zero;
}
```

## **🚀 AVVIO INERTIA**

### **Configurazione Inertia**
```dart
void _startInertia(Offset velocity, TransformBloc transformBloc) {
  _inertia.start(
    initialVelocity: velocity,
    interval: const Duration(milliseconds: 16),
    frictionFactor: 0.95,
    minStopVelocity: 10.0,
    maxDuration: const Duration(seconds: 2),
    onTick: (delta) {
      if (!mounted) return;
      
      final currentTransform = transformBloc.state.transform;
      final newTransform = Transform2D(
        scale: currentTransform.scale,
        translation: currentTransform.translation + delta,
        rotation: currentTransform.rotation,
      );
      
      final cappedTransform = Transform2DUtils.capTransform(
        transform: newTransform,
        diagramRect: transformBloc.state.diagramRect,
        size: transformBloc.state.viewportSize,
        dynamic: false,
      );
      
      transformBloc.add(TransformEvent.updateTransform(transform: cappedTransform));
    },
    onStop: () {
      // Inertia stopped
    },
  );
}
```

**Parametri**:
- `initialVelocity`: Velocità iniziale calcolata dal drag
- `interval`: Intervallo di aggiornamento (16ms per 60 FPS)
- `frictionFactor`: Fattore di attrito (0.95 = 5% di perdita per tick)
- `minStopVelocity`: Velocità minima per continuare (10 px/s)
- `maxDuration`: Durata massima (2 secondi)

## **🧪 TESTING**

### **Test di Mutua Esclusività**
```dart
test('should send handleAsUsual command for browsing events', () async {
  // Arrange
  controller.setSelectionMode(false);
  
  // Act - Send browsing event
  final browsingEvent = DiagramEventUnion.dragBegin(/* ... */);
  controller.eventsSink.add(browsingEvent);
  
  // Assert - Should have sent handleAsUsual command
  expect(sentCommands.any((cmd) => cmd.maybeWhen(
    handleAsUsual: (_) => true,
    orElse: () => false,
  )), isTrue);
  
  // Should NOT have sent setTransform command
  expect(sentCommands.any((cmd) => cmd.maybeWhen(
    setTransform: (_) => true,
    orElse: () => false,
  )), isFalse);
});
```

### **Test di Ciclo Completo**
```dart
test('should complete full selection cycle when selection is active', () async {
  // Arrange
  controller.setSelectionMode(true);
  
  // Act - Complete selection cycle
  controller.eventsSink.add(dragBeginEvent);
  controller.eventsSink.add(dragContinueEvent);
  controller.eventsSink.add(dragEndEvent);
  
  // Assert - Should have sent ONLY selection commands
  expect(setTransformCommands, isEmpty);
  expect(handleAsUsualCommands, isEmpty);
});
```

## **🔒 GESTIONE STATO**

### **Pulizia Stato**
```dart
void _clearDragState() {
  _lastPointerLocalPosition = null;
  _lastPointerMoveTime = null;
  _recentPointerDeltas.clear();
  _recentPointerDeltaMs.clear();
}
```

### **Controlli di Sicurezza**
```dart
// Check if we're already in an active pointer state
if (eventBloc.state is PointerActiveState) {
  return; // Already handling a drag
}

// Check if we're in an active pointer state
if (eventBloc.state is! PointerActiveState) {
  return; // Not in a drag session
}

// Check if widget is still mounted
if (!mounted) return;
```

## **📈 VANTAGGI**

1. **Separazione delle Responsabilità**: Controller decide, Viewer esegue
2. **Mutua Esclusività**: Selezione e browsing non interferiscono
3. **Riutilizzo Codice**: Usa logica esistente di pan/zoom/inertia
4. **Testabilità**: Logica isolata e testabile
5. **Manutenibilità**: Codice organizzato e comprensibile

## **🚫 LIMITAZIONI ATTUALI**

1. **Eventi Dummy**: Crea eventi `PointerDownEvent`/`PointerUpEvent` fittizi
2. **Metodi Stub**: Alcuni handler sono ancora implementati come TODO
3. **Gestione Errori**: Limitata gestione degli errori

## **🔮 FUTURE ESTENSIONI**

1. **Eventi Completi**: Supporto per tutti i tipi di eventi
2. **Gestione Errori**: Robust error handling
3. **Performance**: Ottimizzazioni per eventi ad alta frequenza
4. **Configurazione**: Parametri configurabili per inertia e pan

---

**Nota**: Questo comando è fondamentale per mantenere l'architettura controller-first. **NON bypassare mai il controller** per operazioni di pan/zoom.
