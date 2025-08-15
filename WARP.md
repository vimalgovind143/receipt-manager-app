# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

Receipt Manager is a Flutter app that scans, manages, and parses receipts. It uses a Clean Architecture pattern with local storage (Hive) and connects to an external receipt parser server for OCR processing. The app is currently open-source and has monetization plans for cloud sync and ad-supported tiers.

## Common Development Commands

### Flutter Commands
```bash
# Get dependencies
flutter pub get

# Run the app (debug mode)
flutter run

# Run on specific device
flutter run -d <device_id>

# Build for Android APK
flutter build apk

# Build for iOS
flutter build ios

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# Generate code (for Drift database)
flutter packages pub run build_runner build

# Clean generated files and rebuild
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Database Code Generation
The app uses Drift (formerly Moor) for database operations. When modifying database schemas, run:
```bash
flutter packages pub run build_runner build
```

### Testing Single Files
```bash
flutter test test/widget_test.dart
```

### Platform-Specific Commands
```bash
# Clean build artifacts
flutter clean

# Check Flutter installation
flutter doctor

# List connected devices
flutter devices
```

## Architecture Overview

The app follows Clean Architecture with three main layers:

### 1. Presentation Layer (`lib/app/`)
- **Pages**: Four main sections with MVP pattern
  - `home/`: Receipt creation and camera interface
  - `history/`: Receipt list and management
  - `stats/`: Analytics and charts using Syncfusion
  - `settings/`: Configuration including API tokens and server settings
- **Widgets**: Reusable UI components (floating buttons, forms, stats cards)
- **Navigation**: Bottom tab navigation via `navigator.dart`

### 2. Domain Layer (`lib/domain/`)
- **Entities**: Core business objects (Category)
- **Repository Abstractions**: Interface contracts (`abstract_repository.dart`)
- **Use Cases**: Business logic (`receipt_usecase.dart`)
- **Exceptions**: Custom error handling

### 3. Data Layer (`lib/data/`)
- **Local Storage**: Hive for settings, Drift for structured data
- **Database Schema**: 
  - `receipts`: Main receipt data
  - `stores`: Store information
  - `tags`: Receipt tags/categories  
  - `categories`: Expense categories
- **Repository Implementation**: `DataReceiptRepository` implements domain contracts

### 4. External Integration
- **Receipt Parser Server**: External API for OCR processing
- **Upload Controller**: Handles multipart form uploads to `/api/upload`
- **Configuration**: Dynamic server settings via Hive storage

## Key Technical Details

### Database (Drift/SQLite)
- Schema version: 10
- Foreign keys enabled
- Platform-specific implementations (native vs web)
- DAO pattern for data access

### External API Integration
- Endpoint: `POST /api/upload`
- Configurable server (domain/IP, HTTPS/HTTP, reverse proxy)
- Image processing options (grayscale, blur, rotation)
- Authentication via access tokens

### Internationalization
- Supports English and German
- Generated files in `lib/generated/`
- Uses flutter_localizations

### State Management
- Clean Architecture with Presenters and Controllers
- flutter_clean_architecture package
- BLoC pattern for some components

### Image Processing
- Camera integration via image_picker
- File upload with flutter_uploader
- Configurable image preprocessing

## Development Notes

### Monetization Plans
The app has documented plans for:
- AdMob integration for free tier
- In-app purchases for premium features
- Firebase cloud sync implementation
- Migration from local-only to cloud storage

### External Dependencies
The app connects to a separate [receipt-parser-server](https://github.com/ReceiptManager/receipt-parser-server) for OCR functionality. Server configuration is managed through the settings UI.

### Platform Support
- Android: Gradle Kotlin DSL configuration
- iOS: Podfile with platform target iOS 12.0
- Cross-platform compatibility via Flutter

## Important Configuration Files

- `pubspec.yaml`: Dependencies and Flutter configuration
- `analysis_options.yaml`: Dart linting rules
- `android/build.gradle.kts`: Android build configuration
- `ios/Podfile`: iOS dependencies
- `lib/app/constants.dart`: App-wide configuration constants
