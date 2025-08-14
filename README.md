# Diagram Viewer

A Flutter package for building interactive diagram viewers with support for smooth scrolling, zooming, and content management.

## Features

- 🎯 Interactive diagram viewing with smooth animations
- 🔄 Pan and zoom gestures with intuitive controls
- � Flexible content management through repositories
- � Customizable diagram objects
- 🏗️ Clean architecture with separation of concerns
- ⚡ Efficient rendering with custom paint operations
- 🔲 Smart boundary handling with inertial scrolling
- 📱 Cross-platform support (iOS, Android, Web, Desktop)

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

1. Create a repository that implements `DiagramContentRepository`:

```dart
class MyDiagramRepository implements DiagramContentRepository {
  final _controller = StreamController<List<DiagramObjectEntity>>();

  @override
  Stream<List<DiagramObjectEntity>> get stream => _controller.stream;

  @override
  void dispose() {
    _controller.close();
  }

  // Implement other required methods...
}
```

2. Create diagram objects by implementing `DiagramObjectEntity`:

```dart
class MyDiagramObject extends DiagramObjectEntity {
  final Rect bounds;
  final Color color;

  MyDiagramObject({required this.bounds, required this.color});

  @override
  Rect enclosingRect() => bounds;

  @override
  void printOnCanvas(Canvas canvas) {
    final paint = Paint()..color = color;
    canvas.drawRect(bounds, paint);
  }
}
```

3. Use `DiagramViewer` in your UI:

```dart
DiagramViewer(
  diagramContentRepository: MyDiagramRepository(),
  shouldScale: true,
  shouldTranslate: true,
  shouldRotate: false,
  clipChild: true,
  backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
  outsideColor: const Color.fromRGBO(128, 128, 128, 1.0),
)
```

## Architecture

The package follows a clean architecture pattern with three main components:

1. **DiagramViewer**: The main widget that handles user interaction and displays content.
2. **DiagramContentRepository**: An abstract interface for managing diagram content.
3. **DiagramObjectEntity**: Base class for drawable objects in the diagram.

### DiagramViewer Features

The `DiagramViewer` widget supports:

- Pan and zoom gestures (can be enabled/disabled)
- Background customization
- Client-controlled drag operations
- Boundary handling and inertial scrolling
- Custom clipper support

### Content Management

The `DiagramContentRepository` is responsible for:

- Providing a stream of diagram objects
- Managing content lifecycle
- Handling content loading and updates

### Custom Objects

Implement `DiagramObjectEntity` to create custom drawable objects:

- Override `enclosingRect()` to define object boundaries
- Override `printOnCanvas()` for custom rendering
- Use the Equatable mixin for proper object comparison

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
