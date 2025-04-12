import 'package:diagram_viewer/diagram_object_entity.dart';

/// A repository interface that manages and provides diagram content for the [DiagramViewer].
///
/// The [DiagramContentRepository] acts as an abstraction layer between data sources
/// (such as network APIs, local databases, or in-memory storage) and the UI components
/// that display diagram objects. It follows the Repository pattern to separate the
/// data access logic from the presentation logic.
///
/// ## Architecture
///
/// This class serves as an abstract contract within the diagram viewer architecture:
///
/// - **Repository Layer**: [DiagramContentRepository] defines an interface for accessing
///   diagram content data regardless of the data source
/// - **Data Flow**: It provides a [stream] of diagram objects that UI components can
///   listen to and react when content changes
/// - **Dependency Inversion**: UI components depend on this abstraction rather than
///   concrete implementations, allowing for flexible substitution of data sources
///
/// ## Implementation
///
/// When implementing this abstract class, consider:
///
/// 1. Managing a [StreamController] to emit updates to the [stream]
/// 2. Handling content loading, filtering, and transformation logic
/// 3. Implementing caching strategies if applicable
/// 4. Properly closing resources in dispose methods
///
/// ## Example Implementation
///
/// ```dart
/// class MyDiagramRepository implements DiagramContentRepository {
///   final _contentController = StreamController<List<DiagramObjectEntity>>.broadcast();
///   List<DiagramObjectEntity> _content = [];
///
///   MyDiagramRepository() {
///     // Initialize content, possibly loading from a data source
///     _loadInitialContent();
///   }
///
///   @override
///   Stream<List<DiagramObjectEntity>> get stream => _contentController.stream;
///
///   Future<void> _loadInitialContent() async {
///     // Load content from API, database, etc.
///     _content = await _fetchDiagramObjects();
///     _contentController.add(_content);
///   }
///
///   @override
///   void restart() {
///     _content = [];
///     _contentController.add(_content);
///     _loadInitialContent();
///   }
///
///   // Add additional methods for managing content
///   void addObject(DiagramObjectEntity object) {
///     _content.add(object);
///     _contentController.add(_content);
///   }
///
///   void dispose() {
///     _contentController.close();
///   }
/// }
/// ```
///
/// ## Usage with DiagramViewer
///
/// ```dart
/// final repository = MyDiagramRepository();
/// // Initialize or load data if needed
///
/// return DiagramViewer(
///   diagramContentRepository: repository,
///   shouldScale: true,
/// );
/// ```
abstract class DiagramContentRepository {
  /// Stream of diagram content objects that the UI can listen to.
  ///
  /// This stream emits a new list of [DiagramObjectEntity] objects whenever
  /// the diagram content changes. UI components should subscribe to this stream
  /// to receive updates and reflect content changes immediately.
  ///
  /// The stream typically emits:
  /// - When initial content is loaded
  /// - When content is added, removed, or modified
  /// - When content is filtered or sorted
  /// - When [restart] is called
  ///
  /// Implementation note: This should typically be backed by a [StreamController]
  /// in concrete implementations.
  late final Stream<List<DiagramObjectEntity>> stream;

  /// Restarts the repository, typically clearing current content and reloading.
  ///
  /// This method should:
  /// 1. Reset the internal state of the repository
  /// 2. Clear any cached content
  /// 3. Optionally reload initial content
  /// 4. Emit the new (possibly empty) content state through [stream]
  ///
  /// It's commonly used when:
  /// - The diagram needs to be reset to its initial state
  /// - The user requests a refresh of content
  /// - The underlying data source has changed significantly
  void restart();
}
