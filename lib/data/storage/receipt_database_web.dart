import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';

/// Creates a database connection optimized for web using WASM.
/// This follows the modern drift web setup pattern.
DatabaseConnection createDriftDatabaseConnection() {
  return DatabaseConnection.delayed(Future(() async {
    try {
      final result = await WasmDatabase.open(
        databaseName: 'receipt_manager_db',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.dart.js'),
      );
      
      if (result.missingFeatures.isNotEmpty) {
        appLogger.warning(
          'Database missing features - some functionality may be limited: ${result.missingFeatures.map((f) => f.toString()).join(', ')}'
        );
      } else {
        appLogger.info('Drift WASM database initialized successfully');
      }
      
      return DatabaseConnection(result.resolvedExecutor);
    } catch (error, stackTrace) {
      appLogger.error(
        'Failed to initialize drift web database',
        error,
        stackTrace,
      );
      rethrow;
    }
  }));
}
