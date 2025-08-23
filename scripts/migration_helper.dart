#!/usr/bin/env dart

/*
 * Migration Helper Script
 * 
 * This script helps identify files that need to be migrated from 
 * flutter_clean_architecture to Riverpod.
 */

import 'dart:io';

void main() async {
  print('🔄 Flutter Clean Architecture to Riverpod Migration Helper\n');
  
  await findControllersAndPresenters();
  await findCleanArchitectureImports();
  await checkMigrationProgress();
  
  print('\n✅ Migration analysis complete!');
  print('\n📋 Next steps:');
  print('1. Migrate remaining controllers to Riverpod notifiers');
  print('2. Update views to use ConsumerWidget');
  print('3. Remove flutter_clean_architecture dependency');
  print('4. Run tests to ensure everything works');
}

Future<void> findControllersAndPresenters() async {
  print('🔍 Finding Controllers and Presenters...\n');
  
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    print('❌ lib directory not found');
    return;
  }
  
  await for (final entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = await entity.readAsString();
      
      if (content.contains('extends Controller') || 
          content.contains('extends Presenter')) {
        print('📄 ${entity.path}');
        
        if (content.contains('extends Controller')) {
          print('   - Contains Controller class');
        }
        if (content.contains('extends Presenter')) {
          print('   - Contains Presenter class');
        }
      }
    }
  }
}

Future<void> findCleanArchitectureImports() async {
  print('\n🔍 Finding flutter_clean_architecture imports...\n');
  
  final libDir = Directory('lib');
  if (!libDir.existsSync()) return;
  
  await for (final entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = await entity.readAsString();
      
      if (content.contains('flutter_clean_architecture')) {
        print('📄 ${entity.path}');
        print('   - Uses flutter_clean_architecture');
      }
    }
  }
}

Future<void> checkMigrationProgress() async {
  print('\n📊 Migration Progress...\n');
  
  final libDir = Directory('lib');
  if (!libDir.existsSync()) return;
  
  int totalControllers = 0;
  int migratedNotifiers = 0;
  int totalPresenters = 0;
  
  await for (final entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = await entity.readAsString();
      
      if (content.contains('extends Controller')) {
        totalControllers++;
      }
      if (content.contains('extends Presenter')) {
        totalPresenters++;
      }
      if (content.contains('@riverpod') && content.contains('Notifier')) {
        migratedNotifiers++;
      }
    }
  }
  
  print('Controllers found: $totalControllers');
  print('Presenters found: $totalPresenters');
  print('Riverpod Notifiers created: $migratedNotifiers');
  
  final totalLegacy = totalControllers + totalPresenters;
  if (totalLegacy > 0) {
    final progressPercent = ((migratedNotifiers / totalLegacy) * 100).round();
    print('Migration progress: $progressPercent% ($migratedNotifiers/$totalLegacy)');
  }
}