import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift_sounds/drift_sounds.dart' show DriftSoundsDatabase;
import 'package:drift_sounds_database/drift_sounds_database.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// No database was found.
class DatabaseNotFound implements Exception {
  /// Create an instance.
  const DatabaseNotFound();
}

/// Give widgets further down the tree access to the [database].
class DriftSoundsDatabaseProvider extends InheritedWidget {
  /// Create an instance.
  const DriftSoundsDatabaseProvider({
    required this.database,
    required super.child,
    super.key,
  });

  /// Provide the database which exists for [context]s.
  static DriftSoundsDatabase of(final BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<DriftSoundsDatabaseProvider>();
    if (widget == null) {
      throw const DatabaseNotFound();
    }
    return widget.database;
  }

  /// The database to use.
  final DriftSoundsDatabase database;

  /// The database itself will never change, so neither should depending
  /// widgets.
  @override
  bool updateShouldNotify(final DriftSoundsDatabaseProvider oldWidget) =>
      database != oldWidget.database;
}

/// A class to load a [DriftSoundsDatabase] from an [assetKey].
///
/// This [Widget] calls `database.close()` when `onDispose` is called.
///
/// An instance of [DriftSoundsDatabaseScope] should be placed as close to the
/// top of the widget tree as possible, to provide access to the database in as
/// many places as possible.
class DriftSoundsDatabaseScope extends StatefulWidget {
  /// Create an instance.
  const DriftSoundsDatabaseScope({
    required this.assetKey,
    required this.child,
    this.databaseFilename = 'drift_sounds.sqlite3',
    this.alwaysDelete = true,
    super.key,
  });

  /// The asset key to load the database from.
  final String assetKey;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The filename where the database will be written.
  ///
  /// This file will be located inside [getTemporaryDirectory].
  final String databaseFilename;

  /// Whether to always copy a fresh version of the database.
  ///
  /// If [alwaysDelete] is `true`, this will probably impact older systems.
  final bool alwaysDelete;

  /// Create state for this widget.
  @override
  DriftSoundsDatabaseScopeState createState() =>
      DriftSoundsDatabaseScopeState();
}

/// State for [DriftSoundsDatabaseScope].
class DriftSoundsDatabaseScopeState extends State<DriftSoundsDatabaseScope> {
  // The database to use.
  late final DriftSoundsDatabase _db;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    final assetBundle = DefaultAssetBundle.of(context);
    _db = DriftSoundsDatabase.fromLoader(() async {
      final directory = await getTemporaryDirectory();
      final file = File(path.join(directory.path, widget.databaseFilename));
      if (widget.alwaysDelete || !file.existsSync()) {
        final data = await assetBundle.load(widget.assetKey);
        if (file.existsSync()) {
          file.deleteSync(recursive: true);
        }
        file.writeAsBytesSync(data.buffer.asUint8List());
      }
      return NativeDatabase(file);
    });
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _db.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) =>
      DriftSoundsDatabaseProvider(database: _db, child: widget.child);
}
