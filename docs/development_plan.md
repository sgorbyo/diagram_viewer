## Development Plan – Selection Area, Selected Visuals, and Highlight Overlay

Last update: 2025-08-20 9:30 AM

### Current Status
- All tests are green and static analysis reports no issues.
- Documentation has been aligned with current input behavior (classic wheel forwarded to controller; Magic Mouse/trackpad 1:1 mapping).
- Selection features are documented but not yet implemented in code.

### Gaps (Docs → Code)
- SelectionArea events (start | update | end) that carry the logical rectangle and covered object IDs: not implemented.
- Commands HighlightSelection({objectIds}) and ClearSelectionHighlight(): not implemented.
- Selected visuals: no distinct rendering for selected objects; no `isSelected` flag on objects.
- Selection rectangle overlay during drag: not implemented.

### Objectives (Scope)
Implement the documented selection workflow end‑to‑end without changing business‑logic ownership:
- Viewer emits SelectionArea events for rectangular selection.
- Controller remains the source of truth for the actual selection set.
- Viewer can render selection feedback (runtime overlay) and visual highlighting for selected objects.
- Viewer can render a transient selection highlight overlay upon explicit commands from the controller.

### Work Plan
1) SelectionArea events
   - Add union cases to `DiagramEventUnion`:
     - `selectionAreaStart(rect, coveredIds, transformSnapshot, timestamp)`
     - `selectionAreaUpdate(rect, coveredIds, transformSnapshot, timestamp)`
     - `selectionAreaEnd(rect, coveredIds, transformSnapshot, timestamp)`
   - Extend `DiagramEventTranslator` to emit these when a pointer drag starts on empty space and continues.
   - Coverage computation:
     - Introduce `Path get logicalHitPath` in `DiagramObjectEntity` with a default rectangular path from `logicalBounds`.
     - Add a utility that checks if an object is covered by the selection rectangle using the object’s `logicalHitPath` (default behavior uses bounding‑rect path). Partial coverage counts.
   - Tests:
     - Starting drag on empty space → emits `start` followed by `update` and `end` with correct rectangles.
     - Covered IDs are correct for simple shapes (rectangles/circles).

2) Selection rectangle overlay (runtime feedback)
   - In `DiagramViewerContent`, show a semi‑transparent logical‑space rectangle while receiving SelectionArea events; hide it on `end`.
   - Reuse the existing overlay layer if present (used by DnD); otherwise add a lightweight overlay above the canvas.
   - Tests:
     - Drag displays overlay; coordinates correctly follow logical rectangle (logical↔physical mapping verified); overlay is removed at `end`.

3) Selected visuals (presentation‑only)
   - In `DiagramObjectEntity`, add `bool get isSelected => false` (presentation hint provided by the controller’s model).
   - In `DiagramPainter`, draw a selection highlight for objects with `isSelected == true` after `_drawObjects`.
   - Extend `DiagramConfiguration` with theme knobs (e.g., `selectedStrokeColor`, `selectedStrokeWidth`, optional `selectedFillColor`).
   - Tests:
     - Objects with `isSelected=true` get highlighted with the configured style; when `false`, no highlight.

4) HighlightSelection / ClearSelectionHighlight (command‑driven overlay)
   - Add union cases to `DiagramCommand`:
     - `highlightSelection({objectIds})` to request a transient overlay showing the minimum axis‑aligned logical bounding rectangle covering the provided objects’ `logicalBounds`.
     - `clearSelectionHighlight()` to remove that overlay.
   - In `DiagramViewerContent`, handle these commands by computing the AABB and toggling an overlay rectangle independent of the runtime selection‑area overlay.
   - Tests:
     - Sending `highlightSelection` shows the overlay with the correct bounds; `clearSelectionHighlight` removes it.

5) Docs and examples
   - Update docs with final union/command names and configuration fields.
   - README/example: add a short snippet showing how a controller interprets SelectionArea events to decide the selection set and optionally issues `HighlightSelection`.

### Affected Files (primary)
- Events
  - `lib/events/diagram_event.dart`, `lib/events/diagram_event.freezed.dart`
  - `lib/events/diagram_event_translator.dart`
  - `lib/events/diagram_command.dart`, `lib/events/diagram_command.freezed.dart`
- Core/Interfaces
  - `lib/interfaces/diagram_object_entity.dart`
  - `lib/interfaces/diagram_configuration.dart`
- Viewer & Rendering
  - `lib/widgets/diagram_viewer_content.dart`
  - `lib/widgets/diagram_painter.dart`

### Testing Plan
- New widget tests:
  - Selection area emission and rectangles (`selection_area_events_test.dart`).
  - Runtime selection overlay visibility and geometry (`selection_overlay_runtime_test.dart`).
  - Selected visuals rendering (`painter_selected_visuals_test.dart`).
  - Command‑driven highlight overlay (`selection_highlight_command_test.dart`).
- Integration sanity checks for interaction with existing pan/zoom and DnD overlays.

### Risks & Mitigations
- Overlay z‑ordering conflicts with DnD ghosts
  - Keep selection overlays below transient DnD ghosts but above content; assert order in tests.
- Performance when computing covered IDs on large diagrams
  - Use spatial index when enabled; fallback to linear scan for small datasets; benchmark thresholds.

### Milestones
1. Events + coverage utilities + basic tests (SelectionArea minimal path).
2. Runtime selection overlay + tests.
3. Selected visuals + configurable theme + tests.
4. HighlightSelection/ClearSelectionHighlight commands + tests.
5. Docs/README updates; final sweep on lints/tests.

### Non‑Goals
- Business logic for selection rules (toggle/additive/subtractive) remains in the controller.
- Persisting selection state in the viewer.

### Open Questions
- Do we need a configurable minimum drag distance to enter SelectionArea mode (to avoid tiny drags becoming selections)?
- Should selection overlay style be themeable (color/opacity/dash) via `DiagramConfiguration`?

## Ongoing ToDo List:
- 
