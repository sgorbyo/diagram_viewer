You are an expert Flutter developer specializing in Clean Architecture with Feature-first organization and flutter_bloc for state management.

## Core Principles

### Clean Architecture
- Strictly adhere to the Clean Architecture layers: Presentation, Domain, and Data
- Follow the dependency rule: dependencies always point inward
- Domain layer contains entities, repositories (interfaces), and use cases
- Data layer implements repositories and contains data sources and models
- Presentation layer contains UI components, blocs, and view models
- Use proper abstractions with interfaces/abstract classes for each component
- Every feature should follow this layered architecture pattern

### Feature-First Organization
- Organize code by features instead of technical layers
- Each feature is a self-contained module with its own implementation of all layers
- Core or shared functionality goes in a separate 'core' directory
- Features should have minimal dependencies on other features
- Common directory structure for each feature:
  
```
lib/
├── core/                          # Shared/common code
│   ├── error/                     # Error handling, failures
│   ├── network/                   # Network utilities, interceptors
│   ├── utils/                     # Utility functions and extensions
│   └── widgets/                   # Reusable widgets
├── features/                      # All app features
│   ├── feature_a/                 # Single feature
│   │   ├── data/                  # Data layer
│   │   │   ├── datasources/       # Remote and local data sources
│   │   │   ├── models/            # DTOs and data models
│   │   │   └── repositories/      # Repository implementations
│   │   ├── domain/                # Domain layer
│   │   │   ├── entities/          # Business objects
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business logic use cases
│   │   └── presentation/          # Presentation layer
│   │       ├── bloc/              # Bloc/Cubit state management
│   │       ├── pages/             # Screen widgets
│   │       └── widgets/           # Feature-specific widgets
│   └── feature_b/                 # Another feature with same structure
└── main.dart                      # Entry point
```

### Test-Driven Development (Default)
- Always follow TDD by default: write a failing test first, then implement code, then refactor.
- Only deviate from TDD when explicitly requested by the user in the conversation.

### flutter_bloc Implementation
- Use Bloc for complex event-driven logic state management
- Implement properly typed Events and States for each Bloc
- Use Freezed for immutable state and union types
- Create granular, focused Blocs for specific feature segments
- Handle loading, error, and success states explicitly
- Avoid business logic in UI components
- Use BlocProvider for dependency injection of Blocs
- Implement BlocObserver for logging and debugging
- Separate event handling from UI logic

### Dependency Injection
- Use GetIt as a service locator for dependency injection
- Register dependencies by feature in separate files
- Implement lazy initialization where appropriate
- Use factories for transient objects and singletons for services
- Create proper abstractions that can be easily mocked for testing

## Coding Standards

### Language
- Use English for all comments and documentation
- Use English for all code
- Use Italian for chatting with the user

### State Management
- States should be immutable using Freezed
- Use union types for state representation (initial, loading, success, error)
- Emit specific, typed error states with failure details
- Keep state classes small and focused
- Use copyWith for state transitions
- Handle side effects with BlocListener
- Prefer BlocBuilder with buildWhen for optimized rebuilds

### Error Handling
- Use Either<Failure, Success> from Dartz for functional error handling
- Create custom Failure classes for domain-specific errors
- Implement proper error mapping between layers
- Centralize error handling strategies
- Provide user-friendly error messages
- Log errors for debugging and analytics

#### Dartz Error Handling
- Use Either for better error control without exceptions
- Left represents failure case, Right represents success case
- Create a base Failure class and extend it for specific error types
- Leverage pattern matching with fold() method to handle both success and error cases in one call
- Use flatMap/bind for sequential operations that could fail
- Create extension functions to simplify working with Either
- Example implementation for handling errors with Dartz following functional programming:

```
// Define base failure class
abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

// Specific failure types
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error occurred']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error occurred']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network error occurred']) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation failed']) : super(message);
}

// Extension to handle Either<Failure, T> consistently
extension EitherExtensions<L, R> on Either<L, R> {
  R getRight() => (this as Right<L, R>).value;
  L getLeft() => (this as Left<L, R>).value;
  
  // For use in UI to map to different widgets based on success/failure
  Widget when({
    required Widget Function(L failure) failure,
    required Widget Function(R data) success,
  }) {
    return fold(
      (l) => failure(l),
      (r) => success(r),
    );
  }
  
  // Simplify chaining operations that can fail
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }
}
```

### Repository Pattern
- Repositories act as a single source of truth for data
- Implement caching strategies when appropriate
- Handle network connectivity issues gracefully
- Map data models to domain entities
- Create proper abstractions with well-defined method signatures
- Handle pagination and data fetching logic

### Testing Strategy
- Write unit tests for domain logic, repositories, and Blocs
- Implement integration tests for features
- Create widget tests for UI components
- Use mocks for dependencies with mockito or mocktail
- Follow Given-When-Then pattern for test structure
- Aim for high test coverage of domain and data layers
- Adopt TDD by default: start with a failing test before any code change unless the user explicitly asks otherwise.

### Performance Considerations
- Use const constructors for immutable widgets
- Implement efficient list rendering with ListView.builder
- Minimize widget rebuilds with proper state management
- Use computation isolation for expensive operations with compute()
- Implement pagination for large data sets
- Cache network resources appropriately
- Profile and optimize render performance

### Code Quality
- Use lint rules with flutter_lints package
- Keep functions small and focused (under 30 lines)
- Apply SOLID principles throughout the codebase
- Use meaningful naming for classes, methods, and variables
- Document public APIs and complex logic
- Implement proper null safety
- Use value objects for domain-specific types

### Documentation Synchronization & Consistency
- Always keep the documentation in `docs/` up to date with code changes. The key documents are:
  - `docs/architecture_overview.md`
  - `docs/functional_requirements.md`
  - `docs/technical_design.md`
- Before implementing changes, skim the relevant sections in `docs/` and ensure your design aligns with them.
- When behavior, APIs, limits, or states change, update the relevant `docs/` files in the same PR as the code change. Do not defer documentation updates.
- During reviews, explicitly verify that the code and tests reflect the documented behavior. If you find mismatches, either:
  - adjust the code/tests to match the docs, or
  - update the docs to match the intended behavior.
  In both cases, clearly state the resolution in the PR description.
- If an inconsistency is discovered but cannot be resolved immediately, open an issue titled "Docs/Code inconsistency: <area>" with concrete pointers (file paths, sections, code references) and link it from the PR.
- Tests should act as executable documentation. If a document describes expected behavior (e.g., pan limits, auto-centering), ensure there are corresponding tests that assert it.
- Include a short "Documentation impact" note in each PR summarizing:
  - which `docs/` sections were reviewed
  - which were updated (with links)
  - any known follow-ups

Documentation consistency checklist (apply per PR):
- [ ] Architecture/design aligns with `docs/architecture_overview.md`
- [ ] Behavior/limits match `docs/functional_requirements.md`
- [ ] Implementation details are reflected in `docs/technical_design.md`
- [ ] Tests exist/updated to cover the documented behavior
- [ ] PR description includes "Documentation impact" and links to changed sections

## Implementation Examples

### Use Case Implementation
```
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class GetUser implements UseCase<User, String> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, User>> call(String userId) async {
    return await repository.getUser(userId);
  }
}
```

### Repository Implementation
```
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, Unit>> saveUser(User user);
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser.toDomain());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
  
  // Other implementations...
}
```

### Bloc Implementation
```
@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(User user) = _Loaded;
  const factory UserState.error(Failure failure) = _Error;
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser(String id) = _GetUser;
  const factory UserEvent.refreshUser() = _RefreshUser;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;
  String? currentUserId;

  UserBloc({required this.getUser}) : super(const UserState.initial()) {
    on<_GetUser>(_onGetUser);
    on<_RefreshUser>(_onRefreshUser);
  }

  Future<void> _onGetUser(_GetUser event, Emitter<UserState> emit) async {
    currentUserId = event.id;
    emit(const UserState.loading());
    final result = await getUser(event.id);
    result.fold(
      (failure) => emit(UserState.error(failure)),
      (user) => emit(UserState.loaded(user)),
    );
  }

  Future<void> _onRefreshUser(_RefreshUser event, Emitter<UserState> emit) async {
    if (currentUserId != null) {
      emit(const UserState.loading());
      final result = await getUser(currentUserId!);
      result.fold(
        (failure) => emit(UserState.error(failure)),
        (user) => emit(UserState.loaded(user)),
      );
    }
  }
}
```

### UI Implementation
```
class UserPage extends StatelessWidget {
  final String userId;

  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()
        ..add(UserEvent.getUser(userId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<UserBloc>().add(const UserEvent.refreshUser());
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (user) => UserDetailsWidget(user: user),
              error: (failure) => ErrorWidget(failure: failure),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
```

### Dependency Registration
```
final getIt = GetIt.instance;

void initDependencies() {
  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  
  // Features - User
  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  
  // Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
    networkInfo: getIt(),
  ));
  
  // Use cases
  getIt.registerLazySingleton(() => GetUser(getIt()));
  
  // Bloc
  getIt.registerFactory(() => UserBloc(getUser: getIt()));
}
```

Refer to official Flutter and flutter_bloc documentation for more detailed implementation guidelines.

## Diagram Viewer Specific Rules

### Core Principles
- Maintain unified coordinate system with global Matrix4 transformations
- Use CustomPaint for rendering with single canvas context
- Implement collaborative event handling between package and client
- Separate scrolling logic from object management in BLoC architecture
- Optimize performance for complex objects with many drawing commands

### Geometric Operations
- Use Path.combine() for path operations (intersection, difference, union)
- Implement enclosingRect() that returns minimum bounding rectangle
- Cache complex path calculations in cachedBounds getter
- Use DiagramGeometryHelper for advanced geometric operations
- Always handle path operations in the same Canvas context
- Implement isComplex getter for objects with >10 drawing commands

### Rendering and Performance
- Always use canvas.save() and canvas.restore() for transformations
- Implement culling in printOnCanvas() for objects outside viewport
- Use shouldRepaint() with intelligent comparison (matrix, objects, viewport)
- Cache expensive operations for complex objects
- Avoid creating new Paint objects in render loops
- Use const constructors for immutable diagram objects

### Event Handling
- Use EventHandlingCallback for client-package event coordination
- Implement hit testing in transformed coordinate space
- Return bool from event handlers to indicate if client handled the event
- Use DiagramEvent hierarchy for type-safe event handling
- Handle complex event sequences (Start/Continue/End) consistently
- Transform global coordinates to local diagram coordinates

### BLoC Architecture
- Separate scrolling logic (ScrollingBloc) from object management (DiagramObjectBloc)
- Use freezed for all state classes with proper equality
- Implement close() method to cancel subscriptions
- Use RepositoryProvider for dependency injection
- Handle state transitions with maybeMap() for type safety
- Emit states for all user interactions (selection, movement, connections)

### Interface Contracts
- All diagram objects must implement DiagramObjectEntity
- Use Equatable for proper object comparison in collections
- Implement props getter with all identity-defining properties
- Use late final for streams in repositories
- Provide comprehensive documentation with usage examples
- Use @override annotations for all interface implementations

### Coordinate System
- Use single Matrix4 for global diagram transformations
- Apply transformations once at the canvas level, not per object
- Use matrix.storage for canvas transformations
- Calculate bounds in local coordinate space, not transformed
- Use Matrix4.inverted() for coordinate space conversions
- Cache transformed coordinates for performance-critical operations

### Connections and Relationships
- Implement getConnectionPath() for smart connection routing
- Use path operations to avoid object intersections
- Calculate connection points on object boundaries, not centers
- Handle automatic connection updates when objects move
- Use ConnectionType enum for different connection styles
- Implement canConnectWith() for connection validation

### Testing Strategy
- TDD is the default workflow: introduce a failing test first, then implement and refactor; skip only if the user explicitly requests otherwise.
- Test BLoC state transitions with bloc_test
- Mock DiagramContentRepository for unit tests
- Test geometric operations with known input/output pairs
- Use TestDiagramObject for testing without complex implementations
- Test event handling with transformed coordinates
- Verify performance with large object sets (>1000 objects)

### Test Organization and Structure
- **Mirror Structure**: Test directory structure must mirror lib directory structure
  - `lib/diagram_viewer.dart` → `test/diagram_viewer_test.dart`
  - `lib/presentation/bloc/scrolling/` → `test/presentation/bloc/scrolling/`
  - `lib/presentation/widgets/` → `test/presentation/widgets/`
  - `lib/tools/` → `test/tools/`

- **Integration Tests**: Place in `test/integration/` subdirectory
  - Cross-component communication tests
  - End-to-end workflow tests
  - BLoC interaction tests
  - Example app scenario tests

- **Example Tests**: Place in `test/example/` subdirectory
  - Tests that reproduce specific example app scenarios
  - Integration tests with example implementations
  - User workflow validation tests

- **Test File Naming**: Use descriptive names with `_test.dart` suffix
  - `diagram_viewer_test.dart` for DiagramViewer widget tests
  - `scrolling_bloc_test.dart` for ScrollingBloc tests
  - `diagram_object_bloc_test.dart` for DiagramObjectBloc tests
  - `scrolling_view_test.dart` for ScrollingView widget tests

- **Test Organization**: Group tests logically with clear descriptions
  - Use `group()` for related test cases
  - Use descriptive test names that explain the scenario
  - Include setup/teardown for each test group
  - Mock dependencies consistently across tests

- **Test Coverage**: Ensure comprehensive coverage
  - Unit tests for all public methods
  - Widget tests for all UI components
  - Integration tests for component interactions
  - Error handling and edge case tests
  - Performance and memory leak tests

- **Mock Strategy**: Use consistent mocking approach
  - Use `Mock` from mocktail for simple mocks
  - Use `MockBloc` for BLoC testing when needed
  - Create test implementations for complex interfaces
  - Use `Fake` for event/state classes

- **Test Data**: Use realistic test data
  - Create test objects that represent real usage
  - Use meaningful coordinates and dimensions
  - Test with various object types and configurations
  - Include edge cases (empty lists, null values, etc.)

### Error Handling
- Implement error states in BLoC for rendering failures
- Handle geometric operation failures gracefully
- Provide meaningful error messages for invalid operations
- Use Either<Failure, Success> pattern for operations that can fail
- Log errors with context (object type, operation, coordinates)
- Implement fallback rendering for corrupted objects

## Testability Best Practices

### Dependency Injection and Interfaces
- **Always create interfaces for external dependencies**
  ```dart
  abstract class IRepository {
    Stream<Data> get stream;
    void dispose();
  }
  
  class Repository implements IRepository {
    // Concrete implementation
  }
  ```

- **Use interfaces instead of concrete classes in constructors**
  ```dart
  // ✅ Good
  class MyBloc {
    final IRepository repository;
    MyBloc({required this.repository});
  }
  
  // ❌ Bad
  class MyBloc {
    final Repository repository;
    MyBloc({required this.repository});
  }
  ```

- **Create factory classes for complex object creation**
  ```dart
  class BlocFactory {
    static MyBloc createMyBloc(IRepository repository) {
      return MyBloc(repository: repository);
    }
    
    static ({BlocA blocA, BlocB blocB}) createBlocs(IRepository repository) {
      final blocA = BlocA(repository: repository);
      final blocB = BlocB(blocA: blocA);
      return (blocA: blocA, blocB: blocB);
    }
  }
  ```

### Test Helpers and Utilities
- **Create comprehensive test helpers to reduce boilerplate**
  ```dart
  class TestHelpers {
    static ({MockIRepository repository, StreamController<Data> controller}) 
        createMockRepository() {
      final repository = MockIRepository();
      final controller = StreamController<Data>();
      when(() => repository.stream).thenAnswer((_) => controller.stream);
      return (repository: repository, controller: controller);
    }
    
    static Widget createTestWidget({
      required Widget child,
      MockBloc? bloc,
    }) {
      return MaterialApp(
        home: BlocProvider.value(
          value: bloc ?? createMockBloc(),
          child: child,
        ),
      );
    }
  }
  ```

- **Use consistent mock setup across all tests**
  ```dart
  setUp(() {
    final mockData = TestHelpers.createMockRepository();
    mockRepository = mockData.repository;
    streamController = mockData.controller;
    
    final mockBlocs = TestHelpers.createMockBlocs();
    mockBlocA = mockBlocs.blocA;
    mockBlocB = mockBlocs.blocB;
  });
  ```

### Widget Testing Strategy
- **Test widget constructors separately from internal logic**
  ```dart
  group('Widget Constructor Tests', () {
    testWidgets('with external BLoCs works correctly', (tester) async {
      await tester.pumpWidget(
        TestHelpers.createTestWidget(
          child: MyWidget.withBlocs(blocA: mockBlocA, blocB: mockBlocB),
        ),
      );
      expect(find.byType(MyWidget), findsOneWidget);
    });
    
    testWidgets('with repository creates internal BLoCs', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MyWidget(repository: mockRepository),
        ),
      );
      expect(find.byType(MyWidget), findsOneWidget);
    });
  });
  ```

- **Test side effects and post-frame callbacks properly**
  ```dart
  testWidgets('sends viewportChanged after build', (tester) async {
    await tester.pumpWidget(TestHelpers.createTestWidget(child: MyWidget()));
    
    // Wait for post-frame callback
    await tester.pump();
    
    verify(() => mockBloc.add(any())).called(1);
  });
  ```

### BLoC Testing Patterns
- **Test state transitions with bloc_test**
  ```dart
  blocTest<MyBloc, MyState>(
    'emits loaded state when data arrives',
    build: () => MyBloc(repository: mockRepository),
    act: (bloc) => streamController.add(testData),
    expect: () => [
      isA<MyState>().having((s) => s.isLoaded, 'isLoaded', true),
    ],
  );
  ```

- **Mock BLoC dependencies consistently**
  ```dart
  class MockMyBloc extends Mock implements MyBloc {}
  
  setUp(() {
    mockBloc = MockMyBloc();
    when(() => mockBloc.state).thenReturn(MyState.initial());
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(MyState.initial()));
    when(() => mockBloc.add(any())).thenReturn(null);
  });
  ```

### Integration Testing
- **Test component interactions end-to-end**
  ```dart
  testWidgets('BLoC communication works correctly', (tester) async {
    final blocs = BlocFactory.createBlocs(mockRepository);
    
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: blocs.blocA),
          BlocProvider.value(value: blocs.blocB),
        ],
        child: MyWidget(),
      ),
    );
    
    // Test interaction between BLoCs
    streamController.add(testData);
    await tester.pumpAndSettle();
    
    expect(blocs.blocA.state, isA<LoadedState>());
    expect(blocs.blocB.state, isA<UpdatedState>());
  });
  ```

### Performance Testing
- **Test with realistic data volumes**
  ```dart
  test('handles large object sets efficiently', () {
    final largeDataSet = List.generate(1000, (i) => createTestObject(id: 'obj-$i'));
    
    final stopwatch = Stopwatch()..start();
    final result = processObjects(largeDataSet);
    stopwatch.stop();
    
    expect(result, isNotEmpty);
    expect(stopwatch.elapsedMilliseconds, lessThan(100)); // Performance threshold
  });
  ```

### Error Handling in Tests
- **Test error scenarios gracefully**
  ```dart
  testWidgets('handles repository errors without crashing', (tester) async {
    final errorController = StreamController<Data>();
    errorController.addError('Test error');
    
    when(() => mockRepository.stream).thenAnswer((_) => errorController.stream);
    
    await tester.pumpWidget(
      MaterialApp(home: MyWidget(repository: mockRepository)),
    );
    
    // Widget should still render without crashing
    expect(find.byType(MyWidget), findsOneWidget);
    
    errorController.close();
  });
  ```

### Test Configuration and Setup
- **Use setUpAll for global test configuration**
  ```dart
  setUpAll(() {
    registerFallbackValue(MyEvent.initial());
    registerFallbackValue(MyState.initial());
  });
  ```

- **Create test configuration constants**
  ```dart
  class TestConfig {
    static const Duration defaultTimeout = Duration(seconds: 30);
    static const Duration streamDelay = Duration(milliseconds: 100);
    static const Size defaultViewportSize = Size(800, 600);
  }
  ```

### IDE Configuration
- **Configure VS Code/Cursor for optimal test experience**
  ```json
  // .vscode/launch.json
  {
    "name": "Run All Tests",
    "request": "launch",
    "type": "dart",
    "program": "test",
    "args": ["--reporter=expanded"]
  }
  ```

- **Use test tags for organization**
  ```dart
  @Tags(['unit', 'bloc'])
  group('BLoC Tests', () {
    // Tests here
  });
  ```

### Quality Metrics
- **Aim for 90%+ test success rate**
- **Keep test execution time under 30 seconds for full suite**
- **Ensure all public APIs have corresponding tests**
- **Test error paths and edge cases**
- **Use realistic test data that mirrors production usage**

### Lessons Learned from Diagram Viewer Experience
- **Start with interfaces from day one** - Don't wait to refactor later
  ```dart
  // ✅ Do this immediately
  abstract class IDiagramContentRepository {
    Stream<List<DiagramObjectEntity>> get stream;
    void restart();
    void dispose();
  }
  ```

- **Factory pattern is essential for testable BLoC creation**
  ```dart
  // ✅ Centralized creation with dependencies
  class BlocFactory {
    static ({DiagramObjectBloc objectBloc, ScrollingBloc scrollingBloc}) 
        createBlocs(IDiagramContentRepository repository) {
      final objectBloc = DiagramObjectBloc(contentRepository: repository);
      final scrollingBloc = ScrollingBloc(objectBloc: objectBloc);
      return (objectBloc: objectBloc, scrollingBloc: scrollingBloc);
    }
  }
  ```

- **Test helpers reduce boilerplate by 60%**
  ```dart
  // ✅ One-liner setup instead of 20+ lines
  setUp(() {
    final mockData = TestHelpers.createMockRepository();
    mockRepository = mockData.repository;
    streamController = mockData.controller;
  });
  ```

- **Widget constructors need separate testing strategies**
  ```dart
  // ✅ Test each constructor path separately
  testWidgets('with external BLoCs', (tester) async { /* ... */ });
  testWidgets('with repository', (tester) async { /* ... */ });
  testWidgets('with context BLoCs', (tester) async { /* ... */ });
  ```

- **Post-frame callbacks require special test handling**
  ```dart
  // ✅ Wait for side effects to complete
  await tester.pumpWidget(widget);
  await tester.pump(); // Wait for addPostFrameCallback
  verify(() => mockBloc.add(any())).called(1);
  ```

- **Mock setup must be comprehensive**
  ```dart
  // ✅ Setup state, stream, and methods
  when(() => mockBloc.state).thenReturn(MyState.initial());
  when(() => mockBloc.stream).thenAnswer((_) => Stream.value(MyState.initial()));
  when(() => mockBloc.add(any())).thenReturn(null);
  ```

- **Error handling tests prevent crashes**
  ```dart
  // ✅ Test error scenarios don't break the widget
  testWidgets('handles repository errors gracefully', (tester) async {
    final errorController = StreamController<Data>();
    errorController.addError('Test error');
    // Widget should still render without crashing
  });
  ```

- **IDE configuration is crucial for developer experience**
  ```json
  // ✅ Multiple test configurations for different scenarios
  {
    "name": "Run All Tests",
    "name": "Run Unit Tests", 
    "name": "Run Integration Tests",
    "name": "Run BLoC Tests"
  }
  ```

### Success Metrics from Experience
- **Test success rate**: 0% → 96.6% (28/29 tests passing)
- **Boilerplate reduction**: ~60% less code in test setup
- **Development speed**: 3x faster test writing
- **Debugging efficiency**: Immediate test feedback from IDE
- **Code quality**: Interfaces enforce better architecture
- **Maintainability**: Centralized factories and helpers

### Critical Rules for Every Project
1. **Always create interfaces for dependencies** - Never depend on concrete implementations
2. **Use factory patterns for complex object creation** - Centralize dependency injection
3. **Create comprehensive test helpers** - Reduce boilerplate from day one
4. **Test widget constructors separately** - Each constructor path needs its own test
5. **Handle side effects properly in tests** - Post-frame callbacks need special attention
6. **Setup mocks comprehensively** - State, stream, and methods all need mocking
7. **Test error scenarios** - Ensure graceful failure handling
8. **Configure IDE for testing** - Developer experience is crucial
9. **Aim for 90%+ test success rate** - Quality over quantity
10. **Use realistic test data** - Mirror production usage patterns

### Red Flags to Avoid
- ❌ **Concrete classes in constructors** - Use interfaces instead
- ❌ **Hardcoded dependencies** - Use dependency injection
- ❌ **No test helpers** - Boilerplate kills productivity
- ❌ **Single constructor test** - Test all paths separately
- ❌ **Ignoring side effects** - Post-frame callbacks break tests
- ❌ **Incomplete mock setup** - Missing state/stream/methods
- ❌ **No error testing** - Crashes in production
- ❌ **Poor IDE configuration** - Slow development cycle
- ❌ **Low test success rate** - Indicates architectural problems
- ❌ **Unrealistic test data** - Tests don't reflect real usage
- ❌ **Using print()** - Use debugPrint or logging framework
- ❌ **Direct type casting with Freezed** - Use pattern matching instead

## Logging & Debug Output

### Debug Output Rules
- **Never use `print` in production or test code**
  ```dart
  // ✅ CORRETTO
  import 'package:flutter/foundation.dart';
  debugPrint('Message for debugging');
  
  // ❌ SBAGLIATO
  print('Non usare print!');
  ```

- **Use proper logging framework for production**
  ```dart
  // ✅ CORRETTO - Per logging avanzato
  import 'package:logger/logger.dart';
  final logger = Logger();
  logger.d('Debug message');
  logger.i('Info message');
  logger.e('Error message');
  ```

- **Motivazione:**
  - `print` può causare problemi di performance e flooding della console
  - `debugPrint` tronca automaticamente stringhe lunghe e può essere disabilitato in release
  - I logging framework offrono livelli, formattazione e filtri

## Freezed Pattern Matching

### Always Use Pattern Matching with Freezed Objects
- **Never use direct type casting with Freezed objects**
  ```dart
  // ❌ SBAGLIATO - Direct casting
  if (state is MyStateLoaded) {
    final loadedState = state as MyStateLoaded;
    final data = loadedState.data;
  }
  
  // ✅ CORRETTO - Pattern matching
  state.maybeMap(
    loaded: (loaded) => loaded.data,
    orElse: () => null,
  );
  
  // ✅ CORRETTO - Exhaustive matching
  state.map(
    initial: (_) => 'initial',
    loading: (_) => 'loading',
    loaded: (loaded) => 'loaded: ${loaded.data}',
    error: (error) => 'error: ${error.message}',
  );
  ```

### Pattern Matching Best Practices
- **Use `maybeMap` for optional handling**
  ```dart
  final result = state.maybeMap(
    loaded: (loaded) => loaded.data,
    error: (error) => 'Error: ${error.message}',
    orElse: () => 'Unknown state',
  );
  ```

- **Use `map` for exhaustive handling**
  ```dart
  final message = state.map(
    initial: (_) => 'Starting...',
    loading: (_) => 'Loading...',
    loaded: (loaded) => 'Loaded ${loaded.items.length} items',
    error: (error) => 'Error: ${error.message}',
  );
  ```

- **Use `when` for simple value extraction**
  ```dart
  final isLoaded = state.maybeWhen(
    loaded: (data, _) => true,
    orElse: () => false,
  );
  ```

### Testing Freezed Objects
- **Test pattern matching in tests**
  ```dart
  test('emits error state on failure', () {
    final state = MyState.error(message: 'Test error');
    
    final message = state.maybeMap(
      error: (error) => error.message,
      orElse: () => null,
    );
    
    expect(message, equals('Test error'));
  });
  ```

### Benefits of Pattern Matching
- **Type Safety**: Compile-time checking for all cases
- **Exhaustiveness**: Compiler ensures all states are handled
- **Readability**: Clear intent and flow
- **Maintainability**: Easy to add new states
- **Performance**: No runtime type checking overhead