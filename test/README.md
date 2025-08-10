# Test Suite Documentation

## Overview

This test suite is designed to prevent regression bugs in the `diagram_viewer` package, particularly focusing on scroll functionality and user interactions.

## Test Categories

### 1. Widget Tests (`test/widgets/`)

#### `diagram_viewer_scroll_test.dart`
**Purpose**: Tests scroll functionality to prevent regression bugs.

**Key Test Areas**:
- **Mouse Scroll Tests**: Verifies mouse wheel/trackpad scroll events are captured
- **Keyboard Navigation Tests**: Tests arrow keys, page up/down, home/end navigation
- **Drag on Empty Area Tests**: Ensures drag on empty space scrolls the diagram
- **Object Movement Tests**: Verifies objects can be moved and IDs are preserved
- **Transform Command Tests**: Ensures keyboard events are handled without crashing
- **Redraw Command Tests**: Verifies redraw commands work correctly
- **Regression Prevention Tests**: Tests multiple interactions and rapid key presses

**Critical Test Cases**:
```dart
// Keyboard navigation
await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);

// Object ID preservation
final initialIds = testObjects.map((obj) => obj.id).toList();
// ... interactions ...
final finalIds = testObjects.map((obj) => obj.id).toList();
expect(finalIds, equals(initialIds));
```

### 2. Integration Tests (`test/integration/`)

#### `diagram_viewer_scroll_integration_test.dart`
**Purpose**: Tests how different scroll types work together.

**Key Test Areas**:
- **Scroll Functionality Integration**: Tests all scroll types without conflicts
- **State Consistency**: Ensures state remains consistent across scroll types
- **Event Order**: Verifies events are processed in correct order
- **Heavy Load**: Tests performance under heavy scroll load
- **Mixed Interactions**: Tests scroll and object interactions together
- **Command Flow**: Verifies appropriate commands are sent

## Regression Prevention Strategy

### 1. Critical Functionality Tests

These tests must pass to ensure core functionality works:

#### Scroll Functionality
- ✅ Mouse wheel/trackpad scroll
- ✅ Keyboard arrow key navigation
- ✅ Page up/down navigation
- ✅ Home/end navigation
- ✅ Drag on empty area scrolls diagram

#### Object Management
- ✅ Objects can be moved
- ✅ Object IDs are preserved during movement
- ✅ Objects don't move when dragging on empty area

#### Event Flow
- ✅ Events reach the controller
- ✅ Controller sends appropriate commands
- ✅ Widget remains functional after interactions

### 2. Performance Tests

#### Heavy Load Testing
```dart
// Simulate heavy scroll load
for (int i = 0; i < 20; i++) {
  await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
  await tester.pump();
  await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
  await tester.pump();
}
```

#### Rapid Interaction Testing
```dart
// Test rapid key presses
for (int i = 0; i < 10; i++) {
  await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
  await tester.pump();
}
```

### 3. Architecture Compliance Tests

#### Diagrammer-Controller Pattern
- ✅ All events reach the controller
- ✅ Controller decides how to handle events
- ✅ Controller sends commands back to DiagramViewer
- ✅ No direct event processing in DiagramViewer

#### Event Isolation
- ✅ Only one interaction type active at a time
- ✅ Modifier keys update current event state
- ✅ No interference between different event types

## Running Tests

### Individual Test Files
```bash
# Run scroll tests
flutter test test/widgets/diagram_viewer_scroll_test.dart

# Run integration tests
flutter test test/integration/diagram_viewer_scroll_integration_test.dart
```

### All Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

### Specific Test Groups
```bash
# Run only keyboard navigation tests
flutter test --plain-name "Keyboard Navigation Tests"

# Run only regression prevention tests
flutter test --plain-name "Regression Prevention"
```

## Test Maintenance

### When Adding New Features

1. **Add Unit Tests**: Create specific tests for new functionality
2. **Add Integration Tests**: Test how new features work with existing ones
3. **Update Regression Tests**: Ensure new features don't break existing ones
4. **Update Documentation**: Document new test cases

### When Fixing Bugs

1. **Add Regression Test**: Create a test that would have caught the bug
2. **Verify Fix**: Ensure the new test passes with the fix
3. **Run All Tests**: Ensure no other functionality is broken
4. **Update Documentation**: Document the bug and fix

### Test Data

#### Mock Objects
```dart
TestDiagramObject(
  bounds: const Rect.fromLTWH(100, 100, 50, 50),
  color: Colors.red,
  id: 'test-1',
)
```

#### Mock Controller
```dart
MockDiagramController mockController = MockDiagramController();
mockController.addObject(testObject);
```

## Common Issues and Solutions

### 1. Keyboard Events Not Received
**Problem**: `hasReceivedEvents` returns false
**Solution**: Ensure widget has focus
```dart
await tester.tap(find.byType(DiagramViewer));
await tester.pump();
```

### 2. Test Timeouts
**Problem**: Tests take too long or hang
**Solution**: Add proper `pump()` calls and timeouts
```dart
await tester.pump();
await tester.pump(const Duration(milliseconds: 100));
```

### 3. Widget Not Found
**Problem**: `find.byType(DiagramViewer)` returns nothing
**Solution**: Ensure widget is properly wrapped
```dart
MaterialApp(
  home: Scaffold(
    body: DiagramViewer(controller: mockController),
  ),
)
```

## Performance Guidelines

### Test Execution Time
- Individual tests should complete in < 1 second
- Integration tests should complete in < 5 seconds
- Full test suite should complete in < 30 seconds

### Memory Usage
- Tests should not cause memory leaks
- Mock objects should be properly disposed
- Stream subscriptions should be closed

### Test Reliability
- Tests should be deterministic
- Avoid timing-dependent assertions
- Use proper setup and teardown

## Future Enhancements

### Planned Test Additions
1. **Visual Regression Tests**: Screenshot comparison tests
2. **Performance Benchmarks**: FPS and memory usage tests
3. **Accessibility Tests**: Screen reader and keyboard navigation tests
4. **Cross-Platform Tests**: Platform-specific behavior tests

### Test Infrastructure Improvements
1. **Test Data Factories**: Reusable test object creation
2. **Custom Matchers**: Domain-specific assertions
3. **Test Utilities**: Common test operations
4. **CI/CD Integration**: Automated test execution

## Contributing to Tests

### Test Writing Guidelines
1. **Arrange-Act-Assert**: Follow the AAA pattern
2. **Descriptive Names**: Use clear, descriptive test names
3. **Single Responsibility**: Each test should test one thing
4. **Independent Tests**: Tests should not depend on each other
5. **Fast Execution**: Tests should run quickly

### Test Documentation
1. **Purpose**: Document what each test verifies
2. **Setup**: Explain test data and conditions
3. **Assertions**: Document expected outcomes
4. **Edge Cases**: Test boundary conditions

### Code Review Checklist
- [ ] Tests cover the main functionality
- [ ] Tests cover edge cases
- [ ] Tests are independent and reliable
- [ ] Tests follow naming conventions
- [ ] Tests include proper assertions
- [ ] Tests handle cleanup properly 