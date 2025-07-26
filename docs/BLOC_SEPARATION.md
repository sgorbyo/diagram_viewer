# Separazione dei BLoC - Diagram Viewer

## Panoramica

La **Fase 3** della roadmap ha implementato la separazione delle responsabilità tra due BLoC distinti:

- **`ScrollingBloc`**: Gestisce scrolling, zoom, animazioni e bounds
- **`DiagramObjectBloc`**: Gestisce oggetti del diagramma, selezione e contenuto

## Architettura Aggiornata: Diagrammer-Controller

Il package implementa ora l'**architettura Diagrammer-Controller** dove:

- **Diagrammer**: Il motore di rendering che gestisce eventi UI, hit-testing e rendering
- **Controller**: Il componente di business logic che interpreta eventi e invia comandi al Diagrammer

### Posizionamento dei BLoC nell'Architettura

```
┌─────────────────────────────────────────────────────────────┐
│                    Controller Layer                         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │ DiagramObjectBloc│    │   ScrollingBloc │                │
│  │                 │    │                 │                │
│  │ - Gestione      │    │ - Trasformazioni│                │
│  │   oggetti       │    │ - Animazioni    │                │
│  │ - Selezione     │    │ - Bounds        │                │
│  │ - Contenuto     │    │ - Zoom/Pan      │                │
│  └─────────────────┘    └─────────────────┘                │
│           │                       │                        │
│           └───────────────────────┼────────────────────────┘
│                                   │
│  ┌─────────────────────────────────┼────────────────────────┐
│  │         Event Interpreter       │                        │
│  │  - PhysicalEvent → DiagramCommand│                        │
│  │  - Decisioni business logic     │                        │
│  └─────────────────────────────────┼────────────────────────┘
│                                   │
└───────────────────────────────────┼────────────────────────┘
                                    │
┌───────────────────────────────────┼────────────────────────┐
│                    Diagrammer Layer                         │
├───────────────────────────────────┼────────────────────────┤
│  ┌─────────────────────────────────────────────────────────┐│
│  │              DiagrammerWidget                          ││
│  │  - Event capture & enrichment                          ││
│  │  - Hit-testing engine                                  ││
│  │  - Transform management                                ││
│  │  - Rendering pipeline                                  ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

## Architettura Prima della Separazione

### Problemi Identificati
- **`ScrollingBloc`** con 884 righe e troppe responsabilità
- Gestione del contenuto mescolata con la logica di scrolling
- Difficoltà di testing e manutenzione
- Violazione del principio di responsabilità singola

### Responsabilità Mescolate
```dart
class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  // ❌ Gestione scrolling/zoom
  // ❌ Gestione contenuto oggetti
  // ❌ Calcolo bounds del diagramma
  // ❌ Animazioni
  // ❌ Eventi di selezione
}
```

## Architettura Dopo la Separazione

### ScrollingBloc (Semplificato)
```dart
class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  final DiagramObjectBloc? objectBloc; // ✅ Comunicazione tra BLoC
  
  // ✅ Responsabilità: scrolling, zoom, animazioni, bounds
  // ✅ Ottiene diagramRect dal DiagramObjectBloc quando necessario
}
```

### DiagramObjectBloc (Nuovo)
```dart
class DiagramObjectBloc extends Bloc<DiagramObjectEvent, DiagramObjectState> {
  final DiagramContentRepository contentRepository;
  
  // ✅ Responsabilità: gestione oggetti, selezione, contenuto
  // ✅ Calcolo bounds del diagramma
  // ✅ Eventi di selezione/deselezione
}
```

## Integrazione con l'Architettura Diagrammer-Controller

### Ruolo dei BLoC nel Controller

I BLoC esistenti diventano parte del **Controller Layer** e si integrano con il nuovo sistema di eventi:

```dart
class Controller {
  final DiagramObjectBloc objectBloc;
  final ScrollingBloc scrollingBloc;
  final EventInterpreter eventInterpreter;
  
  void handlePhysicalEvent(PhysicalEvent event) {
    // 1. Interpreta l'evento fisico
    final interpretation = eventInterpreter.interpret(event);
    
    // 2. Decidi se aggiornare il modello o applicare comportamento di default
    if (interpretation.requiresModelUpdate) {
      // Aggiorna il modello attraverso i BLoC
      objectBloc.add(interpretation.toDiagramObjectEvent());
      scrollingBloc.add(interpretation.toScrollingEvent());
      
      // Invia comando di redraw al Diagrammer
      _sendCommand(DiagramCommand.redraw(
        renderables: _getCurrentRenderables(),
        logicalExtent: _getCurrentExtent(),
      ));
    } else {
      // Applica comportamento di default
      _sendCommand(DiagramCommand.applyDefaultPanZoom(origin: event));
    }
  }
}
```

### Event Interpreter

Il **Event Interpreter** è il nuovo componente che:
- Riceve `PhysicalEvent` dal Diagrammer
- Interpreta gli eventi basandosi sui risultati di hit-testing
- Decide se aggiornare il modello o applicare comportamenti di default
- Genera eventi appropriati per i BLoC

```dart
class EventInterpreter {
  DiagramEventInterpretation interpret(PhysicalEvent event) {
    return event.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) {
        if (hitList.isNotEmpty) {
          // Evento su un oggetto - aggiorna il modello
          return DiagramEventInterpretation.modelUpdate(
            diagramObjectEvent: DiagramObjectEvent.objectMoved(
              object: hitList.first,
              newPosition: logicalPosition,
            ),
            scrollingEvent: null,
          );
        } else {
          // Evento su area vuota - comportamento di default
          return DiagramEventInterpretation.defaultBehavior();
        }
      },
      gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) {
        // Gesture events sempre comportamento di default
        return DiagramEventInterpretation.defaultBehavior();
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                 borderProximity, rawEvent, pressedKeys) {
        // Keyboard events - logica specifica
        return _interpretKeyboardEvent(pressedKeys, hitList);
      },
    );
  }
}
```

## Vantaggi della Separazione

### 1. **Responsabilità Chiare**
- **ScrollingBloc**: Solo trasformazioni e animazioni
- **DiagramObjectBloc**: Solo gestione oggetti e selezione
- **Event Interpreter**: Solo interpretazione eventi
- **Diagrammer**: Solo rendering e hit-testing

### 2. **Manutenibilità Migliorata**
- File più piccoli e focalizzati
- Testing più semplice per ogni componente
- Debugging più facile

### 3. **Estensibilità**
- Facile aggiungere nuove funzionalità per oggetti
- Possibilità di aggiungere altri BLoC specializzati
- Comunicazione tra componenti ben definita

### 4. **Performance**
- Riduzione di rebuild non necessari
- Stati più granulari
- Cache più efficiente

### 5. **Separazione Diagrammer-Controller**
- Diagrammer indipendente dalla business logic
- Controller riutilizzabile per diversi tipi di diagrammi
- Testing isolato di ogni layer

## Implementazione

### DiagramObjectBloc

#### Eventi
```dart
@freezed
class DiagramObjectEvent with _$DiagramObjectEvent {
  const factory DiagramObjectEvent.contentChanged({
    required List<DiagramObjectEntity> list,
  }) = _ContentChanged;
  
  const factory DiagramObjectEvent.objectSelected({
    required DiagramObjectEntity object,
  }) = _ObjectSelected;
  
  const factory DiagramObjectEvent.objectDeselected({
    required DiagramObjectEntity object,
  }) = _ObjectDeselected;
  
  const factory DiagramObjectEvent.clearSelection() = _ClearSelection;
  
  // Nuovi eventi per l'architettura Diagrammer-Controller
  const factory DiagramObjectEvent.objectMoved({
    required Renderable object,
    required Offset newPosition,
  }) = _ObjectMoved;
  
  const factory DiagramObjectEvent.renderablesUpdated({
    required List<Renderable> renderables,
  }) = _RenderablesUpdated;
}
```

#### Stati
```dart
@freezed
class DiagramObjectState with _$DiagramObjectState {
  const factory DiagramObjectState.initial() = _Initial;
  
  const factory DiagramObjectState.loaded({
    required List<DiagramObjectEntity> content,
    required List<Renderable> renderables,
    required Rect diagramRect,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _Loaded;
}
```

### ScrollingBloc (Semplificato)

#### Comunicazione con DiagramObjectBloc
```dart
class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  final DiagramObjectBloc? objectBloc;

  // Ottiene diagramRect quando necessario
  Rect? _getDiagramRect() {
    if (objectBloc != null) {
      final objectState = objectBloc!.state;
      return objectState.maybeMap(
        loaded: (loaded) => loaded.diagramRect,
        orElse: () => null,
      );
    }
    return null;
  }
  
  // Nuovi metodi per l'architettura Diagrammer-Controller
  Transform2D _getCurrentTransform() {
    return state.maybeMap(
      idle: (idle) => idle.transform,
      scrolling: (scrolling) => scrolling.transform,
      orElse: () => const Transform2D(scale: 1.0, translation: Offset.zero),
    );
  }
}
```

## Utilizzo

### Setup dei BLoC con Diagrammer-Controller
```dart
class DiagramViewerWithController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // DiagramObjectBloc gestisce gli oggetti del diagramma
        BlocProvider<DiagramObjectBloc>(
          create: (context) => DiagramObjectBloc(
            contentRepository: contentRepository,
          ),
        ),
        // ScrollingBloc gestisce scrolling e zoom
        BlocProvider<ScrollingBloc>(
          create: (context) => ScrollingBloc(
            objectBloc: context.read<DiagramObjectBloc>(),
          ),
        ),
      ],
      child: DiagrammerController(
        diagrammerWidget: DiagrammerWidget(
          commandStream: _commandStream,
          eventsSink: _eventsSink,
          initialRenderables: _initialRenderables,
          initialLogicalExtent: _initialExtent,
          configuration: _configuration,
        ),
        objectBloc: context.read<DiagramObjectBloc>(),
        scrollingBloc: context.read<ScrollingBloc>(),
      ),
    );
  }
}

class DiagrammerController extends StatefulWidget {
  final DiagrammerWidget diagrammerWidget;
  final DiagramObjectBloc objectBloc;
  final ScrollingBloc scrollingBloc;
  
  const DiagrammerController({
    required this.diagrammerWidget,
    required this.objectBloc,
    required this.scrollingBloc,
    super.key,
  });
  
  @override
  State<DiagrammerController> createState() => _DiagrammerControllerState();
}

class _DiagrammerControllerState extends State<DiagrammerController> {
  late final EventInterpreter _eventInterpreter;
  late final StreamController<DiagramCommand> _commandStream;
  late final StreamController<PhysicalEvent> _eventsSink;
  
  @override
  void initState() {
    super.initState();
    _eventInterpreter = EventInterpreter();
    _commandStream = StreamController<DiagramCommand>();
    _eventsSink = StreamController<PhysicalEvent>();
    
    // Ascolta eventi dal Diagrammer
    _eventsSink.stream.listen(_handlePhysicalEvent);
  }
  
  void _handlePhysicalEvent(PhysicalEvent event) {
    final interpretation = _eventInterpreter.interpret(event);
    
    if (interpretation.requiresModelUpdate) {
      // Aggiorna il modello
      if (interpretation.diagramObjectEvent != null) {
        widget.objectBloc.add(interpretation.diagramObjectEvent!);
      }
      if (interpretation.scrollingEvent != null) {
        widget.scrollingBloc.add(interpretation.scrollingEvent!);
      }
      
      // Invia comando di redraw
      _sendRedrawCommand();
    } else {
      // Comportamento di default
      _commandStream.add(DiagramCommand.applyDefaultPanZoom(origin: event));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.diagrammerWidget;
  }
}
```

### Widget che Utilizza Entrambi i BLoC
```dart
class DiagramViewerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagramObjectBloc, DiagramObjectState>(
      builder: (context, objectState) {
        return BlocBuilder<ScrollingBloc, ScrollingState>(
          builder: (context, scrollingState) {
            return objectState.maybeMap(
              loaded: (loaded) {
                return scrollingState.maybeMap(
                  idle: (idle) => _buildDiagramViewer(context, loaded, idle),
                  // ... altri stati
                );
              },
              // ... altri stati
            );
          },
        );
      },
    );
  }
}
```

## Prossimi Passi

### Fase 2: Sistema di Eventi Collaborativo ✅
- ✅ Implementare `PhysicalEvent` e sottoclassi
- ✅ Aggiungere `EventInterpreter` al Controller
- ✅ Sistema di hit testing nel Diagrammer

### Fase 3: Integrazione Completa
- [ ] Migrazione completa a Renderable interface
- [ ] Implementazione Transform2D
- [ ] Testing end-to-end del flusso Diagrammer-Controller

### Fase 4: Ottimizzazioni di Performance
- [ ] Culling intelligente basato su `enclosingRect()`
- [ ] Cache per oggetti complessi
- [ ] Ottimizzazione `shouldRepaint`

### Fase 5: Gestione Connessioni Avanzata
- [ ] Sistema di connessioni intelligenti
- [ ] Calcolo automatico di punti di intersezione
- [ ] Operazioni di differenza per path

## Conclusioni

La separazione dei BLoC ha portato a:

1. **Codice più pulito** e manutenibile
2. **Responsabilità ben definite** per ogni BLoC
3. **Architettura scalabile** per future estensioni
4. **Testing più semplice** e granulare
5. **Performance migliorate** con stati più specifici
6. **Integrazione perfetta** con l'architettura Diagrammer-Controller

Questa separazione prepara il terreno per le fasi successive della roadmap, mantenendo la coerenza architetturale e la qualità del codice, e ora si integra perfettamente con la nuova architettura Diagrammer-Controller. 