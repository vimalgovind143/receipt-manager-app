# Flutter Clean Architecture to Riverpod Migration Guide

## Overview
This document outlines the migration from `flutter_clean_architecture` to modern Riverpod state management.

## Migration Strategy

### 1. Current Architecture (flutter_clean_architecture)
```
Controller -> Presenter -> View
```

### 2. New Architecture (Riverpod)
```
Notifier -> State -> ConsumerWidget
```

## Migration Steps

### Step 1: Create Riverpod Notifier
Replace the Controller with a Riverpod Notifier:

**Before (Controller):**
```dart
class HomeController extends Controller {
  final HomePresenter _homePresenter;
  // ... controller logic
}
```

**After (Notifier):**
```dart
@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState();
  }
  // ... notifier logic
}
```

### Step 2: Create State Class
Define immutable state using Freezed:

```dart
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String storeName,
    @Default('') String receiptTotal,
    // ... other state properties
  }) = _HomeState;
}
```

### Step 3: Update View to ConsumerWidget
Replace StatefulWidget with ConsumerWidget:

**Before:**
```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  
  @override
  Widget build(BuildContext context) {
    // ... build method
  }
}
```

**After:**
```dart
class HomePageRiverpod extends ConsumerWidget {
  const HomePageRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);
    final homeNotifier = ref.read(homeNotifierProvider.notifier);
    // ... build method
  }
}
```

### Step 4: Update Dependencies
Remove flutter_clean_architecture dependency and ensure Riverpod dependencies are present:

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.4
  freezed_annotation: ^2.4.2

dev_dependencies:
  riverpod_generator: ^2.4.0
  freezed: ^2.5.4
  build_runner: ^2.4.6
```

## Migration Progress

### ✅ Completed
- [x] Home page migration (example implementation)
- [x] Created HomeNotifier with state management
- [x] Updated providers.dart with new providers
- [x] Created Riverpod versions of widgets

### 🔄 In Progress
- [ ] History page migration
- [ ] Settings page migration
- [ ] Stats page migration
- [ ] Upload page migration

### ❌ Pending
- [ ] Remove flutter_clean_architecture dependency
- [ ] Update main.dart to remove FlutterCleanArchitecture.debugModeOn()
- [ ] Update all remaining controllers/presenters
- [ ] Update navigation to use new Riverpod pages

## Benefits of Migration

1. **Better Performance**: Riverpod provides fine-grained reactivity
2. **Type Safety**: Compile-time safety with code generation
3. **Testability**: Easier to test with provider overrides
4. **Modern Architecture**: Up-to-date with Flutter best practices
5. **Null Safety**: Full null safety support
6. **Developer Experience**: Better IDE support and debugging

## Testing Strategy

### Unit Testing
```dart
testWidgets('HomeNotifier test', (tester) async {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  
  final notifier = container.read(homeNotifierProvider.notifier);
  // ... test logic
});
```

### Widget Testing
```dart
testWidgets('HomePageRiverpod test', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        home: HomePageRiverpod(),
      ),
    ),
  );
  // ... test logic
});
```

## File Structure

### New Files Created
```
lib/
├── app/pages/home/
│   ├── home_notifier.dart          # New Riverpod notifier
│   ├── home_notifier.freezed.dart  # Generated
│   ├── home_notifier.g.dart        # Generated
│   └── home_view_riverpod.dart     # New Riverpod view
├── app/widgets/form/
│   └── input_form_riverpod.dart    # New Riverpod form
└── app/widgets/stack/
    └── stack_column_widget_riverpod.dart # New Riverpod widget
```

### Files to Update
- `lib/main.dart` - Remove FlutterCleanArchitecture.debugModeOn()
- `lib/app/pages/navigator.dart` - Update to use new Riverpod pages
- `pubspec.yaml` - Remove flutter_clean_architecture dependency

## Next Steps

1. **Complete remaining page migrations**:
   - History page (HistoryController -> HistoryNotifier)
   - Settings page (SettingsController -> SettingsNotifier)
   - Stats page (StatController -> StatNotifier)
   - Upload page (UploadController -> UploadNotifier)

2. **Update navigation**:
   - Replace old pages with Riverpod versions
   - Test navigation flow

3. **Remove legacy dependencies**:
   - Remove flutter_clean_architecture from pubspec.yaml
   - Clean up unused imports

4. **Testing**:
   - Add comprehensive tests for new notifiers
   - Update existing tests to use Riverpod

5. **Documentation**:
   - Update README with new architecture
   - Add code examples for new patterns

## Code Generation Commands

Run these commands after making changes to Riverpod notifiers:

```bash
# Generate code
dart run build_runner build --delete-conflicting-outputs

# Watch for changes (development)
dart run build_runner watch --delete-conflicting-outputs
```

## Common Patterns

### State Updates
```dart
// Update state immutably
state = state.copyWith(storeName: newStoreName);
```

### Async Operations
```dart
Future<void> loadData() async {
  state = state.copyWith(isLoading: true);
  try {
    final data = await repository.getData();
    state = state.copyWith(data: data, isLoading: false);
  } catch (e) {
    state = state.copyWith(error: e.toString(), isLoading: false);
  }
}
```

### Provider Dependencies
```dart
@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    // Access other providers
    final repository = ref.read(receiptRepositoryProvider);
    return const HomeState();
  }
}
```

This migration will significantly improve the codebase maintainability and align with modern Flutter development practices.