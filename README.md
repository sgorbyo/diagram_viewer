# Diagram Viewer

A Flutter package that provides an interactive diagram viewer with pan, zoom, and rotation capabilities. Perfect for displaying and manipulating diagrams, flowcharts, and other visual content.

## Features

- 🔄 Smooth pan, zoom, and rotation gestures
- 🎯 Customizable diagram content rendering
- 🖼️ Background and content separation
- ⚡ High performance with custom painters
- 🎨 Themeable background colors
- 🔲 Boundaries control with inertial scrolling
- 📱 Cross-platform support (iOS, Android, Web, Desktop)

## Getting started

Add `diagram_viewer` to your `pubspec.yaml`:

```yaml
dependencies:
  diagram_viewer: ^0.0.1
```

## Usage

```dart
import 'package:diagram_viewer/diagram_viewer.dart';

class MyDiagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollingView(
      shouldTranslate: true,
      shouldScale: true,
      shouldRotate: true,
      clipChild: true,
    );
  }
}
```

## Additional information

### Customization

You can customize the viewer by:
- Enabling/disabling specific gestures (translation, scaling, rotation)
- Setting custom background colors
- Implementing custom diagram objects

### Contributing

Contributions are welcome! If you find a bug or want a feature, please create an issue.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
# diagram_viewer
