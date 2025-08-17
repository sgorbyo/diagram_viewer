# Diagram Viewer

A Flutter package for building interactive diagram viewers with support for smooth scrolling, zooming, and content management.

## Features

- 🎯 Interactive diagram viewing with smooth animations
- 🔄 Pan and zoom gestures with intuitive controls
- 🧠 Controller‑driven architecture (Diagrammer ↔ Controller)
- 🧩 Generic, self‑rendering diagram objects (no predefined types)
- 🧲 Optional snap‑to‑grid with event hints and DnD ghost alignment
- 🚀 Inertial scrolling with elastic bounce‑back and input gating
- 🧰 Rendering facilities for objects (rotation helpers, text‑on‑path, clipping) [in progress]
- 🧷 In‑app Drag & Drop target with accurate logical/screen mapping
- 📐 Unified transform management with `Transform2D`
- 📱 Cross‑platform support (iOS, Android, Web, Desktop)
- 🧭 Autoscroll drag‑sync: continuous `dragContinue` during `AutoScrollStep` via post‑frame synthesized pointer updates
- 🎯 Snap grid overlay: balanced styling and zoom‑aware minimum pixel spacing

## Installation

Since this is an internal iLogoTec package, add it to your `pubspec.yaml` using the GitHub repository:

```yaml
dependencies:
  diagram_viewer:
    git:
      url: https://github.com/sgorbyo/diagram_viewer.git
      ref: main  # or specify a tag/commit hash for a specific version
```

## Quick Start

1. Implementa un Controller (`IDiagramController`) che gestisce eventi e comandi:

```dart
class MyDiagramController implements IDiagramController {
  final _commands = StreamController<DiagramCommand>.broadcast();
  final _events = StreamController<DiagramEventUnion>();
  final List<DiagramObjectEntity> _objects = [];

  MyDiagramController() {
    _events.stream.listen(_onEvent);
  }

  @override
  Stream<DiagramCommand> get commandStream => _commands.stream;

  @override
  Sink<DiagramEventUnion> get eventsSink => _events.sink;

  @override
  Rect get logicalExtent => _calculateExtent();

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  List<DiagramObjectEntity> get objects => _objects;

  void _onEvent(DiagramEventUnion event) {
    _commands.add(DiagramCommand.redraw(
      renderables: _objects,
      logicalExtent: logicalExtent,
    ));
  }

  Rect _calculateExtent() {
    return _objects.isEmpty
        ? const Rect.fromLTWH(-256, -256, 512, 512)
        : _objects
            .map((o) => o.logicalBounds)
            .reduce((a, b) => a.expandToInclude(b));
  }

  @override
  void dispose() {
    _commands.close();
    _events.close();
  }
}
```

2. Implementa oggetti self‑rendering con `DiagramObjectEntity`:

```dart
class MyRectObject extends DiagramObjectEntity {
  final String _id;
  final Rect _bounds;
  final Paint _paint = Paint()..color = Colors.blue;

  MyRectObject(this._id, this._bounds);

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => _bounds;

  @override
  int get zOrder => 0;

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(_bounds, _paint);
  }

  @override
  bool get isVisible => true;
  @override
  bool get isInteractive => true;
}
```

3. Usa `DiagramViewer` passando il controller e la configurazione:

```dart
final controller = MyDiagramController();

MaterialApp(
  home: Scaffold(
    body: DiagramViewer(
      controller: controller,
      configuration: const DiagramConfiguration(
        backgroundColor: Colors.white,
        edgeThreshold: 50.0,
        snapGridEnabled: false,
      ),
      debug: false,
    ),
  ),
);
```

## Architecture

Diagrammer‑Controller Pattern:

- **Diagrammer (DiagramViewer)**: motore di rendering e gestione input; mantiene la `Transform2D`, arricchisce eventi (hit‑test, posizioni logiche), esegue comandi (pan/zoom default, bounce, auto‑scroll, DnD overlay).
- **Controller (client)**: possiede la business logic; interpreta `DiagramEventUnion` e invia `DiagramCommand`; fornisce `objects` e `logicalExtent`.

### DiagramViewer Features

- Pan/zoom con focal point stabile; limiti dinamici + elastic window
- Inertial scrolling con stop su input e bounce‑back configurabile
- Snap‑to‑grid opzionale (hint negli eventi; ghost overlay allineato)
- In‑app DnD target cross‑platform con mapping logico/schermo accurato
- Rendering tramite `CustomPaint` in spazio logico
 - Autoscroll drag‑sync: durante `AutoScrollStep` il viewer sintetizza update del puntatore post‑frame mantenendo aggiornata la posizione logica e l’hit‑testing; il controller continua a ricevere `dragContinue` anche senza ulteriori movimenti fisici del puntatore

### Content Management

Il Controller espone:

- `objects: List<DiagramObjectEntity>`: oggetti self‑rendering, ordinati per `zOrder`
- `logicalExtent: Rect`: bounds logici per limiti e zoom minimo
- `commandStream`/`eventsSink`: canale di comunicazione con il Diagrammer

### Custom Objects

Implementa `DiagramObjectEntity` per oggetti custom:

- `logicalBounds`: bounds logici dell’oggetto
- `paint(Canvas)`: disegno in spazio logico (il canvas è già trasformato)
- `contains(Offset)`: hit‑testing logico
- `id`, `zOrder`, `isVisible`, `isInteractive`

## Example

Check the `/example` folder for a complete implementation showing:

- Custom repository implementation
- Custom diagram objects
- Interactive diagram viewer setup
- Gesture handling

## Development

### Running tests

- flutter test -r expanded
- cd example && flutter test -r expanded

Se modifichi classi Freezed/generatori, rigenera con:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

### TDD policy and pre-push hook

- This repo enforces a TDD workflow: when changing code under `lib/` or `example/lib/` you must also add/update tests under `test/` or `example/test/`.
- A GitHub Actions workflow enforces this on PRs and runs tests for root and example apps.
- To enable local pre-push checks:

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-push
```

From now on, pushing will run tests (root + example) and block if they fail.

## Notice

This package is for internal use by iLogoTec only. All rights reserved.
