import 'package:drift/drift.dart';
import 'package:drift/web.dart';

DatabaseConnection createDriftDatabaseConnection() {
  return DatabaseConnection(WebDatabase('db'));
}